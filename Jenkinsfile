pipeline {
    agent any
        stages {
            stage('Install Environment') {
                agent {
                    label 'test'
                }
                steps {
                    sh 'python3 -m venv env'
                }
            }
            stage('Activate Environment && Install Library') {
                agent {
                    label 'test'
                }
                steps {
                    sh '''#!/bin/bash
                        source env/bin/activate && pip install -r ./requirements.txt
                    '''
                }
            }
            stage('Run Unittest') {
                agent {
                    label 'test'
                }
                steps {
                    sh '''#!/bin/bash
                        source env/bin/activate && python3 ./unittest.py
                    '''
                }
            }
            stage('Clean Workspace') {
                agent {
                    label 'test'
                }
                steps {
                    echo 'DownTime'
                    sh 'docker-compose -f ./compose.yaml down || true'
                    sh 'docker system prune -a -f || true'
                }
            }
            stage('Stop and Remove Docker Container') {
                agent {
                    label 'test'
                }
                steps {
                    echo 'Show Docker running'
                    sh 'docker ps'
                    echo 'Stop Docker all'
                    sh 'docker stop `docker ps -q` || true'
                    echo 'Delete Docker all'
                    sh 'docker rm `docker ps -aq` || true'
                }
            }
            stage('Create Container') {
                agent {
                    label 'test'
                }
                steps {
                    echo 'Run Container'
                    sh 'docker-compose -f ./compose.yaml up -d --build'
                }
            }
            stage('Run Robot') {
                agent {
                    label 'test'
                }
                steps {
                    echo 'Run Robot Testing'
                    sh 'robot ./test_prime.robot'
                }
            }
        }
}