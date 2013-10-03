angular.module('skeletonApp')
  .controller 'MainCtrl', ($log,$scope,SessionSvc) ->
    ctrlname = '[MainCtrl]'
    $log.log(ctrlname + ': Initializing')

    $scope.$on('event:logout', -> alert('logout'))
    $scope.$on('event:current_user_info:success', -> $log.log("Current user: " + JSON.stringify(SessionSvc.currentUser)))

    $scope.logout = ->
      $log.log('Logging out ...')
      SessionSvc.logout()

    $scope.info = ->
      $log.log(ctrlname + ": fetching current user info ...")
      SessionSvc.current_user_info()

