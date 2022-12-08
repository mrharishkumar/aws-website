pipeline{
    agent any
    stages{
        stage('Git clone')
        {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mrharishkumar/robofriends']]])
            }
        }
        stage('Build') {
			steps {
				sh 'docker build -t mrharishkumar/robo_friends:latest .'
			}
		}
    stage('Push') {
      steps {
        script {
            withCredentials([string(credentialsId: 'paswd', variable: 'paswd')]) {
                sh "docker login -u kushh -p ${paswd}"
            }
            sh "docker push mrharishkumar/robo_friends"
            }
      }
	  }
    stage('start') {
      steps {
                sh "docker run -itd -p 80:80 --name webserver mrharishkumar/robo_friends"
          }
      }
   }
}
