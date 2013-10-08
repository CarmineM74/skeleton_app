angular.module('utilities.decorators.log',[])
  .config(['$provide', ($provide) ->
    $provide.decorator('$log', ($delegate) ->
      debugFn = $delegate.debug
      $delegate.debug = ->
        args = [].slice.call(arguments)
        now = moment().format('DD/MM/YYYY HH:mm:ss')
        args[0] = now + " - " + args[0]
        debugFn.apply(null,args)

      return $delegate
    )
  ])
