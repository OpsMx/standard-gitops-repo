Instructions for using this sample are available here:
https://docs.google.com/document/d/1c0I-qf76QbRwpY8skvk4aj4WsjhcQ_Ba62_z5mdfqf8/edit?usp=sharing

This folder contains files required for gitops-style halyard

config and default : The init script copies them to go into .hal directory of the halyard pod

halyard.yaml: this, along with a generic halyard-local.yaml (created by init) are copied into the /opt/halyard/config folder

Triggering the hal-deploy-apply
This is achieved with two files

hal-deploy-apply.yaml: This is a job with halyard image that executes hal-deploy-apply command. It essentially waits for the halyard to be ready and executes "hal apply deploy".

USAGE
For this entire thing to work we need the following:

This folder
Helm-package that goes with this
A pipeline that executes that re-creates the halyard-pod (How?) and executes the hal-deploy-apply job.

SAMPLES
This folder contains sample values.yaml and agent configuration files.
