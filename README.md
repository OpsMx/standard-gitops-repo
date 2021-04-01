# This folder contains files required for gitops-style halyard
## This folder contains files required for git-based Halyard updates.
1. config and default : The init script copies them to go into .hal directory of the halyard pod
2. halyard.yaml: this, along with a generic halyard-local.yaml (created by init) are copied into the /opt/halyard/config folder

## Triggering the hal-deploy-apply
This is achieved with two files
1. hal-deploy-apply.yaml: This is a job with halyard image that executes hal-deploy-apply command. It essentially waits for the halyard to be ready and executes "hal apply deploy".

## USAGE
For this entire thing to work we need the following:
1. This folder
2. Helm-package that goes with this
3. A pipeline that executes that re-creates the halyard-pod (How?) and executes the hal-deploy-apply job.

## Info on Pipeline-promotion custom stage
### Pre-requisites:
    1. Git token to pull or push pipeline related information to pipelines
    2. Spin CLI configuration passed as a secret
    3. Configmap(pipe-promot-config-cm.yaml) to specify the behavior of pipeline promotion stage; which account to use for pipeline promotion? User email?
    4. pipe-promoto-scripts-cm.yaml to mount the scripts used for carrying out pipeline promotion.
  Templates to create above secrets and config maps are present in OES helm chart under templates/pipeline-promotion
