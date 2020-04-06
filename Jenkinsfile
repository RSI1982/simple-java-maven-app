pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      environment {
        mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
      }
      steps {
        echo 'Building'
        sh '$mvnhome/mvn package'
      }
    }

    stage('Test') {
      agent any
      environment {
        mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
      }
      steps {
        echo 'Displaying test'
        sh '$mvnhome/mvn clean test'
      }
    }

    stage('codequality') {
      steps {
        echo 'displaying codequality'
      }
    }

    stage('artifacts') {
      steps {
        echo 'Storing artifacts'
        sh '''cd ${workspace}/target
zip -r mavenapp-pipeline.zip .
curl -v -u admin:India@123 --upload-file mavenapp-pipeline.zip http://192.168.0.7:8081/repository/mavenapp-pipeline/maven-central/mavenapp-pipeline/${BUILD_NUMBER}'''
      }
    }

  }
}