pipeline {
    agent none

    stages {
        stage("Préparation des JDD") {
            agent {
                docker {
                    image 'python:3.11'
                }
            }
            steps {
                sh '''
                    python3 -m pip install --upgrade pip
                    pip install -r requirements.txt
                    python3 resources/prepare_jdd.py
                '''
                stash includes: 'data/departments.csv', name: 'jdd'
            }
        }

        stage("Test API avec Robot Framework") {
            agent {
                docker {
                    image 'ppodgorsek/robot-framework'
                    args  '-u root'
                }
            }
            steps {
                unstash 'jdd'
                sh '''
                    mkdir -p results
                    robot --outputdir results tests/
                '''
            }
            post {
                always {
                    archiveArtifacts artifacts: 'results/*.xml', allowEmptyArchive: true
                    junit 'results/output.xml'
                }
            }
        }
    }
}
