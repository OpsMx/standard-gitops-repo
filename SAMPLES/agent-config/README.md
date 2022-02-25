## These are sample service configuration files for using the agent

The procedure for using the agent is as follows:
1. Configure the agent in AP UI and download the manifest as described [here](https://docs.opsmx.com/products/opsmx-intelligent-software-delivery-platform/system-setup/opsmx-agent/installation)
2. The manifest is pre-configured to be installed in "default" namespace. If you are installing the agent in any other namespace 
please edit the manifest, locate "namespace:" in the clusterrolebinding object (there is only one "namespace:") and replace it with the namespace where you are installing it in
3. Locate a suitable service-config file in this directory, edit it based on the instructions in the file and configure the services (e.g. Jenkins, k8s account) the agent is authorized to perform. Create it with "kubectl -n <your namespace> apply -f **service-config.yaml**"
4. Create the agent by creating the service configMap first and the creating the agent with "kubectl -n <your namespace> apply -f **agent-manifest**"
  
## Checking the agent functionality
1. Check the ISD UI to check if the agent shows "green"
2. If not, look at the logs of the agent pod to see what the error is
3. You can see the configured services in the logs of the pod when it starts off
  
## Using the configured services
- In the **Setup->Integrations** and **Setup->Cloud Providers**, we should see the services. Please "accept" them, wait for a few minutes and the services should show up in Spinnaker
