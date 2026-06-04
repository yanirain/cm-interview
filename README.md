# cm-interview

## Prerequisites
- Docker (Linux) or Docker Desktop with WSL2 backend (Windows/Mac)
- [kind](https://kind.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/)

## Setup

Create a local cluster:
```bash
kind create cluster --name interview
```

Deploy the app:
```bash
helm install cm-interview ./k8s-deployment/chart
```

Access it:
```bash
kubectl port-forward service/cm-interview 8080:8080 -n cm-interview
```
in another terminal:
```bash
curl http://localhost:8080
```

## Releasing

Tag a commit on main to trigger a new release:
```bash
git tag v1.x.x
git push --tags
```
The pipeline builds the Docker image, pushes it to ghcr.io, and updates the image tag in `values.yaml`.

## Stack
- **kind** — local cluster, runs in Docker, no VM needed
- **Helm** — templated K8s manifests, easy to configure per environment
- **GitHub Actions** — builds and pushes on git tag, auto-updates values.yaml
- **ghcr.io** — free container registry, no extra credentials needed