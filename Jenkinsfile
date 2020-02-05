pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                 echo 'Building...'
                 pwd
                 ./dnsalert.bash
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
