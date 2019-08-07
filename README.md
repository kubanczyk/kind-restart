# Kind Restart

Bring up the local dev system (laptop):
  - Helm 3 (so, no tiller)
  - Kubernetes on a docker with kind (3 nodes on 1 system)

Unfortunately kind clusters don't survive docker daemon restarts. Hence
this script to destroy the current cluster and set up a new one.

# Requirements

  - Linux with `snap` (Ubuntu 18 or 19 is fine)
  - root access via sudo

# Initial setup

```bash
snap install --classic docker
snap install --classic kubectl
snap install --classic go
GO111MODULE="on"    go get sigs.k8s.io/kind@v0.4.0
sudo cp -p "$(go env GOPATH)/bin/kind" /usr/local/bin/kind
```

(The source is an official kind website as of 2019-08.)

# Usage

```bash
./kind-restart.sh
export KUBECONFIG=~/.kube/kind
```

# Can I run it at system startup?

Yes. Run the script as root. Just make sure that root account has `sudo` access.

