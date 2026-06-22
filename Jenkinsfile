pipeline{
    agent any
    environment {
        IMAGE_NAME = "lmanojbalaji/manojbala:${COMMIT_ID}"

    }
    stages{
        stage("GIT checkout"){
            steps{
                git url: "https://github.com/lmanoj0620/Practise.git", branch: "main"
            }
        }
        stage("Build Docker Image"){
            steps{
                sh """
                docker rmi $(docker images)
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
    }
}
