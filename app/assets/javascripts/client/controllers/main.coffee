angular.module('skeletonApp')
  .controller 'MainCtrl', ($log,$scope) ->
    ctrlname = '[MainCtrl]'
    $log.log(ctrlname + ': Initializing')
