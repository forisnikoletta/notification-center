class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery :null_session

  respond_to? :json
end
