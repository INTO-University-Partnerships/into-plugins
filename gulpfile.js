'use strict';

var _ = require('lodash'),
    source = require('vinyl-source-stream'),
    del = require('del'),
    gulp = require('gulp'),
    gutil = require('gulp-util'),
    gulpif = require('gulp-if'),
    notify = require('gulp-notify'),
    plumber = require('gulp-plumber'),
    uglify = require('gulp-uglify'),
    streamify = require('gulp-streamify'),
    eslint = require('gulp-eslint'),
    browserify = require('browserify'),
    babelify = require('babelify'),
    watchify = require('watchify'),
    envify = require('envify/custom');

function handleErrors() {
    var args = Array.prototype.slice.call(arguments);
    notify.onError({
        title: 'Compile Error',
        message: '<%= error.message %>'
    }).apply(this, args);
}

function rebundle(bundler, app, subapp, production) {
    var stream = bundler.bundle();
    return stream
        .on('error', handleErrors)
        .pipe(plumber())
        .pipe(gulpif(!production, source((_.isUndefined(subapp) ? app : subapp) + '.js')))
        .pipe(gulpif(production, source((_.isUndefined(subapp) ? app : subapp) + '.min.js')))
        .pipe(gulpif(production, streamify(uglify())))
        .pipe(gulp.dest('./static/js/build/app/' + app + '/'));
}

function buildScript(app, subapp, opts) {
    var production = opts.production,
        noWatch = opts.noWatch,
        vendor = app === 'vendor';

    process.env.NODE_ENV = production ? 'production' : 'development';

    var b = browserify({
        entries: vendor ? [] : ['./' + app + '/js/' + (_.isUndefined(subapp) ? '' : (subapp + '/')) + 'app.js'],
        debug: false,
        cache: {},
        packageCache: {}
    });

    var bundler = production || noWatch ? b : watchify(b);
    bundler.transform(babelify, {presets: ['es2015', 'react']}).transform(envify());
    bundler.on('update', function () {
        rebundle(bundler, app, subapp, production);
        gutil.log('Rebundle ...');
    });

    return rebundle(bundler, app, subapp, production);
}

gulp.task('clean', function () {
    return del('./static/js/build/');
});

gulp.task('lint', function () {
    return gulp.src(['./' + gutil.env.app + '/js/**/*.js'])
        .pipe(eslint())
        .pipe(eslint.format());
});

gulp.task('build', function () {
    return buildScript(gutil.env.app, gutil.env.subapp, {
        production: true,
        noWatch: true
    });
});

gulp.task('watch', function () {
    return buildScript(gutil.env.app, gutil.env.subapp, {
        production: false,
        noWatch: gutil.env.nowatch
    });
});
