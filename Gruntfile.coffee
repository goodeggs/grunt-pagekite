module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  grunt.loadTasks 'tasks'

  grunt.initConfig
    jshint:
      all: 'tasks/*.js'
      options:
        node: true

    pagekite:
      options:
        optfile: 'pagekite.rc'
        # kitename: 'your-kite.pagekite.me'
        # port: 3000
        # secret: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

  grunt.registerTask 'test', ['jshint']

  grunt.registerTask 'default', ['test']