pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'dev', url: 'https://github.com/shilpaashwanthy/react-app-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t shilappauline09/devops-build-dev:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    docker login -u $USER -p $PASS
                    docker push shilappauline09/devops-build-dev:latest
                    '''
                }
            }
        }

    }
}
