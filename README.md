# Text Me Later

To run in dev mode:

    gulp


## TODO

x Set up Gulp
  x Runs a live reload server
  x JSX compile step on a watch or during live reload

```coffeescript
      gulp.src('**/*.jsx')
        .pipe( react() )
        .pipe( rename extname: '.js' )
        .pipe( gulp.dest '.dist' )
```

o Do something with React
  x Install
  x Understand basic raw js structure
  o practice from https://www.youtube.com/watch?v=lAn7GVoGlKU

o Write data structures that represent the app in different states
  o new user
  o user with history and 2 tasks


