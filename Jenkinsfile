pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/kangsang3073/myapp.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t myusername/myapp:latest .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push myusername/myapp:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                withKubeConfig([credentialsId: 'kubeconfig', serverUrl: 'https://kubernetes.default']) {
                    sh 'kubectl apply -f k8s-deployment.yaml'
                }
            }
        }
    }
}
