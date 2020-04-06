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
      agent any
      environment {
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'India@123'
      }
      steps {
        echo 'Storing artifacts'
        ws(dir: '/var/jenkins_home/workspace')
        sh '''cd ${WORKSPACE}/*/target
zip -r mavenapp-pipeline.zip .'''
      }
    }

  }
}