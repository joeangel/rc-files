
# Install

### TODO

- ssh key
- sudo without password
- create swap

## setup ssh via key

```bash
cat ~/.ssh/id_YOUR_KEY_NAME.pub | ssh <user>@<hostname> 'cat >> .ssh/authorized_keys && echo "Key copied"'
```

## setup

sudo without password

```bash
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu-nopasswd
sudo chmod 0440 /etc/sudoers.d/ubuntu-nopasswd
sudo visudo -c
sudo -k && sudo whoami
```

rc-files

```bash
cd ~
curl -OL https://raw.githubusercontent.com/joeangel/rc-files/refs/heads/clean-ubuntu-server/.bashrc
curl -OL https://raw.githubusercontent.com/joeangel/rc-files/refs/heads/clean-ubuntu-server/.bash_aliases
curl -OL https://raw.githubusercontent.com/joeangel/rc-files/refs/heads/clean-ubuntu-server/.inputrc
curl -OL https://raw.githubusercontent.com/joeangel/rc-files/refs/heads/clean-ubuntu-server/.tmux.conf
```

install packages

```bash
# Q: use apt instead of apt-get?
sudo apt-get update && sudo apt-get install -y tmux ack-grep git jq bash-completion
```

install docker

https://docs.docker.com/engine/install/ubuntu/

setup docker

```bash
docker info | grep -E "Docker Root Dir|Context|Rootless|Storage Driver"
id;groups
sudo usermod -aG docker ubuntu
newgrp docker
# logout and then login
id;groups
```

`/etc/docker/daemon.json`

```json
{
    "data-root": "/data/docker",
    "live-restore": true,
    "log-driver": "json-file",
    "log-opts": {
            "max-size": "10m",
            "max-file": "5"
    },
    "runtimes": {
        "nvidia": {
            "args": [],
            "path": "nvidia-container-runtime"
        }
    }
}
```

