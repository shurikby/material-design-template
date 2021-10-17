node('slave'){ //running on node "slave"
	nodejs = tool 'NodeJS'
	stage('checkout')
		{
			checkout scm
			sh "ls -la"
		}
	try {
		def parallel = ["JS" : {stage('js'){sh "ls www/js/ | xargs -I{file} uglifyjs www/js/{file} -o www/min/{file} --compress"}}, "CSS" : {stage('css'){sh  "ls www/css/ | xargs -I{file} cleancss www/css/{file} -o www/min/{file}"}}]
		parallel parallel
	}
	catch(ex){
		echo "Failure"
	}
	stage('post'){
		sh "tar --exclude=.git --exclude=www/css --exclude=www/js -czvf artifacts.tar.gz *"  // archiving excluding specified files
		archiveArtifacts artifacts: 'artifacts.tar.gz' // saving artifacts
		deleteDir() // cleaning up working directory
	}
}