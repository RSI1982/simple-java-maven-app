pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh 'build.sh'
      }
    }

    stage('Test') {
      steps {
        echo 'Displaying test'
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