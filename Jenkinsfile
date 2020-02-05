pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                 echo 'Building...'
                 exit 0
             }
             post {
                 always {
                     jiraSendBuildInfo site: 'secretbeach.atlassian.net'
                 }
             }
         }
     }
 }
