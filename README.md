1. Create a folder for installation (./kube, for example)
2. Fill up attributes in user-data.yml
- authorized-keys
- password
3. Create ubuntu-autoinstall.iso with the pasword and authorized-key (cloud-image) from user-data.yml
- ubuntu-autoinstall.sh
4. Create nodes
- edit create-nodes.sh and virt-install.sh
- create-nodes.sh