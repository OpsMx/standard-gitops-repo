## GitOps repo for use with ISD installation
### Instructions for installed ISD are available [here](https://docs.google.com/document/d/1D2drat72nj58q-sBjf-HDBX_HuBuBzJQsx4O7BVhWIc/edit#heading=h.pav61t9jb26z)

Typically, you do not need to modify any of these files. Simple copy them into your own repo.

This folder contains files required for gitops-style halyard

**config, halyard.yaml and default(directory)** : The init script copies them to go into .hal directory of the halyard pod after some processing and replacing the secrets.


SAMPLES
This folder contains sample various "values.yaml" files for use with the helm install and agent configuration files for configuring agent services, if you are using the agent/controller functionality. We recommend starting with "easy-valyes.yaml" for installing ISD for the 1st time.

MISC
This folder contains some support scripts and yamls. Notably:
**secret-decoder.sh**: This file allows for placing references to k8s secrets in values.yaml files so that the file can be checked into a repo

**delete-install.sh**: Force remove ISD installed objects from k8s

**create-sample-job.yaml**: A k8s job yaml to manually create samplepp application that contains to a number of example pipelines, a very easy place to start.

**isd-autoconfig-job.yaml**: In case autoconfiguration fails during the installation, this job can be executed to attempt autoconfiguration once again.
