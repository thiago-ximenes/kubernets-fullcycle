# Annotations

## 1. [Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
Wait for the pod to be ready before sending traffic to it. If the pod is not ready, it is removed from the endpoints of all services that match it, until it becomes ready again.

-  Liveness probes are used to know when to restart a container. For example, if a container is running but the application is not responding, a liveness probe will restart the container.
- Readiness probes are used to know when a container is ready to start accepting traffic. For example, if a container needs to load a large dataset into memory, it might be best to delay starting the container until after the dataset has been loaded. While the container is loading the dataset, it can fail readiness probes, and won't be added to the pool of endpoints of a Service until it is ready. This can prevent traffic from being routed to a container that isn't ready to handle it.
- Startup probes are used to know when a container application has started. In some cases, you need to know when an application is completely started. For example, a web server might require several seconds to load large configuration files, or a database might need to complete a lengthy recovery process. In these cases, you don't want to kill the container if the probe fails, but you don't want to send it requests either. Startup probes are useful for this purpose. Readiness and liveness probes are disabled until the startup probe succeeds.

## 2. [ByPass Metric Server](https://github.com/kubernetes-sigs/metrics-server/issues/525)

- 1.1. Download the metrics-server.yaml file from the metrics-server repository:

```bash
wget  https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml 
```

1.2. Edit the downloaded file and add the following arguments to the metrics-server container:

```yaml 
- --kubelet-insecure-tls
```

1.3. Deploy the metrics-server:

```bash
kubectl apply -f metrics-server.yaml
```
