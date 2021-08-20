
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

        stage('Build Docker image'){
            environment {
               google_projectname = "fullstack-320607"
               image_name = "backend-app"
               image_tag = "latest"
            }
            steps {
                sh "docker build -t gcr.io/${google_projectname}/${image_name}:${image_tag} ."
            }
        }
        stage('Push to GCR ') {
            environment {
               google_projectname = "fullstack-320607"
               image_name = "backend-app"
               image_tag = "latest"
               
            }
            steps {  

                withCredentials([file(credentialsId: 'google-container-registry', variable: 'GC_KEY')]){
                sh '''docker login -u _json_key -p "$(cat ${GC_KEY})" https://gcr.io'''
                sh "gcloud auth activate-service-account --key-file='$GC_KEY'"
                sh "gcloud auth configure-docker"
                echo "Pushing image To GCR"
                sh "docker push gcr.io/${google_projectname}/${image_name}:${image_tag}"
            }
             
          }
        }
        // stage('Push Docker image') {
        //     environment {
        //         DOCKER_HUB_LOGIN = credentials('docker-hub')
        //     }
        //     steps {
        //         sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
        //         sh 'docker push choudhurychayan1/fullstack-backend'
        //     }
        // }
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
