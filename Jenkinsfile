pipeline{
	agent {
		label 'slave' //running on node "slave"
	}
	tools {
		nodejs 'NodeJS' // NodeJS definition
	}
	stages{
		stage ('compressing'){
			parallel{
				stage ('JS'){
					steps{
	  					sh "ls www/js/ | xargs -I{file} uglifyjs www/js/{file} -o www/min/{file} --compress"  // compressing JS
					} 
   				}
   				stage ('CSS'){
					steps{
						sh  "ls www/css/ | xargs -I{file} cleancss www/css/{file} -o www/min/{file}" // cleaning CSS
					}
   				}
			}
		}
		stage ('tarball'){
			steps{
				sh "tar --exclude=.git --exclude=www/css --exclude=www/js -czvf artifacts.tar.gz *"  // archiving excluding specified files
			}
		}
	}
	post{
		success {
			archiveArtifacts artifacts: 'artifacts.tar.gz' // saving artifacts
			withCredentials([usernamePassword(credentialsId: 'artifactory', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
				sh "curl -u${USERNAME}:${PASSWORD} -T artifacts.tar.gz \"http://192.168.1.13:8081/artifactory/mdt/artifacts${env.BUILD_NUMBER}.tar.gz\""
			}
			echo "Success"
		}
		failure {
			echo "There was some error"
		} 
		cleanup {
			deleteDir() // cleaning up working directory
		}       
	}

}


