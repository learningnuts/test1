pipeline {
    agent any

    stages {
        
       
        stage('GIT Stage') {
            steps {
                git 'https://github.com/learningnuts/test1.git'
            }
        }
        
      
        stage('Compile Stage') {
            steps {
                sh 'mvn clean compile'
            }
        }
        
        stage('Package Stage') {
            steps {
                sh 'mvn clean package'
            }
        }
        
         stage('Package deploy') {
            steps {
                sh 'mvn clean deploy'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t 34.123.140.86:8083/webapp6:1.7 .'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                sh 'docker login -u admin -p test@1234 34.123.140.86:8083'
                sh 'docker push 34.123.140.86:8083/webapp6:1.7'
                
            }
        }
        
    }
}
