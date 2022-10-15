pipeline {
    agent { label "agent-2" }
    environment {     
    DOCKERHUB_CREDENTIALS= 'dockerhubcredentials'   
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
	            sh 'sudo docker login -u magdy79 -p 123456aA\$\$'                 
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
                sh "sudo docker push magdy79/jenkins-web-app:${env.BUILD_NUMBER}"               
                echo 'Push Image Completed'       
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
