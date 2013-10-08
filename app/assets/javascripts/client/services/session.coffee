angular.module('skeletonApp.services',[])
  .factory 'SessionSvc', ($log,$resource,$rootScope,$location) ->
    svcname = '[SessionSvc]'
    $log.debug(svcname + ': Initializing')

    session = $resource('/api/sessions',{},
      {current_user: {url: '/api/current_user', method: 'GET', isArray: false}}
    )

    svc = {
      currentUser: {} 

      current_user_info: ->
        session.current_user(
          (data) ->
            svc.currentUser = data.data.user
            $rootScope.$broadcast('event:current_user_info:success')
          ,(response) ->
            svc.currentUser = undefined
            $rootScope.$broadcast('event:current_user_info:failure')
        )

      logout: ->
        session.delete(
          (data) ->
            $log.debug(svcname + ': LOGOUT COMPLETED')
            $rootScope.$broadcast('event:logout')
          ,(response) ->
            $log.debug(svcname + ': LOGOUT FAILED')
            $rootScope.$broadcast('event:logout_failed')
        )
        svc.currentUser = undefined
        $location.path('/')
    }

    return svc
