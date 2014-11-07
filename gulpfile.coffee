# What this file does:
# --------------------
# Concats   JS, CSS, and lib to .dist/
# Starts    livereloading server
# TODO:     source maps that work

gulp        = require 'gulp'
concat      = require 'gulp-concat'
clean       = require 'gulp-clean'
browserSync = require 'browser-sync'


# --------------------------------------- Location Config
locations =
  css:  'app/**/*.css'
  html: 'app/*.html'
  js: [
    'app/**/*.js'
    '!bower_components/**/*.js'
  ]
  lib: [
    'bower_components/lodash/dist/lodash.min.js'
    'bower_components/chartjs/Chart.js'
    'bower_components/amcharts/dist/amcharts/amcharts.js'
    'bower_components/amcharts/dist/amcharts/serial.js'
    'bower_components/amcharts/dist/amcharts/themes/none.js'
  ]
  app: 'app'
  dist: '.dist'



# --------------------------------------- Task Flows
gulp.task 'clean', -> gulp.src(locations.dist).pipe clean()

gulp.task 'buildLib', ->
  gulp.src(locations.lib)
  .pipe( concat('lib.js') )
  .pipe( gulp.dest locations.dist )

gulp.task 'buildJs', ->
  gulp.src(locations.js)
    .pipe( concat('all.js') )
    .pipe( gulp.dest locations.dist )

gulp.task 'buildHtmlCss', ->
  gulp.src(locations.css)
    .pipe( concat('all.css') )
    .pipe( gulp.dest locations.dist )
  gulp.src(locations.html)
    .pipe( gulp.dest locations.dist )

gulp.task 'liveServer', ->
  browserSync server: baseDir: locations.dist
  gulp.watch locations.js,   [ 'buildJs' ]
  gulp.watch locations.css,  [ 'buildHtmlCss' ]
  gulp.watch locations.html, [ 'buildHtmlCss' ]
  gulp.watch [
    "**"
  ],
  cwd: locations.dist,
  browserSync.reload



# --------------------------------------- Task Bundles
gulp.task 'build',    [ 'buildHtmlCss', 'buildLib', 'buildJs' ]
gulp.task 'default',  [ 'clean', 'build', 'liveServer' ]



