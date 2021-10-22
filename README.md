# SA Exercise Infrastructure

### VPC

```
cd vpc
terragrunt apply
```

### EKS

```
cd eks
terragrunt apply
aws eks update-kubeconfig --name <cluster_name>
kubectl config use-context <context>
```

