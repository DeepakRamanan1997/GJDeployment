pipeline {
    agent any
    tools {
     maven 'Maven'
    }
    stages {
        stage('Build') {
            steps {
                // Your build steps here
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                // Your test steps here
                sh 'mvn test'
            }
        post {
            success {
                // Archive the WAR file as an artifact
                archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
            }
        }
    }
        stage('Deploy to container') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'deepak', path: '', url: 'http://18.206.223.79:9090/')], contextPath: 'deepak', war: '**/*.war'
            }
    }
  }
}
