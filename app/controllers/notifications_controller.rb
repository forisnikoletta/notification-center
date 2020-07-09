class NotificationsController < JSONAPI::ResourceController
  before_action :set_notification, only: [:show, :update, :destroy]
  access client: [:show, :index], client: {except: [:new, :create, :update, :edit]}, admin: :all

  # GET /notifications
  def index_admin
    @notifications = Notification.all

    render json: @notifications
  end

  def index
    @notifications = Notification.where(users_id: current_user.id)

    render json: @notifications
  end

  # GET /notifications/1
  def show
    if @notifications.users_id == current_user.id
      @notifications.update_attributes(:seen => Time.now)
    end
    render json: @notification
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:title, :body, :users_id, :seen)
    end
end
