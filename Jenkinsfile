pipeline {
    agent { label "agent-d-1" }
    stages {
        stage('Example') {
            steps {
                git branch: 'master',
                    credentialsId: "githubaccount",
                    url: 'https://github.com/matriix00/simple-app/'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                echo "hello omaaa"
            }
        }
    }
}
