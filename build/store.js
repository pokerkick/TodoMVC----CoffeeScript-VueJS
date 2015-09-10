(function(exports) {
  'use strict';
  var mainRef, todos;
  mainRef = new Firebase('https://incandescent-heat-4447.firebaseio.com');
  todos = [];
  exports.todoStorage = {
    fetch: function() {
      mainRef.child('/todos').on('child_added', function(child) {
        var key, value;
        key = child.key();
        value = child.val();
        return todos.push(value);
      });
      return todos;
    },
    push: function(todo) {
      return mainRef.child('/todos').push(todo);
    }
  };
})(window);
