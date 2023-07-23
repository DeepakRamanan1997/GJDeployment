pipeline {    
   agent {
   label 'slave'
}   
    stages {
           stage('SCM Checkout') {
             steps {
                git 'https://github.com/mkrish1825/devops.git'
             }
           }
         stage('maven-buildstage') {
           steps {                
             script {  
                def mvnHome = tool name: 'maven3'
                env.M2_HOME = mvnHome
                env.PATH = "${mvnHome}/bin:${env.PATH}"
                sh "mvn clean package && mv target/addressbook*.war target/new.war"
                }
         }
        }
      }
         stage('Deploy to a tomcat') {
           steps {
              deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '',
              url: 'http://15.206.123.45:8085/')],
              contextPath: 'new', war: '*/.war'
          }
        } 
      }
}
