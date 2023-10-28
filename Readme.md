# Carrot2 Kubernetes Resources

## Description

This project is built for deploying [Carrot2 Text Clustering Server](https://github.com/carrot2/carrot2) on Kubernetes. For the original Carrot2 code and documentation, visit their [GitHub repository](https://github.com/carrot2/carrot2).

This repository contains resources for running Carrot2 on Kubernetes, including a Helm chart, Dockerfile, and automated GitHub Actions.

## Quickstart

1. Clone the repository
    ```
    git clone https://github.com/yourusername/carrot2-k8s.git
    ```
2. Build the Docker image
    ```
    docker build -t carrot2-k8s .
    ```
3. Deploy using Helm
    ```
    helm install carrot2 ./carrot2-helm
    ```

## License

Apache 2.0
