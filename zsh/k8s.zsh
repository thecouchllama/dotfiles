# Kubernetes-related configurations

if [[ -d "$HOME/.krew" ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi
