# DigitalOcean Kubernetes Example

Proof-of-concept with DigitalOcean's Kubernetes Service and a single application

## Getting started

### Provisioning the cluster

> @TODO - This part is a work in progress, provision the cluster in the UI until it's done

```
cd terraform
terraform init
terraform apply
```

### Deploying Global Manifests

```
kubectl apply -f ./k8s-global
```

### Deploying Manifests

```
kubectl apply -f ./k8s
```
