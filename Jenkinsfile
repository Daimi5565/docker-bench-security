pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Daimi5565/docker-bench-security.git'
            }
        }

        stage('Run Docker Bench for Security') {
            steps {
                dir("${WORKSPACE}") { // Run inside the Jenkins workspace
                    script {
                        // Run Docker Bench for Security using Docker
                        sh 'docker run --privileged --rm --net host \
                            -v /var/run/docker.sock:/var/run/docker.sock \
                            -v /etc:/etc \
                            -v /usr/bin/docker:/usr/bin/docker \
                            docker/docker-bench-security'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}

