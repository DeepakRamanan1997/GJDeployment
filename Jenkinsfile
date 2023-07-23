pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // This step checks out the source code from your GitHub repository
                git branch: 'master', url: 'https://github.com/DeepakRamanan1997/GJDeployment.git'
            }
        }
        stage('Compile') {
            steps {
                // Compile the Java project using Maven
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                // This step runs the unit tests for your Java project
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                // Package the Java project as a WAR file using Maven
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                // This step could be used to deploy your Java project as a WAR file to Apache Tomcat.
                // Assuming your Java project has produced a WAR file during the build stage.
                // You need to adjust the paths and server information as per your setup.

                script {
                    // Remote Tomcat Manager URL
                    def tomcatManagerUrl = 'http://44.204.65.54:9090/manager/text'

                    // Remote Tomcat Manager credentials
                    def tomcatUsername = 'admin'
                    def tomcatPassword = 'admin'

                    // Local WAR file path (relative to your workspace)
                    def localWarPath = '/target/addressbook.war'

                    // Deploy the WAR file using curl to the Tomcat Manager
                    sh "curl -v -u ${admin}:${admin} --upload-file ${/target/addressbook.war} ${http://44.204.65.54:9090/manager/text}/deploy?path=/Deepak&update=true"

                    // Replace 'your-java-web-app' with the context path of your web application.
                    // The context path is the part of the URL after the hostname and port (e.g., http://your-tomcat-host:8080/your-java-web-app)

                    // Optional: Restart the Tomcat server
                    // Uncomment the following line if you want to restart the Tomcat server after deployment.
                    sh "curl -v -u ${admin}:${admin} ${http://44.204.65.54:9090/manager/text}/reload?path=/Deepak"
                }
            }
        }
    }

    post {
        always {
            // This block will always run, regardless of the pipeline's success or failure.
            // You can use this section for any cleanup tasks or notifications.
            echo 'Pipeline execution completed.'
        }

        success {
            // This block will only run if the pipeline is successful.
            // You can use this section for any success-specific tasks or notifications.
            echo 'Pipeline succeeded! Congratulations!'
        }

        failure {
            // This block will only run if the pipeline fails.
            // You can use this section for any failure-specific tasks or notifications.
            echo 'Pipeline failed! Please investigate and fix the issues.'
        }
    }
}

