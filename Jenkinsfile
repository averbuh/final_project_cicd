pipeline {
    agent any
    parameters {
        choice(name: 'IMAGE_TAG', choices: ['1.1.0', '3.2.4', 'latest'], description: 'iMAGE VERSION')
    }    
    environment {
        AWS_ACCOUNT_ID=""
        AWS_DEFAULT_REGION="eu-central-1" 
        IMAGE_TAG="${params.IMAGE_TAG}"
        IMAGE_REPO_NAME="myapp"
        REPOSITORY_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
        //AWS_API_KEY = credentials('aws_credentials')
    }
   
    stages {
        stage('Cloning Git') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-ssh-key', url: 'https://github.com/averbuh/Finish_project_cicd.git']]])
            } 
        }
  
    // Building Docker images
        stage('Build and unit tests') {
          steps{
            script {
                sh 'docker --version'
                docker build -t test-in-containers:1.0-3.8.1-openjdk-11-slim .
                docker run -v `pwd`/test-in-containers:/src test-in-containers: 1.0-3.8.1-openjdk-11-slim test
            }
            cleanWs()
          }
        }

        stage('Local Tests'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Clean Workspace') {
            steps {
                cleanWs notFailBuild: true, patterns: [[pattern: '', type: 'INCLUDE']]
            }
        }
       
        // Uploading Docker images into AWS ECR
        stage('Pushing image to ECR') {
         steps{  
             script {
                echo "Hello!" 
             }
         }
        }
        stage('Publish Helm Chart'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }
        
        stage('Deploy to Dev'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Dev tests'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Cleanup dev'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Deploy to staging'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Staging Tests'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Cleanup Staging'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }
        
        stage('Go to Profuction'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

        stage('Deploy Production'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }
    }
}
