
pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    
    stages {        
        stage('Build') {
            steps {
                sh './gradlew build'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t backendimage .'
            }
        }
        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh 'docker push choudhurychayan1/fullstack-image:backendimage'
            }
        }
        // stage('Test') {
        //     steps {
        //         sh './gradlew test'
        //     }
        // }
        // stage('Build Docker image') {
        //     steps {
        //         sh './gradlew docker'
        //     }
        // }
        // stage('Push Docker image') {
        //     environment {
        //         DOCKER_HUB_LOGIN = credentials('docker-hub')
        //     }
        //     steps {
        //         sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
        //         sh './gradlew dockerPush'
        //     }
        // }
    }
}
