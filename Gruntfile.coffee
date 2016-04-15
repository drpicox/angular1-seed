appCodename = 'scf'
styles = 'sass' # 'less' # or 'sass'
portServe = 9259

module.exports = (grunt) ->

	grunt.initConfig

		autoprefixer:
			options: ['> 5%']
			build: files: [
				expand: true
				cwd: '.tmp/',
				src: '**/*.css',
				dest: '.tmp/'
			]

		browserify:
			dev:
				files: '.tmp/bundle.js': [ 'src/index.js']
				options:
					watch: true
					browserifyOptions: debug:true
					transform: [
						'hintify'
						[ 'stringify', appliesTo: ['.html'], minify:true ]
						[ 'babelify' , sourceMap:true, presets:['es2015'] ]
						'browserify-ngannotate'
						'envify'
					]
			www:
				files: '.tmp/bundle.js': [ 'src/index.js']
				options: transform: [
					'hintify'
					[ 'stringify', appliesTo: ['.html'], minify:true ]
					[ 'babelify' , sourceMap:true, presets:['es2015'] ]
					'browserify-ngannotate'
					'envify'
					'uglifyify'
				]

		checkDependencies: 'package.json': options: install:true

		clean:
			www: files: [ dot: true, src: [ 'www/*','!www/.git' ], ]
			tmp: files: [ dot: true, src: [ '.tmp' ], ]

		copy:
			options: onlyIf: 'modified'
			fonts: src: 'node_modules/*/fonts/*', dest: 'www/'
			images:
				expand: true,
				cwd: 'src',
				dest: 'www',
				src: '**/*.{png,gif,jpg,svg}'
			index: src: 'src/index.html', dest: 'www/index.html'

		connect:
			options:
				hostname:'0.0.0.0', open:false, port:portServe, livereload:10000+portServe
			livereload:	options: base: [ '.tmp','src','.' ]

		filerev: build: src: 'www/*.{js,css}'

		karma:
			options: configFile: 'karma.conf.js', port: '<%= connect.options.port + 20000 %>'
			unit: singleRun: true
			dev: background: true, browsers: ['PhantomJS','Chrome']

		less: build:
			files: '.tmp/bundle.css': 'src/index.less'
			options:
				sourceMap: true
				sourceMapFilename: '.tmp/bundle.css.map'
				paths: [ 'src/', '.' ]
				compress: false
				yuicompress: false
				dumpLineNumbers: 'comments'
				optimization: 0

		sass: build:
			files: '.tmp/bundle.css': 'src/index.scss'
			options:
				includePaths: [ 'src/', '.' ]
				sourceMap: true

		uglify: options: sourceMapIncludeSources:true, screwIE8:true

		useminPrepare:
			html: 'src/index.html'
			options: dest: 'www'

		usemin:
			html: [ 'www/index.html' ]
			options: dirs: ['www']

		watch:
			grunt: files: [ 'Gruntfile.coffee' ]
			less: files: [ 'src/**/*.less' ], tasks: [ 'less','autoprefixer' ]
			karma: files: [ '.tmp/bundle.js', 'src/**/*.spec.js' ], tasks: [ 'karma:dev:run' ]
			sass: files: [ 'src/**/*.scss' ], tasks: [ 'sass','autoprefixer' ]
			livereload: 
				options: livereload: '<%= connect.options.livereload %>'
				files: [
					'src/index.html'
					'src/**/*.{png,gif,jpg,svg}'
					'.tmp/bundle.js','.tmp/bundle.css'
				]

	grunt.registerTask 'test', [
		'checkDependencies'
		'clean'
		'browserify:dev'
		'babel'
		'karma:unit'
	]

	grunt.registerTask 'serve', [
		'checkDependencies'
		'clean'
		'browserify:dev'
		styles
		'autoprefixer'
		'karma:unit'
		'connect:livereload'
		'karma:dev:start'
		'watch'
	]

	grunt.registerTask 'build', [
		'checkDependencies'
		'clean'
		'browserify:www'
		'karma:unit'
		styles
		'autoprefixer'
		'copy'
		'useminPrepare'
		'concat'
		'uglify'
		'cssmin'
		'filerev'
		'usemin'
	]


	# load dinamically as needed grunt plugins
	require('jit-grunt')(grunt, {
		useminPrepare: 'grunt-usemin'
		checkDependencies: 'grunt-check-dependencies'
	})

	# make stats of time consuming tasks
	require('time-grunt')
	