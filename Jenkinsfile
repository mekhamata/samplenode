pipeline {
        agent {
  label 'fedora_slave'
        } 

    stages {
        stage('Checkout Code') {
            steps {
           
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'sample-app']], userRemoteConfigs: [[url: 'https://github.com/digitalocean/sample-nodejs.git']]])
            }
        }
        stage('Build') {
            steps {
                    sh '''docker build . -t mikhamatta/samplenode:${BUILD_ID} '''
               
            }
        }
        stage('Test') {
            steps {
                sh 'docker run  --name node-test -itd -p 3000:3000 mikhamatta/samplenode:${BUILD_ID} '
                sh 'curl localhost:3000'
                sh 'docker stop node-test'
                sh 'docker rm node-test'
   
            }
        }
        stage('Push to Docker Hub ') {
            steps {
                sh "docker push mikhamatta/samplenode:${BUILD_ID} "

            }
        }
    }
    post {
        always {
             chuckNorris()  
              
            }
    }

}
