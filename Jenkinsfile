
pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    
    stages {

        stage('install docker client'){
            steps{ //https://download.docker.com/linux/static/stable/x86_64/docker-17.03.0-ce.tgz
                sh'docker_url=https://download.docker.com/linux/static/stable/x86_64
docker_version=18.03.1-ce
curl -fsSL $docker_url/docker-$docker_version.tgz | \
tar zxvf - --strip 1 -C /usr/bin docker/docker'
            }
        }
        
        stage('Build') {
            steps {
                sh './gradlew build'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t testimage .'
            }
        }
        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh './gradlew dockerPush'
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
