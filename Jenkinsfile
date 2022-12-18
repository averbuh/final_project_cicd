pipeline {
    agent any
    parameters {
        choice(name: 'IMAGE_TAG', choices: ['1.1.0', '3.2.4', 'latest'], description: 'iMAGE VERSION')
    }    
    environment {
        AWS_ACCOUNT_ID=credentials('aws_account_id')
        AWS_DEFAULT_REGION="eu-central-1" 
        IMAGE_TAG="${params.IMAGE_TAG}"
        IMAGE_REPO_NAME="calculator_app"
        REPOSITORY_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
        AWS_API_KEY = credentials('aws_access')
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
                    sh 'docker build -t app_calculator .'
                    sh 'docker run -v `pwd`/app/order-service:/src app_calculator test'
                }

            }
        }


        stage('Local Tests'){
            steps{
                script{
                    echo "Hello!"
                }
            } 
        }

       
        // Uploading Docker images into AWS ECR
        stage('Pushing image to ECR') {
            steps{  
                docker.withRegistry("https://${REPOSITORY_URL}", "ecr:us-east-1:aws_access") {
                    docker.image("app_calculator").push()
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


        stage('Clean Workspace') {
            steps {
                cleanWs notFailBuild: true, patterns: [[pattern: '', type: 'INCLUDE']]
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
