node {

    def hugo

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        hugo = docker.build("viaops/website")
    }

    stage('Test image') {
        hugo.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            hugo.push("${env.BUILD_NUMBER}")
            hugo.push("latest")
        }
    }

    stage('Deploy image') {
        sh 'ssh root@www.viaops.com "docker stop viaops-website && docker rm viaops-website && docker run -dti -p 80:80 --name viaops-website viaops/website"'
    }
}