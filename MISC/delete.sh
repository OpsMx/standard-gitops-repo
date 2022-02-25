kubectl -n opsmx-isd delete deploy --all
kubectl -n opsmx-isd delete sts --all
kubectl -n opsmx-isd delete svc --all
kubectl -n opsmx-isd delete ing --all
kubectl -n opsmx-isd delete cm --all
kubectl -n opsmx-isd delete secrets --all
kubectl -n opsmx-isd delete role --all
kubectl -n opsmx-isd delete rolebinding --all
kubectl delete ns opsmx-isd

