( =(exports) ->
		'use strict'
		STORAGE_KEY = 'todos-vuejs'
		Firebase = require('firebase')
		mainRef = new Firebase("https://incandescent-heat-4447.firebaseio.com")
		mainRef.child('/todos-coffee-vue')
		exports.todoStorage = 
			fetch: ->
				JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]')
			save: (todos) -> 
				localStorage.setItem(STORAGE_KEY, JSON.stringify(todos))
				return
		return) \
(window)