pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'harshal225/fiver-clone:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/harshal2390/fiver-clone.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('client') {
                    bat 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin"
                    bat "docker push %DOCKER_IMAGE%"
                }
            }
        }
    }
}
