from kubernetes import client, config

config.load_kube_config()
apps_v1 = client.AppsV1Api()

def scale_microservice(name, replicas):
    apps_v1.patch_namespaced_deployment_scale(
        name=name, namespace="default", body={"spec": {"replicas": replicas}}
    )
    print(f"🔹 Scaled {name} to {replicas} replicas.")

scale_microservice("microservice-deployment", 5)
