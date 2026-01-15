pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // ID секретів у Jenkins
        IMAGE_NAME = "fibonacci-app"
        DOCKER_USER = "${DOCKERHUB_CREDENTIALS_USR}"
        DOCKER_PASS = "${DOCKERHUB_CREDENTIALS_PSW}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-username/fibonacci_project.git'
            }
        }

        stage('Install dependencies & Test') {
            steps {
                sh 'pip3 install -r requirements.txt'
                sh 'python3 -m unittest discover -s . -p "test_*.py"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_USER}/${IMAGE_NAME}:latest ."
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
                sh "docker push ${DOCKER_USER}/${IMAGE_NAME}:latest"
            }
        }
    }
}
