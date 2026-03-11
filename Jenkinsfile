pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shilappauline09/devops-build-dev"
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'dev', url: 'https://github.com/shilpaashwanthy/react-app-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }

       stage('Push Image to DockerHub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub-creds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            sh '''
            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
            docker push shilpapauline09/devops-build-dev:latest
            '''
        }
    }
} 

    }

    post {
        success {
            echo "Docker Image Successfully Built and Pushed!"
        }

        failure {
            echo "Pipeline Failed!"
        }
    }
}
