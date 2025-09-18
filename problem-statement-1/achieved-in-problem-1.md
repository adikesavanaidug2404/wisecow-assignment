## Wisecow Assignment Project
# All setup code available in follwoing folders/file
- ci-cd script → /wisecow/.github/workflows/ci-cd.yml
- kubernetes manifests → /wisecow/k8s/
- application → /wisecow/wisecow.sh

## 1. Containerization
- **Action:** Created `Dockerfile` and built image `wisecow:latest`.
- **Tools:** Docker
- **Status:** ✅ Tested locally

---

## 2. Kubernetes Deployment
- **Action:**
  - Installed Minikube & kubectl on EC2.
  - Deployed `deployment.yaml`, `service.yaml` (NodePort), and `ingress.yaml` (with TLS).
  - Verified pod running and service accessible.
- **Tools:** Minikube, kubectl, NGINX Ingress, TLS secret
- **Status:** ✅ Access via Minikube IP and [https://wisecow.local](https://wisecow.local)

---

## 3. CI/CD Automation
- **Action:**
  - Setup GitHub self-hosted runner on EC2.
  - GitHub Actions workflow: checkout → build/push Docker image to GHCR → deploy manifests → rollout deployment.
- **Tools:** GitHub Actions, GHCR, kubectl, Docker Buildx
- **Status:** ✅ Automatic deploy on `master` push

---

## 4. TLS Verification
- **Action:** Verified HTTPS with `curl -k https://wisecow.local` and OpenSSL.
- **Tools:** curl, openssl
- **Status:** ✅ TLS working

---

## 5. Access Testing
- **NodePort URL:** `http://<minikube_ip>:30049`
- **TLS URL:** `https://wisecow.local`
