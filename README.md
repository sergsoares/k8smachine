k8smachine

An opinated docker image with installed tools for K8S working and fish_prompt changed:

- kubectl
- kubectx
- kubens
- fish
- fzf
- kubeconfigc (fish shell function)

To build docker image:
``` 
docker build -t k8smachine .
``` 

To run image, mount your .kube/ or other folder with configurations:
```
docker run --rm --network host -v ~/.kube:/root/.kube -it k8smachine
```

