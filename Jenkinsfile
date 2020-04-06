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
      agent any
      steps {
        echo 'displaying codequality'
        withSonarQubeEnv(credentialsId: 'af0685f916b26a4be6df276b953ffd38172216f0', installationName: 'SQ')
        sh '$mvnhome/mvn sonar:sonar -Dsonar.projectKey=mavenapp -Dsonar.projectName=mavenapp-pipeline -Dsonar.host.url=http://192.168.0.105:9000 -Dsonar.login=af0685f916b26a4be6df276b953ffd38172216f0'
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
  environment {
    mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
  }
}