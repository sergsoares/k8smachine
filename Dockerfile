FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y docker.io docker-compose
RUN apt-get install -y fish
RUN apt-get install -y curl

RUN curl -LO https://github.com/junegunn/fzf/releases/download/0.25.1/fzf-0.25.1-linux_amd64.tar.gz
RUN tar -xvf fzf-0.25.1-linux_amd64.tar.gz
RUN chmod +x fzf
RUN mv fzf /usr/local/bin

## Kubectl 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin

# Kubect
RUN curl -LO https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx_v0.9.1_linux_x86_64.tar.gz
RUN tar -xvf kubectx_v0.9.1_linux_x86_64.tar.gz
RUN chmod +x kubectx
RUN mv kubectx /usr/local/bin

# Kubens
RUN curl -LO https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens_v0.9.1_linux_x86_64.tar.gz
RUN tar -xvf kubens_v0.9.1_linux_x86_64.tar.gz
RUN chmod +x kubens
RUN mv kubens /usr/local/bin

RUN curl -LO https://github.com/derailed/k9s/releases/download/v0.24.2/k9s_Linux_x86_64.tar.gz
RUN tar -xvf k9s_Linux_x86_64.tar.gz
RUN chmod +x k9s
RUN mv k9s /usr/local/bin

## Config
RUN mkdir -p /root/.kube
RUN echo "current-context: dummy" > /root/.kube/config

# Fish conf
COPY fish_prompt.fish /root/.config/fish/functions/fish_prompt.fish

RUN fish -c "set -Ux KUBECONFIG $HOME/.kube/config"
ENTRYPOINT fish
