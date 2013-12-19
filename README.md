grunt-pagekite
==============

Publish a local server to the internet via [PageKite](https://pagekite.net/).

```js
grunt.initConfig({
  pagekite: {
    options: {
      kitename: 'your-kite.pagekite.me',
      port: 3000,
      secret: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    }
  }
});
```

Getting Started
------------------
Grunt `~0.4.1`

You should be comfy with the [grunt basics](http://gruntjs.com/getting-started) and [npm](https://npmjs.org/doc/README.html) so you can install this in your project

```shell
> npm install grunt-pagekite --save-dev
```

You'll also need a PageKite [account](https://pagekite.net/).

Configure PageKite directly in your Gruntfile:

```js
grunt.loadNpmTasks('grunt-pagekite');

grunt.initConfig({
  pagekite: {
    options: {
      kitename: 'your-kite.pagekite.me',
      port: 3000,
      secret: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    }
  }
});
```

Or point the Gruntfile at your PageKite configuration:

```js
grunt.initConfig({
  pagekite: {
    options: {
      optfile: 'pagekite.rc'
    }
  }
});
```

There's an example configuration in `pagekite.example.rc`.

Examples
--------
Check out `Gruntfile.coffee` for an example of starting PageKite, then an express server, then running tests against the server through the PageKite proxy.

Running Tests
-------------

You'll need to configure `pagekite.rc` with your PageKite account:

```shell
> cp pagekite.example.rc pagekite.rc
> vi pagekite.rc
> npm install
> npm test
```