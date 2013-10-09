angular.module('skeletonApp',[
  'ngRoute'
  ,'ngResource'
  ,'ui.bootstrap'
  ,'ui.bootstrap.datetimepicker'
  ,'utilities.decorators.log'
  ,'skeletonApp.controllers'
  ,'skeletonApp.services'
])
  .config ($routeProvider,$httpProvider) ->

    $httpProvider.defaults.headers.common['Accept'] = 'application/json'
    $httpProvider.interceptors.push('authInterceptor')

    $routeProvider
      .when '/',
        controller: 'MainCtrl'
        templateUrl: 'assets/client/views/main/index.html'
      .otherwise
        redirectTo: '/'

