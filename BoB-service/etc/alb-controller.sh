eksctl utils associate-iam-oidc-provider \
    --region ap-northeast-2 \
    --cluster prd-eks \
    --approve

curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.6.1/docs/install/iam_policy.json

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json

eksctl create iamserviceaccount \
    --cluster=prd-eks \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=arn:aws:iam::560971842042:policy/AWSLoadBalancerControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --region ap-northeast-2 \
    --approve

helm repo add eks https://aws.github.io/eks-charts

wget https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml
kubectl apply -f crds.yaml

helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=prd-eks --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller