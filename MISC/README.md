## This file contains additional files that can be used during or post-installation of ISD.

**secret-decoder.sh** : This is a script that can be used to refer to secrets stored in kubernetes in values.yaml. Edit the file and follow the instructions in the file header. Detailed instructions are [here](https://docs.google.com/document/d/1NLQFXyqwGqqWwxK8cNso-ALdDOJgVE90kNQ8z-c5nfU/edit?usp=sharing). **sample-secret-decode.inputfile** is provided for testing the changes.

**create-sample-job.yaml** : This is a kubenetes job-yaml that can be executed to create "opsmx-gitops" and "sampleapp" applications in ISD. 
These are generally created automatically during installation. However, in case that does not happen, edit this file and follow the instructions in the file header.

**isd-autoconfig-job.yaml**: The ISD initial configuration requires some basic integrations to be created. In case auto-config fails during installation,
we can edit this file and follow the instructions in the file header to re-do the configuration.

