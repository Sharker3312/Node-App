pipeline {
    agent any

    tools{
        nodejs '21.4.0'
    }
    

    stages {
        stage('Checkout código desde GitHub') {
            steps {
                script {
                    // Clonar el repositorio desde GitHub
                    checkout scm
                }
            }
        }

        stage('Instalar Dependencias') {
            steps {
                script {
                    // Navegar al directorio del proyecto y ejecutar npm install
                    sh 'npm version'
                    sh 'npm install'
                }
            }
        }

        stage('Iniciar Aplicación') {
            steps {
                script {
                    // Navegar al directorio del proyecto y ejecutar node app.js
                    sh 'NODE_DEBUG=* node app.js'
                }
            }
        }
    }
}