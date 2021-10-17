node('slave'){ //running on node "slave"
	env.NODEJS_HOME = "${tool 'NodeJS'}"
	env.PATH="${env.NODEJS_HOME}/bin:${env.PATH}"
	result=0
	stage('checkout')
		{
			checkout scm
		}
	try {
		stage("compression") {
   			def stages = [:]
	  		stages['JS'] = {
				stage("JS") {
					sh "ls www/js/ | xargs -I{file} uglifyjs www/js/{file} -o www/min/{file} --compress"
				}
			}
			stages['CSS'] = {
				stage("CSS") {
					sh  "ls www/css/ | xargs -I{file} cleancss www/css/{file} -o www/min/{file}"
				}
   	 		}
			parallel stages
		}
	}
	catch(ex){
		echo "Failure"
		result = 1
	}
	stage('post'){
		if (result == 0){
			sh "tar --exclude=.git --exclude=www/css --exclude=www/js -czvf artifacts.tar.gz *"  // archiving excluding specified files
			archiveArtifacts artifacts: 'artifacts.tar.gz' // saving artifacts
			echo "Success!"
		}
		deleteDir() // cleaning up working directory
	}
}