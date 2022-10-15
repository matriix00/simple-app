pipeline {
    agent { label "agent-2" }
    environment {     
    DOCKERHUB_CREDENTIALS= 'dockerhubcredentials' 
    USE='magdy79'
    PASS= '123456aA$$'
    CONTAINER_NAME= 'web-container'
  } 
    stages {
        stage('Example') {
            steps {
                git branch: 'master',
                    credentialsId: "github-key",
                    url: 'https://github.com/matriix00/simple-app/'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"

            }
            
        }
        stage('build') {
            steps {
                echo 'Starting to build docker image'
                sh "sudo docker build . -t jenkins-web-app:${env.BUILD_NUMBER}"
                echo "Build Image Compeletd"
                sh "sudo docker tag jenkins-web-app:${env.BUILD_NUMBER} magdy79/jenkins-web-app:${env.BUILD_NUMBER}"
                
            }
        }
        stage('Login to Docker Hub') {         
            steps {                            
	            sh 'docker login -u ${USE} -p ${PASS}'                 
	            // echo 'Login Completed' 
                //script { 

                    //docker.withRegistry( 'https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS ) { 

                       // dockerImage.push() 

                    //}

                //}                
            }           
        }
        stage('Push Image to Docker Hub') {         
            steps{                            
                sh "docker push magdy79/jenkins-web-app:$BUILD_NUMBER"               
                echo 'Push Image Completed'       
            }           
        }
        stage('Deploy') {
            steps {



                        sh "docker run --name $CONTAINER_NAME -d -p 5000:5000 magdy79/jenkins-web-app:$BUILD_NUMBER"


            }      
  }
  }      
    
    post {
        success {
             slackSend channel: "jenkins", color: "#05f71d" ,message: "Build succeeded: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        }
        failure {
            slackSend channel: "jenkins", color: "#f71505" ,message: "Build succeeded: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        }
    }
}
