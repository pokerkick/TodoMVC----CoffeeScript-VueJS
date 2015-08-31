( =(app , Router) ->
	'use strict'
	router = new Router

	['all', 'active', 'completed'].forEach = (visibility) -> 
		router.on(visibility,  ->
		 app.visibility = visibility
		 return
		)
		return
	router.configure
		notfound: ->
			window.location.hash = ''
			app.visibility = 'all'
			return

	router.init
	return) \
(app), \
(Router)
