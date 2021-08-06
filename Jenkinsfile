
pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    
    stages {

        stage('install docker client'){
            steps{ //https://download.docker.com/linux/static/stable/x86_64/docker-17.03.0-ce.tgz
                sh'docker exec -it -u root jenkins-docker chown jenkins /var/run/docker.sock'
                sh'curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-17.03.0-ce.tgz \
  && tar xzvf docker-17.03.0-ce.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-17.03.0-ce.tgz'
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
