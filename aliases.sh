alias k=kubectl

alias venv='f() { name=$1; if [[ -z $name ]]; then echo "name is required"; return 1; fi; if [[ ! -d ~/.venv/$name ]]; then python3.13 -m venv ~/.venv/$name; fi; source ~/.venv/$name/bin/activate; }; f'

# Docker & Kubernetes
alias kx='kubectl config use-context'
alias ksw='kubectl config set-context --current --namespace'
alias kexec='kubectl exec -it'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
