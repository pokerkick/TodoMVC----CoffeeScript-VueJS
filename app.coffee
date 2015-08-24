
(exports) ->
	filters = 
		all: (todos) -> 
			todos
		archive: (todos) -> 
			todos.filter = (todo) -> 
				!todo.completed
		completed: (todos) -> 
			todos.filter = (todo) -> 
				todo.completed

	exports.app = new Vue
		el: ' .todoapp'
		data:{
			todos: todoStorage.fetch
			newTodo: ''
			editedTodo: null
			visibility: 'all'
		}
		ready: ->
			this.$watch('todos',  (todos) -> 
				todoStorage.save(todos)
			{deep: true} )
		directives: 
			'todo-focus': (value) -> 
				if !value
					return
				el = this.el
				setTimeout =  ->
					el.focus
					0
		computed:
			filteredTodos: ->
				filters[this.visibility](this.todos)
			remaining: ->
				filters.active(this.todos).length
			allDone: ->
				get: ->
					this.remaining is 0
				set: (value) ->
					this.todos.forEach = (todo) -> 
						todo.completed = value

		methods:
			addTodo: ->
				value = this.newTodo and this.newTodo.trim
				if !value
					return
				this.todos.push({ title: value, completed: false})
				this.newTodo = ''
			removeTodo: (todo) ->
				this.todos.$remove(todo)
			editTodo: (todo) ->
				this.beforeEditCache = todo.title
				this.editedTodo = todo
			doneEdit: (todo) ->
				if !this.editedTodo
					return
				this.editedTodo = null
				todo.title = todo.title.trim
				if !todo.title
					this.removeTodo(todo)
			cancelEdit: (todo) ->
				this.editedTodo = null
				todo.title = this.beforeEditCache
			removeCompleted: ->
				this.todos = filters.active(this.todos)
(window)