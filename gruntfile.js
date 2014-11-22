module.exports = function(grunt){
	grunt.initConfig({
		pkg:grunt.file.readJSON('package.json'),
		less:{
			compile:{
				files:{
						'scripts/site.css' : 'less/site.less'
					}
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-less');
	grunt.registerTask('default', ["less"])
}