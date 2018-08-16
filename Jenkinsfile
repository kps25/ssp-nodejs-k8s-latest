
def doBuild(delivery) {

if('develop' == delivery.branchTag()) {

      def clusterSettings = readYaml file: '.k8s/env/develop/dev.yaml'
      def context = clusterSettings.context
      def namespace = clusterSettings.namespace
      def env = clusterSettings.env

    delivery.packageImage() // Build the docker image and push into dockerHub
    delivery.deployImage(context, namespace)  // deploy into k8s
    delivery.callApiAutomation(env) // Calling ApiAutomation Build
    }
  }

// Start of Job TEMPLATE
def delivery
node ('docker') {
  checkout scm

  stage(name: 'delivery') {

    checkout([$class: 'GitSCM', branches: [[name: "*/master"]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'delivery']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/salugu/ssp-groovy.git']]])

     delivery = load 'delivery.groovy'

    sh 'ls .'
  }
    try {
      //  delivery.notify_all("Starting", "warning", "mobile-pipeline")
        withCredentials([usernamePassword(credentialsId: 'ssp25', passwordVariable: 'dockerhubPass', usernameVariable: 'dockerhubUser')]) {
            sh "docker login -u ${dockerhubUser} -p ${dockerhubPass}"
        }
      doBuild(delivery)
    //  delivery.notify_all("SUCCESS", "good", "mobile-pipeline")
    } catch (e) {
        currentBuild.result = "FAILED"
        echo "${e.getClass().getName()} - ${e.getMessage()}"
    //    delivery.notify_all("${e.getClass().getName()} - ${e.getMessage()}", "danger", "mobile-pipeline")
        throw e
    }
}
// End of Job TEMPLATE

