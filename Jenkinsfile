pipeline{
    agent any
    environment {
        IMAGE_NAME = "lmanojbalaji/manojbala:${COMMIT_ID}"

    }
    stages{
        stage("GIT checkout"){
            steps{
                git url: "https://github.com/lmanoj0620/Practise.git", branch: "dev"
            }
        }
        stage("Build Docker Image"){
            steps{
                sh """
                
                docker build -t ${IMAGE_NAME} .
                """
            }
        }
        stage("Login to DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                }
            }
        }
        stage("Push to Docker HUB"){
            steps{
                sh "docker push ${IMAGE_NAME}"
            }
        }
        stage("Deploy"){
            steps{
                sh "sed -i 's|replace|${IMAGE_NAME}|g' deploy.yaml"
                sh "kubectl apply -f deploy.yaml"
            }
        }
    }
}
