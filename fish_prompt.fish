
function fish_prompt
  set CONTEXT (kubectx -c); or set CONTEXT %
  set NAMESPACE (kubens -c); or set NAMESPACE %
  echo [(echo $KUBECONFIG)] [(echo $CONTEXT)] [(echo $NAMESPACE)] [(pwd)] '> '
end

function kubeconfigc 
  set SELECTED (ls $HOME/.kube/ | fzf)
  set -Ux KUBECONFIG "$HOME/.kube/"(echo $SELECTED)
end
