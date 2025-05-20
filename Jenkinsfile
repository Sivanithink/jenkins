pipeline {
    agent any
 
    environment {
        VENV = 'venv'
        IMAGE_NAME = 'sivanithink/jenkins-app'
        TAG = 'latest'
    }
 
    stages {
        stage ("Install") {
            steps {
                sh '''
                    python3 -m venv $VENV
                    . $VENV/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }
 
        stage ("Linting") {
            steps {
                script {
                    echo "This is my Linting Step"
                }
            }
        }
 
        stage ("Install Packages") {
            steps {
                script {
                    echo "This is Install Packages Step"
                }
            }
        }
 
        stage ("Run Application") {
            steps {
                script {
                    echo "This is my Run application Step"
                }
            }
        }
 
        stage ("Build Docker Image") {
            steps {
                script {
                    echo "Building Docker Image"
                    sh """
                        docker build -t ${IMAGE_NAME}:${TAG} .
                    """
                }
            }
        }
 
        stage ("Push Docker Image") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds1', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        echo "Pushing Docker Image to Docker Hub"
                        sh """
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push ${IMAGE_NAME}:${TAG}
                        """
                    }
                }
            }
        }
    }
}
