gulp = require 'gulp' 
sass = require 'gulp-sass'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
handlebars = require 'gulp-handlebars'
concat = require 'gulp-concat'
declare = require 'gulp-declare'
wrap = require 'gulp-wrap'

errorHandler = (err) ->
	console.log err

sources = {}
destinations = {}

sources.sass = 'src/styles/**/*.scss'
sources.coffee = 'src/scripts/**/*.coffee'
sources.jade = 'src/jade/**/*.jade'
sources.html = 'src/html/**/*.html'
sources.handlebars = 'src/compiled-templates/**/*.html'
	
destinations.css = 'dist/css'
destinations.js = 'dist/js'
destinations.templates = 'src/compiled-templates'
destinations.base = 'dist/'
destinations.handlebars = 'dist/js'


watcher = (task) ->
		(evt) ->
			console.log 'run ' + evt.path
			gulp.start task
		
	
gulp.task 'compile:sass', ->
	gulp.src(sources.sass)
	.pipe(sass({sourceComments: 'normal'}).on('error', errorHandler))
	.pipe(gulp.dest(destinations.css))

gulp.task 'compile:coffee', ->
	gulp.src(sources.coffee)
	.pipe(coffee({bare: true, sourcemap: true}).on('error', errorHandler))
	.pipe(gulp.dest(destinations.js))

gulp.task 'compile:jade', ->
	gulp.src(sources.jade)
	.pipe(jade().on('error', errorHandler))
	.pipe(gulp.dest(destinations.templates))

gulp.task 'compile:handlebars', ->
	gulp.src(sources.handlebars)
	.pipe(handlebars())
	.pipe(wrap('Handlebars.template(<%= contents %>)'))
	.pipe(declare({
		namespace: 'View.templates',
		noRedeclare: true
	}))
	.pipe(concat('templates.js'))
	.pipe(gulp.dest(destinations.handlebars))

gulp.task 'copy:html', ->
	gulp.src(sources.html)
	.pipe(gulp.dest(destinations.base))

gulp.task 'default', ->
	gulp.start 'compile:sass', 'compile:coffee', 'compile:jade', 'compile:handlebars','copy:html'	


gulp.task 'watch:sass', ->
	gulp.watch sources.sass, watcher 'compile:sass'

gulp.task 'watch:coffee', ->
	gulp.watch sources.coffee, watcher 'compile:coffee'


gulp.task 'watch:jade', ->
	gulp.watch sources.jade, watcher 'compile:jade'

gulp.task 'watch:handlebars', ->
	gulp.watch sources.handlebars, watcher 'copy:handlebars'

gulp.task 'watch:html', ->
	gulp.watch sources.html, watcher 'copy:html'

gulp.task 'watch', ->
	gulp.start 'watch:sass', 'watch:coffee', 'watch:jade', 'watch:handlebars','watch:html'	
		
	
