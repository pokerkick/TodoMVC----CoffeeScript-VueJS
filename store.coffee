( (exports) ->
		'use strict'

		mainRef = new Firebase 'https://incandescent-heat-4447.firebaseio.com'

		todos = []

		exports.todoStorage = 
			fetch: ->
				mainRef.child '/todos'
					.on 'child_added', (child) ->
						key = child.key()
						value = child.val()

						todos.push value # TODO: order array by some attribute

				todos

			push: (todo) ->
				mainRef.child '/todos'
					.push todo

		return) \
(window)