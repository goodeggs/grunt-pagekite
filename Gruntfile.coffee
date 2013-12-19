module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  grunt.loadTasks 'tasks'

  {kitename, secret, port} = require './pagekite.json'

  grunt.initConfig
    jshint:
      all: 'tasks/*.js'
      options:
        node: true

    pagekite:
      options:
        kitename: kitename
        secret: secret
        port: port

    connect:
      server:
        options:
          port: port
          base: 'test/fixtures'

    simplemocha:
      all: 'test/*.test.coffee'

  grunt.registerTask 'test', [
    'jshint'
    'connect'
    'pagekite'
    'simplemocha'
  ]

  grunt.registerTask 'default', ['test']