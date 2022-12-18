pipeline {
    agent any
    parameters {
        choice(name: 'IMAGE_TAG', choices: ['1.1.0', '3.2.4', 'latest'], description: 'iMAGE VERSION')
    }    
    environment {
        AWS_ACCOUNT_ID=297797860062
        AWS_DEFAULT_REGION="eu-central-1" 
        IMAGE_TAG="${params.IMAGE_TAG}"
        IMAGE_REPO_NAME="calculator_app"
        REPOSITORY_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
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
                    app = docker.build('calculator_app')
                    sh 'docker run -v `pwd`/app/order-service:/src calculator_app test'
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
                script{
                   // sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 297797860062.dkr.ecr.eu-central-1.amazonaws.com'
                    //sh 'docker tag calculator_app:latest ${REPOSITORY_URL}:${IMAGE_TAG}'
                    //sh 'docker push ${REPOSITORY_URL}:${IMAGE_TAG}'
                
                    withDockerRegistry(url: "https://${REPOSITORY_URL}", credentialsId: "ecr:eu-central-1:aws_access") {
                        app.push("${IMAGE_TAG}-${env.BUILD_NUMBER}")
                    }
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
