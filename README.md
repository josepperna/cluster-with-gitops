kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:443

argocd admin initial-password -n argocd

argocd account update-password

app create cluster-bootstrap --repo https://github.com/josepperna/cluster-with-gitops.git --path argocd/apps --dest-server https://kubernetes.default.svc --dest-namespace default


prometheus queries 

100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100
