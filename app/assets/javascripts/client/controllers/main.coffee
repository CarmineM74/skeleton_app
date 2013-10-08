angular.module('skeletonApp.controllers',[])
  .controller 'MainCtrl', ($log,$scope,$location,$window,SessionSvc) ->
    ctrlname = '[MainCtrl]'
    $log.debug(ctrlname + ': Initializing')

    $scope.$on('event:logout', -> $scope.logoutCompleted())
    $scope.$on('event:current_user_info:success',-> $scope.currentUserRetrieved())
    $scope.$on('event:unauthorized', -> $scope.unauthorizedAction())

    $scope.mydate = "" 

    $scope.logout = ->
      $log.debug(ctrlname + ': Logging out ...')
      SessionSvc.logout()

    $scope.logoutCompleted = ->
      $log.debug(ctrlname + ': Logout completed. Redirecting to / ...')
      $window.location.href = '/'

    $scope.info = ->
      $log.debug(ctrlname + ": fetching current user info ...")
      SessionSvc.current_user_info()

    $scope.currentUserRetrieved = ->
      $scope.mydate = SessionSvc.currentUser.created_at

    $scope.unauthorizedAction = ->
      $window.location.href = '/'
