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
    './initialization/flip.coffee',
    './initialization/rotate.coffee',
    './initialization/invert.coffee',
    './initialization/replace.coffee',
    './initialization/scale.coffee',
    './initialization/resize.coffee',
    './initialization/horizontalColorSwap.coffee',
    './initialization/verticalColorSwap.coffee',
    './initialization/copy.coffee',
    './initialization/paste.coffee',
    './initialization/cut.coffee',
    './initialization/cursorColor.coffee',
    './initialization/undo.coffee',
    './initialization/redo.coffee',
    './initialization/resize.coffee',
    './initialization/zoom.coffee',
    './initialization/all.coffee',
    './initialization/modeChange.coffee',
    './initialization/magnitudeUp.coffee',
    './initialization/magnitudeDown.coffee',

    './initialization/rendering.coffee',
    './initialization/keyListening.coffee',
    './initialization/mouseListening.coffee',

    './postures/zoom.coffee',
    './postures/select.coffee',
    './postures/sample.coffee',
    './postures/fill.coffee',
    './postures/square.coffee',
    './postures/circle.coffee',
    './postures/line.coffee',
    './postures/point.coffee',
    './postures/emptyPosture.coffee',
    './postures/horizontalColorSwap.coffee',
    './postures/verticalColorSwap.coffee',

    './initialization/toolDeclaration.coffee',

    './mainAct/mainAct.coffee',

    ])
    .pipe(concatenation('ctpaint.coffee'))
    .pipe(gulp.dest(''));
});

gulp.task('default', ['doAllTheScriptsTogether'], function(){});