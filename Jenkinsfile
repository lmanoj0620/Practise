pipeline{
    agent any

    envirmonment{
        Image_Name="lmanojbalaji/manojbala:latest"
    }
    stages{
        stage("Git chekout"){
            steps{
                git url: "https://github.com/lmanoj0620/Practise.git", branch: "dev"
            }
        }
        stage("Build Docker image"){
            steps{
                sh " docker build -t $Image_Name ."
            }
        }
        stage("Docker Login"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                }
            }
        }
        stage("Push image to docker hub"){
            steps{
                sh "docker push $Image_Name"
            }
        }
        stage("Deploy to Microk8s"){
            steps{
                sh "kubectl apply -f deployment.yaml"
            }
        }
    }
}
