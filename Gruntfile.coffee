module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  grunt.loadTasks 'tasks'

  grunt.initConfig
    jshint:
      all: 'tasks/*.js'
      options:
        node: true

  grunt.registerTask 'test', ['jshint']

  grunt.registerTask 'default', ['test']