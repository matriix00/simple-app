pipeline {
    agent { label "agent-1" }
    stages {
        stage('Example') {
            steps {
                git branch: 'master',
                    credentialsId: "github-key",
                    url: 'https://github.com/matriix00/simple-app/'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                echo "hello medoooooo holaaaaaaaaaa"
                echo "hello itians"
                echo "test again with ngokkkk"
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
