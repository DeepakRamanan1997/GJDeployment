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
        post {
            success {
                // Archive the WAR file as an artifact
                archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
            }
        }
    }
        stage('Deploy to container') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'deepak', path: '', url: 'http://3.86.157.49:9090/')], contextPath: 'deepak', war: '**/*.war'
            }
    }
  }
}
