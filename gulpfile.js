// //////////////////////////////////////////////
// Commentary provided by Bob Newhart
// ////////////////////////////////////////////

var gulp = require('gulp'),
	gutil = require('gulp-util')
	uglify = require('gulp-uglify');
	plumber = require('gulp-plumber');
	rename = require('gulp-rename');
	webpack = require('webpack')
	coffee = require('gulp-coffee');
// //////////////////////////////////////////////
// Script Task
// ////////////////////////////////////////////
gulp.task('scripts', ['coffee'], function(){
	//console.log('Speak Fools!');
	gulp.src([ './build/*.js','!./.min.js'])
	.pipe(plumber())
	.pipe(rename({suffix: '.min'}))
	.pipe(uglify())
	.pipe(gulp.dest('./build/'));
});
// //////////////////////////////////////////////
// Speak Fools!
// ////////////////////////////////////////////
gulp.task('coffee', function() {
	gulp.src('./*.coffee')
	.pipe(plumber())
	.pipe(coffee({bare: true}).on('error', gutil.log))
	.pipe(gulp.dest('./build/'));
});
// //////////////////////////////////////////////
// Html Task
// ////////////////////////////////////////////
gulp.task('html', function(){
	gulp.src('./*.html');
})
// //////////////////////////////////////////////
// Webpack Task
// ////////////////////////////////////////////

/*gulp.task('webpack', function(cb) {
    // run webpack
    webpack({
        // configuration
    }, function(err, stats) {
        if(err) throw new gutil.PluginError("webpack", err);
        gutil.log("[webpack]", stats.toString({
            // output options
        }));
        cb();
    });
});*/
// //////////////////////////////////////////////
// Build Task
// ////////////////////////////////////////////
// task to
/*gulp.task('build:cleanfolder', function(cb) {
	del([
		'build/**'
		], cb);
})

// task to
// task to
gulp.task('build:copy', ['build:cleanfolder'], function(){
	return gulp.src('./')
	.pipe(gulp.dest('/build'))
})
// task to
gulp.task('build:remove', ['build:copy'], function(cb) {
	del([
		'/build/js/!(*.min.js)'
	], cb);
})
gulp.task('build', ['build:copy', 'build:remove'])*/
// //////////////////////////////////////////////
// Watch Task
// ////////////////////////////////////////////
//gulp.task('watch', function(){
//	gulp.watch('js/**/*.js', ['scripts']);
//	gulp.watch('/**/*/html', ['html']);
//})
// //////////////////////////////////////////////
// Default Task
// ////////////////////////////////////////////
gulp.task('default',['coffee', 'scripts']);
