pipeline {
    agent any
    tools {
     maven 'Maven'
    }
    stages {
        stage('Build') {
            steps {
                // Your build steps here
                sh 'mvn package'
            }
    }
        stage('Deploy to container') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'ramanan', path: '', url: 'http://3.86.157.49:9090/')], contextPath: 'ramanan', war: '**/*.war'
            }
       } 
    }
}
