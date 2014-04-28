/*
 * grunt-pagekite
 *
 * Licensed under the MIT license.
 */

'use strict';

var pkg = require('../package.json');

module.exports = function(grunt) {
  grunt.registerTask('pagekite', pkg.description, function(task, target) {
    var spawn = require('child_process').spawn;

    var started = false,
        done = this.async(),
        options = this.options(),

        optfile = options.optfile,
        // -- OR ----
        port = options.port,
        kitename = options.kitename,
        secret = options.secret,
        frontend = options.frontend;


    grunt.log.writeln('Connecting to pagekite...');
    var args = [__dirname+'/pagekite.py'];
    if (kitename && port && secret) {
      args.push('--clean', '--default');
      args.push('--service_on=http:'+kitename+':localhost:'+port+':'+secret);
      
      if (frontend)
        args.push('--frontend='+frontend);

    } else if (optfile) {
      args.push('--clean', '--default');
      args.push('--optfile=' + options.optfile);
    }
    var kite = spawn('python', args);

    kite.stdout.on('data', function(data) {
      if (!started && (
        /status=0x11000/.test(data) ||
        /status=0x1000/.test(data)
      )) {
        started = true;
        var hostname = /bid=([\w:\.]+);/.exec(data)[1];
        grunt.log.ok("Flying as " + hostname);
        done();
      } else if(/err=/.test(data)) {
        grunt.log.error(data);
        done(data);
      } else {
        grunt.verbose.writeln(data);
      }
    });

    kite.stderr.on('data', function(data) {
      grunt.log.error(data);
    });

    process.on('exit', function() {
      kite.kill();
    });
  });
};
