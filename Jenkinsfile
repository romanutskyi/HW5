pipeline {
    agent any
    environment {
        COMMIT_ID="""${env.BUILD_TIMESTAMP}"""
        app = ''
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                        app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    }
                }
            }
        }
        
        stage('Run') {
            steps {
                sh 'docker run -d -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG}'

            }
        }
	
        stage('Check Availability') {
            steps {             
              waitUntil {
                  try {         
                      sh "curl -s --head  --request GET  localhost/actuator/health | grep '200'"
                      return true
                  } catch (Exception e) {
                        return false
                  }
              }
           }
       } 
        
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                        app.push("${COMMIT_ID}")                
                    }
                }
            }
        }
    }

}
