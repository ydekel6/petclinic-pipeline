pipeline {

    agent any
    
/*     environment {
        PASS = credentials('registry-pass') 
    } */

    stages {

        stage('SCM checkout') {
            steps {
                sh '''
                    git clone https://github.com/ydekel6/petclinic-pipeline.git .
                    ./jenkins/scm/scm.sh
                ''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo build
                '''
            }

/*             post {
                success {
                   archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            } */
        }

        stage('Test') {
            steps {
                sh 'echo test'
            }

/*             post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            } */
        }

        stage('Push') {
            steps {
                sh 'echo push'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo deploy'
            }
        }
    }
}