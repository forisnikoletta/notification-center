❤ Set Up Rails Devise Authentication With Angular:

Step 1
First you need to install ng-token-auth. This expects you to use Bower and if you do, then all you have to do is to run:

$ bower install --save ng-token-auth
This will install the library and save it as a dependency in bower.json file inside your project.


Step 2
Now, angular needs to know to use ng-token-auth in your application, so you have to add it as a dependency for the angular module.

Example code:

angular
    .module('angularRails', 
    ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngMessages', 
    'ngAria', 'ngResource', 'ui.router', 'ui.bootstrap', 'ng-token-auth']);

Step 3
Next, you need to configure ng-token-auth by calling .config() on the module. There are many options you can adjust there, so I highly advise you to check out the documentation. Here's an example of a simple configuration where you only change API url to where the angular app will make its calls:

angular.module('angularRails')
   .config(function($authProvider) {
       $authProvider.configure({
           apiUrl: 'http://localhost:3000'
       });
   });


apiUrl points to your localhost rails server. Normally this variable should be put inside a config file, but for the sake of simplicity in this tutorial we will just leave it like that.

Step 4
Since you configured your library to make requests to the proper URL, you can finally use it in the app. All available methods can be found in ng-token-auth documentation (https://github.com/lynndylanhurley/ng-token-auth#api).
