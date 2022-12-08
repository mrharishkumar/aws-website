pipeline{
    agent any
    stages{
        stage('Git clone')
        {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mrharishkumar/aws-website']]])
            }
        }
        stage('Build') {
			steps {
				sh 'docker build -t mrharishkumar/aws_website:latest .'
			}
		}
    stage('Push') {
      steps {
        script {
            withCredentials([string(credentialsId: 'paswd', variable: 'paswd')]) {
                sh "docker login -u mrharishkumar -p ${paswd}"
            }
            sh "docker push mrharishkumar/aws_website"
            }
      }
	  }
    stage('start') {
      steps {
                sh "docker run -itd -p 80:80 --name webserver mrharishkumar/aws_website"
          }
      }
   }
}
