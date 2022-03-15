#!/bin/bash
################################################################################
# PLEASE REPLACE the KUBECTL command as required
# jq command is required: https://stedolan.github.io/jq/download/
################################################################################
# Simple script replace k8s secrets with their values in any file
# Any file with "encrypted:SECRET-NAME:KEY" will be replaced with the value
# found in a kubernetes secret with name "SECRET-NAME" containing a secret
# referenced by KEY
# usage: cat values.yaml | ./secret-decoder.sh | helm install oes opsmx/oes -f -
################################################################################
# PLEASE REPLACE the KUBECTL command below as required
# Also, change SEDCHAR to a charected that is NOT present in any of the secret-values
################################################################################
KUBECTL="kubectl"
SEDCHAR="?"
echo "##########Replacing Secrets#########"
while IFS= read -r line ; do
encrypted=$(echo $line | grep encrypted: | cut -d : -f1 )
if [[ $encrypted == "" ]] ;
then
  echo "$line"
  continue
else
secret=${line#*encrypted:}
secretName=${secret%%:*}
keyName=${secret#*:} 
keyName=${keyName%%\"*} 
keyName=${keyName%% *} 
jqParam=".data.\"$keyName\""
value=$($KUBECTL get secret $secretName -o json | jq -r $jqParam | base64 -d)
value=$(echo $value | sed -e 's`[][\\/.*^$]`\\&`g')
checkValid=$(echo ${keyName}:${value} | grep $SEDCHAR)
if [[ $checkValid != "" ]];
then
  echo "Underscore charecter, $SEDCHAR , is not allowed key or value of a secret. If required change the script to use another charecter"
  exit 1
fi
#echo $value
echo "$line" | sed s${SEDCHAR}encrypted:$secretName:${keyName}${SEDCHAR}${value}${SEDCHAR}
fi
done 
