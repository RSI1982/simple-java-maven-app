pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '$mvnhome/mvn package'
      }
    }

    stage('Test') {
      steps {
        sh '$mvnhome/mvn clean test'
      }
    }

    stage('Nexus artifcats') {
      steps {
        sh '''cd {WORKSPACE}/target
zip -r javabasedmyapp.zip .
curl -X GET -u admin:India@123 "http://192.168.0.105:8081/repository/javabasedmyapp-Pipeline/javabasedmyapp/${BUILD_NUMBER}'''
      }
    }

  }
  environment {
    mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
    mscanner = '/var/jenkins_home/tools/hudson.plugins.sonar.MsBuildSQRunnerInstallation/MSSQ'
  }
}