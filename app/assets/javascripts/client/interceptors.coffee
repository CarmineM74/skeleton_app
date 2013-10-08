angular.module('skeletonApp')
  .factory 'authInterceptor', ($q,$log,$rootScope) ->
    interceptor = {
      response: (response) ->
        $log.debug('RESPONSE.STATUS: ' + response.status)
        return response || $q.when(response)

      responseError: (rejection) ->
        $log.debug(rejection)
        if rejection.status == 401
          $log.debug('UNAUTHORIZED')
          $rootScope.$broadcast('event:unauthorized')
        return $q.reject(rejection)
    }

    return interceptor
