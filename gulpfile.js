var gulp = require('gulp');
var concatenation = require('gulp-concat');
var coffeescriptCompiler = require('gulp-coffee');

gulp.task('doAllTheScriptsTogether', function() {
  return gulp.src([
    './initialization/globalVariables.coffee',
    './initialization/palette.coffee',
    './initialization/colorChange.coffee',

    './initialization/functionsOfConvenience.coffee',
    './initialization/globalDeclarationOfCanvases.coffee',
    './initialization/glyphsAndStrings.coffee',

    './initialization/select.coffee',
    './initialization/sample.coffee',
    './initialization/fill.coffee',
    './initialization/square.coffee',
    './initialization/circle.coffee',
    './initialization/line.coffee',
    './initialization/point.coffee',
    './initialization/resize.coffee',
    './initialization/horizontalColorSwap.coffee',
    './initialization/verticalColorSwap.coffee',

    './initialization/resize.coffee',

    './initialization/rendering.coffee',
    './initialization/keyListening.coffee',

    './postures/zoom.coffee',
    './postures/select.coffee',
    './postures/sample.coffee',
    './postures/fill.coffee',
    './postures/square.coffee',
    './postures/circle.coffee',
    './postures/line.coffee',
    './postures/point.coffee',

    './initialization/toolDeclaration.coffee',

    './mainAct/mainAct.coffee',

    ])
    .pipe(concatenation('ctpaint.coffee'))
    .pipe(gulp.dest(''));
});

gulp.task('default', ['doAllTheScriptsTogether'], function(){});