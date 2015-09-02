(function(exports) {
  'use strict';
  var Firebase, STORAGE_KEY, mainRef;
  STORAGE_KEY = 'todos-vuejs';
  //Firebase = require('firebase');
  //mainRef = new Firebase("https://incandescent-heat-4447.firebaseio.com");
  //mainRef.child('/todos-coffee-vue');
  exports.todoStorage = {
    fetch: function() {
      return JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]');
    },
    save: function(todos) {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(todos));
    }
  };
})(window);
