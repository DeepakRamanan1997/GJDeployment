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
                def mvnHome = tool name: 'Maven'
                env.M2_HOME = mvnHome
                env.PATH = "${mvnHome}/bin:${env.PATH}"
                sh "mvn clean package && mv target/addressbook*.war target/new.war"
                }
         }
        }
         stage('Deploy to a tomcat') {
           steps {
              deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '',
              url: 'http://54.152.184.74:9090/')],
              contextPath: 'new', war: '*/.war'
          }
        } 
      }
}
