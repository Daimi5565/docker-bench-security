pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository containing the Docker Bench for Security
                git 'https://github.com/Daimi5565/docker-bench-security.git'
            }
        }

        stage('Run Docker Bench for Security') {
            steps {
                script {
                    // Run Docker Bench for Security using Docker
                    sh '''
                        docker run --privileged -v /var/run/docker.sock:/var/run/docker.sock \
                        -v /etc:/etc -d docker/docker-bench-security
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up after the pipeline
            echo 'Pipeline execution completed.'
        }
    }
}
