angular.module('skeletonApp',['ngRoute','ngResource','ui.bootstrap','ui.bootstrap.datetimepicker','skeletonApp.controllers','skeletonApp.services','utilities.decorators.log'])
  .config ($routeProvider,$httpProvider) ->

    $httpProvider.defaults.headers.common['Accept'] = 'application/json'
    $httpProvider.interceptors.push('authInterceptor')

    $routeProvider
      .when '/',
        controller: 'MainCtrl'
        templateUrl: 'assets/client/views/main/index.html'
      .otherwise
        redirectTo: '/'

