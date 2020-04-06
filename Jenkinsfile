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
        junit 'target/surefire-reports/*.xml'
      }
    }

    stage('codequality') {
      steps {
        echo 'displaying codequality'
      }
    }

    stage('artifacts') {
      agent any
      environment {
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'India@123'
      }
      steps {
        echo 'Storing artifacts'
        sh '''cd /target
zip -r mavenapp-pipeline.zip .'''
      }
    }

  }
}