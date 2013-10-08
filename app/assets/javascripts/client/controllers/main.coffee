angular.module('skeletonApp')
  .controller 'MainCtrl', ($log,$scope,$location,$window,SessionSvc) ->
    ctrlname = '[MainCtrl]'
    $log.log(ctrlname + ': Initializing')

    $scope.$on('event:logout', -> $scope.logoutCompleted())
    $scope.$on('event:current_user_info:success',-> $scope.currentUserRetrieved())
    $scope.$on('event:unauthorized', -> $scope.unauthorizedAction())

    $scope.mydate = "" 

    $scope.logout = ->
      $log.log(ctrlname + ': Logging out ...')
      SessionSvc.logout()

    $scope.logoutCompleted = ->
      $log.log(ctrlname + ': Logout completed. Redirecting to / ...')
      $window.location.href = '/'

    $scope.info = ->
      $log.log(ctrlname + ": fetching current user info ...")
      SessionSvc.current_user_info()

    $scope.currentUserRetrieved = ->
      $scope.mydate = SessionSvc.currentUser.created_at

    $scope.unauthorizedAction = ->
      $window.location.href = '/'
