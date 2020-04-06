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
        publishCoverage(tag: 'target/site/jacoco/*')
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
      }
    }

  }
}