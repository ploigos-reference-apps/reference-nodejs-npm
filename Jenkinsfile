pipeline {
        options {
            ansiColor('xterm')
        }
        agent {
            kubernetes {
                cloud 'openshift'
                yaml """
    apiVersion: v1
    kind: Pod
    metadata:
        labels:
            jenkins-build-id: ${env.BUILD_ID}
    spec:
        serviceAccount: ${params.workflowServiceAccountName}
        containers:
        - name: ploigos
          image: "quay.io/dwinchell_redhat/ploigos-workspace"
          imagePullPolicy: "IfNotPresent"
          tty: true
          volumeMounts:
          - mountPath: /home/ploigos
            name: home-ploigos
        volumes:
        - name: home-ploigos
          emptyDir: {}
    """
            }
        }

        stages {
            stage('Setup') {
                steps {
                    container('ploigos') {
                        script {
                            sh "npm config set cache ${WORKSPACE}/npm-cache"
                            sh 'npm install'
                        }
                    }
                }
            }
            stage('Unit Test') {
                steps {
                    container('ploigos') {
                        script {
                            sh 'psr unit-test'
                        }
                    }
                }
            }
            stage('Quality Scan') {
                steps {
                    container('ploigos') {
                        script {
                            sh 'psr quality'
                        }
                    }
                }
            }
        }
}
