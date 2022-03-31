## If you are using cloud provide kubeconfig (e.g gcloud, aws, az), wse this script to create a kubeconfig file that can be used in ISD
## setup->Cloud Providers->New Provider->Kubernetes, upload opsmx-kube-sa.config file that is created by this script.
#!/bin/bash
export NAMESPACE=opsmx-isd 
export SERVICEACCOUNT=opsmx-sa

kubectl create serviceaccount -n ${NAMESPACE} ${SERVICEACCOUNT} 

cat << EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: opsmx-admin-rolebinding
  namespace: ${NAMESPACE}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: ${SERVICEACCOUNT}
  namespace: ${NAMESPACE}
EOF

export USER_TOKEN_NAME=$(kubectl -n ${NAMESPACE}  get serviceaccount ${SERVICEACCOUNT} -o=jsonpath='{.secrets[0].name}')
export USER_TOKEN_VALUE=$(kubectl -n ${NAMESPACE}  get secret/${USER_TOKEN_NAME} -o=go-template='{{.data.token}}' | base64 --decode)
export CURRENT_CONTEXT=$(kubectl config current-context)
export CURRENT_CLUSTER=$(kubectl config view --raw -o=go-template='{{range .contexts}}{{if eq .name "'''${CURRENT_CONTEXT}'''"}}{{ index .context "cluster" }}{{end}}{{end}}')
export CLUSTER_CA=$(kubectl config view --raw -o=go-template='{{range .clusters}}{{if eq .name "'''${CURRENT_CLUSTER}'''"}}"{{with index .cluster "certificate-authority-data" }}{{.}}{{end}}"{{ end }}{{ end }}')
export CLUSTER_SERVER=$(kubectl config view --raw -o=go-template='{{range .clusters}}{{if eq .name "'''${CURRENT_CLUSTER}'''"}}{{ .cluster.server }}{{end}}{{ end }}')

cat << EOF > opsmx-kube-sa.config
apiVersion: v1
kind: Config
current-context: ${CURRENT_CONTEXT}
contexts:
- name: ${CURRENT_CONTEXT}
  context:
    cluster: ${CURRENT_CONTEXT}
    user: ${CURRENT_CONTEXT}
    namespace: ${NAMESPACE}
clusters:
- name: ${CURRENT_CONTEXT}
  cluster:
    certificate-authority-data: ${CLUSTER_CA}
    server: ${CLUSTER_SERVER}
users:
- name: ${CURRENT_CONTEXT}
  user:
    token: ${USER_TOKEN_VALUE}
EOF

## TEST the file
kubectl --kubeconfig $(pwd)/opsmx-kube-sa.config get nodes 
