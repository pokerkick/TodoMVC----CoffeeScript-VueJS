( =(exports) ->
	'use strict'
	filters = 
		all: (todos) -> 
			todos
		archive: (todos) -> 
			todos.filter  (todo) -> 
				!todo.completed
		completed: (todos) -> 
			todos.filter  (todo) -> 
				todo.completed

	exports.app = new Vue
		el: ' .todoapp'
		data:{
			todos: todoStorage.fetch()
			newTodo: ''
			editedTodo: null
			visibility: 'all'
		}
		ready: ->
			this.$watch('todos',  (todos) -> 
				todoStorage.save(todos)
				return
			{deep: true} )
			return 
		directives: 
			'todo-focus': (value) -> 
				if !value
					return
				el = this.el
				setTimeout(->
					(el.focus)
					return
				0)
				return					
		computed:
			filteredTodos: ->
				filters[this.visibility](this.todos)
			remaining: ->
				filters.active(this.todos).length
			allDone:
				get: ->
					this.remaining is 0
				set: (value) ->
					this.todos.forEach = (todo) -> 
						todo.completed = value
						return
					return
				

		methods:
			addTodo: ->
				value = this.newTodo and this.newTodo.trim()
				if !value
					return
				this.todos.push({ title: value, completed: false})
				this.newTodo = ''
				return
			removeTodo: (todo) ->
				this.todos.$remove(todo)
				return
			editTodo: (todo) ->
				this.beforeEditCache = todo.title
				this.editedTodo = todo
				return
			doneEdit: (todo) ->
				if !this.editedTodo
					return
				this.editedTodo = null
				todo.title = todo.title.trim()
				if !todo.title
					this.removeTodo(todo)
					return
			cancelEdit: (todo) ->
				this.editedTodo = null
				todo.title = this.beforeEditCache
				return
			removeCompleted: ->
				this.todos = filters.active(this.todos)
				return
	return) \
(window)