pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building Spring Boot application...'
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh 'bash scripts/k8s-deploy.sh'
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed. Cleaning up...'
        }
        success {
            slackSend channel: '#ci-cd', message: "Build ${env.BUILD_URL} completed successfully"
        }
        failure {
            slackSend channel: '#ci-cd', message: "Build ${env.BUILD_URL} failed"
        }
    }
}