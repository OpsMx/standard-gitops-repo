##These are sample service configuration files that are used for configuring

The procedure for using the agent is as follows:
1. Configure the agent in AP UI and download the manifest
2. The manifest is configured to be installed in "default" namespace. If you are installing the agent in any other namespace, 
please edit the manifest, locate "namespace:" in the clusterrolebinding object (there is only one "namespace:") and replace it with the namespace where you are installing it in.
3. Locate a suitable service-config file in this directory, edit it based on the instructions in the file and configure the services the agent is authorized to perform
4. Create the agent by creating the service configMap first and the creating the agent with "kubectl -n <your namespace> apply -f <edited manifest>
  
##Checking the agent functionality
1. Check the ISD UI to check if the agent shows "green"
2. If not, look at the logs of the agent pod to see what the error is
3. You can see the configured services in the logs of the pod when it starts off
