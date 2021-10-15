pipeline{
    agent {
        label 'slave' //running on node "slawe"
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
    }
    post{
        always {
            sh "tar --exclude=.git --exclude=www/css --exclude=www/js -czvf artifacts.tar.gz *"  // archiving excluding specified files
            archiveArtifacts artifacts: 'artifacts.tar.gz' // saving artifacts
            deleteDir() // cleaning up working directory
        }
        success {
            echo "Success"
        }
        failure {
            echo "There was some error"
        }        
    }

}


