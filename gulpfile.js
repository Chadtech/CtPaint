var gulp = require('gulp');
var concatenation = require('gulp-concat');
var coffeescriptCompiler = require('gulp-coffee');

gulp.task('doAllTheScriptsTogether', function() {
  return gulp.src([
    './initialization/globalVariables.coffee',
    './initialization/palette.coffee',
    './initialization/select.coffee',
    './initialization/functionsOfConvenience.coffee',
    './initialization/globalDeclarationOfCanvases.coffee',
    './initialization/glyphsAndStrings.coffee',

    './tools/zoom.coffee',
    './tools/select.coffee',
    './tools/sample.coffee',
    './tools/fill.coffee',
    './tools/square.coffee',
    './tools/circle.coffee',
    './tools/line.coffee',
    './tools/point.coffee',
    './tools/flip.coffee',
    './tools/rotate.coffee',
    './tools/invert.coffee',
    './tools/replace.coffee',
    './tools/scale.coffee',
    './tools/resize.coffee',
    './tools/horizontalColorSwap.coffee',
    './tools/verticalColorSwap.coffee',
    './tools/colorChange.coffee',
    './initialization/tool.coffee',

    'renderingDrawingAndOrganizing.coffee',
    'keyListening.coffee',
    'bodyAndJquery.coffee',
    ])
    .pipe(concatenation('ctpaint.coffee'))
    .pipe(gulp.dest(''));
});

gulp.task('default', ['doAllTheScriptsTogether'], function(){});