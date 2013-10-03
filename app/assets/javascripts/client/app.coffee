angular.module('skeletonApp',['ngRoute','ngResource'])
  .config ($routeProvider,$httpProvider) ->
    $httpProvider.defaults.headers.common['Accept'] = 'application/json'
    $routeProvider
      .when '/',
        controller: 'MainCtrl'
        templateUrl: 'assets/client/views/main/index.html'
      .otherwise
        redirectTo: '/'

