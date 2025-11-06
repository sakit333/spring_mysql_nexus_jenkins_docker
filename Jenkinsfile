// ################################################################################
// #  Jenkins Pipeline for Docker Compose Deployment
// #  Designed and Developed by: @sak_shetty
// #  Description:
// #    - Deploys Spring Boot app, MySQL, and Nexus using Docker Compose
// #    - Supports choices: Deploy or Remove
// #    - Cleans all images, volumes, and orphan containers when removing
// ################################################################################

pipeline {
    agent any

    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }

    parameters {
        choice(
            name: 'ACTION',
            choices: ['Deploy', 'Remove'],
            description: 'Select the action to perform on Docker Compose stack'
        )
    }

    stages {
        stage('Docker Compose Deploy') {
            when {
                expression { params.ACTION == 'Deploy' }
            }
            steps {
                echo "🚀 Building and starting containers..."
                sh '''
                docker-compose -f $COMPOSE_FILE up -d --build
                '''
            }
        }

        stage('Docker Compose Remove & Cleanup') {
            when {
                expression { params.ACTION == 'Remove' }
            }
            steps {
                echo "🧹 Stopping containers and cleaning all resources..."
                sh '''
                docker-compose -f $COMPOSE_FILE down --rmi all --volumes --remove-orphans
                docker system prune -af
                docker volume prune -f
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline executed successfully! - Designed and Developed by sak_shetty"
        }
        failure {
            echo "❌ Pipeline failed. Check Jenkins logs! - Designed and Developed by sak_shetty"
        }
    }
}
