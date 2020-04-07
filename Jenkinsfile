pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '$mvnhome/mvn package'
      }
    }

  }
  environment {
    mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
    mscanner = '/var/jenkins_home/tools/hudson.plugins.sonar.MsBuildSQRunnerInstallation/MSSQ'
  }
}