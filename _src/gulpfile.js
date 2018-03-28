'use strict';

const pkg = 'modxsite';
const settings = {
    assets: `./../assets/components/${pkg}/templates/default`,
    core: `./../core/components/${pkg}/templates/default`,
};

const path = require('path');
const gulp = require('gulp');
const del = require('del');
const runSequence = require('run-sequence');
const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

// Compile and automatically prefix stylesheets
gulp.task('styles', () => {
    const AUTOPREFIXER_BROWSERS = [
        'ie >= 10',
        'ie_mob >= 10',
        'ff >= 30',
        'chrome >= 34',
        'safari >= 7',
        'opera >= 23',
        'ios >= 7',
        'android >= 4.4',
        'bb >= 10'
    ];

    return gulp.src('./styles/style.scss')
        //.pipe($.sourcemaps.init())
        .pipe($.compass({
            project: path.join(__dirname),
            css: './_css',
            sass: './styles',
            image: './images'
        }))
        .pipe($.autoprefixer(AUTOPREFIXER_BROWSERS))
        .pipe($.if('*.css', $.cssnano()))
        .pipe($.size({title: 'styles'}))
        //.pipe($.sourcemaps.write())
        .pipe($.rename({
            suffix: '.min'
        }))
        .pipe(gulp.dest(settings.assets + '/css'));
        //.pipe($.notify({
        //    message: 'Styles task complete'
        //}));
});

// Concatenate and minify JavaScript
gulp.task('scripts', () => {
    gulp.src('./scripts/app.js')
        .pipe($.rigger())
        //.pipe($.sourcemaps.init())
        .pipe($.uglify())
        .pipe($.size({title: 'scripts'}))
        .pipe($.rename({
            suffix: '.min'
        }))
        //.pipe($.sourcemaps.write())
        .pipe(gulp.dest(settings.assets + '/js'));
        //.pipe($.notify({
        //    message: 'Scripts task complete'
        //}));
});

// Minify any .tpl
gulp.task('html', () => {
    return gulp.src('./html/**/*.tpl')
        //.pipe($.newer())
        .pipe($.if('*.tpl', $.htmlmin({
            removeComments: true,
            collapseWhitespace: true,
            collapseBooleanAttributes: true,
            removeAttributeQuotes: false,
            removeRedundantAttributes: false,
            removeEmptyAttributes: true,
            removeScriptTypeAttributes: true,
            removeStyleLinkTypeAttributes: true,
            removeOptionalTags: true
        })))
        // Output files
        .pipe($.if('*.tpl', $.size({title: 'html', showFiles: true})))
        .pipe(gulp.dest(settings.core));
        //.pipe($.notify({
        //    message: 'Html task complete'
        //}));
});

// Optimize images
gulp.task('images', () => {
    gulp.src(['./images/**/*', '!./images/_sprites/**/*'])
        .pipe($.cache($.imagemin({
            progressive: true,
            interlaced: true
        })))
        .pipe($.size({title: 'images', showFiles: true}))
        .pipe(gulp.dest(settings.assets + '/images'))
        .pipe($.notify({
            message: 'Images task complete'
        }));
});

// Clean CSS output directory
gulp.task('clean::css', () => del([settings.assets + '/css'], {
    dot: true,
    force: true
}));

// Clean JavaScript output directory
gulp.task('clean::js', () => del([settings.assets + '/js'], {
    dot: true,
    force: true
}));

// Clean output directory
gulp.task('clean', ['clean::css', 'clean::js'], () => {
    $.notify({
        message: 'Clear task complete'
    })
});

// Build project
gulp.task('build', ['clean'], cb =>
    runSequence(
        'styles',
        'scripts',
        'images',
        'html',
        cb
    ));

// Watcher
gulp.task('watch', () => {
    gulp.watch('./styles/**/*.scss', ['styles']);
    gulp.watch('./scripts/**/*.js', ['scripts']);
    gulp.watch('./images/**/*', ['images']);
    gulp.watch('./html/**/*.tpl', ['html']);
});

// Default task
gulp.task('default', ['build']);

