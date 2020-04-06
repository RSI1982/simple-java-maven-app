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
      environment {
        mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
      }
      steps {
        echo 'displaying codequality'
        sh '$mvnhome/mvn sonar:sonar -Dsonar.projectKey=mavenapp -Dsonar.projectName=mavenapp-pipeline -Dsonar.host.url=http://192.168.0.105:9000 -Dsonar.login=af0685f916b26a4be6df276b953ffd38172216f0'
      }
    }

    stage('artifacts') {
      agent any
      steps {
        echo 'Storing artifacts'
        readFile 'target/*.jar'
        sh 'zip -r mavenapp-pipeline.zip .'
      }
    }

  }
  environment {
    mvnhome = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven-home/bin'
  }
}