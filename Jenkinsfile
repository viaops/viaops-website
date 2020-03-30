node {
    def remote = [:]
    remote.name = 'Viaops Website'
    remote.host = 'www.viaops.com'
    remote.user = 'root'
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
        sshCommand remote: remote, command: "docker stop \$(docker ps -a -q) ; docker rm \$(docker ps -a -q) ; docker run -dti -p 80:80 --name viaops-website viaops/website"
    }
}