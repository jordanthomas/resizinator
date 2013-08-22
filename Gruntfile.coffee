module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      options:
        join: true
      compile:
        files: 'dist/scripts/resizinator.js': 'scripts/resizinator.coffee'
    
    uglify:
      dist:
        files:
          'dist/scripts/resizinator.min.js': ['dist/scripts/resizinator.js']
    
    compass:
      dist:
        options:
            sassDir: 'styles'
            cssDir: 'dist/styles'
    
    watch:
      scripts:
        files: ['scripts/*.coffee', 'styles/*.scss', 'index.html']
        tasks: ['build']
    
    copy:
      dist:
        files: [
          expand: true, src: ['index.html', 'images/**'], dest: 'dist/'
        ]
    
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-compass'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    
    grunt.registerTask 'default', ['build']
    grunt.registerTask 'build', ['coffee', 'compass', 'uglify', 'copy']
      