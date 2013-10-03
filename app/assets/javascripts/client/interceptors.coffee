angular.module('skeletonApp')
  .factory 'authInterceptor', ($q,$log,$rootScope) ->
    interceptor = {
      response: (response) ->
        $log.log('RESPONSE.STATUS: ' + response.status)
        return response || $q.when(response)

      responseError: (rejection) ->
        $log.log(rejection)
        if rejection.status == 401
          $log.log('UNAUTHORIZED')
          $rootScope.$broadcast('event:unauthorized')
        return $q.reject(rejection)
    }

    return interceptor
