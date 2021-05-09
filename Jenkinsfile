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
				nexusPublisher nexusInstanceId: 'nexus', nexusRepositoryId: 'hclrelease', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/var/lib/jenkins/workspace/Project2/target/webapp6.war']], mavenCoordinate: [artifactId: 'webapp6', groupId: 'com.hcl', packaging: 'war', version: '1.8']]]
                //sh 'mvn clean deploy'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t 34.123.140.86:8083/webapp6:1.8 .'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                sh 'docker login -u admin -p test@1234 34.123.140.86:8083'
                sh 'docker push 34.123.140.86:8083/webapp6:1.8'
                
            }
        }
        
    }
}
