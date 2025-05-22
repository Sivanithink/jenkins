pipeline {
    agent any
 
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t sivanithink/app1 .'
            }
        }
 
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f app1-container || true
                    docker run -d -p 8009:8080 --name app1-container sivanithink/app1
                '''
            }
        }
    }
}
