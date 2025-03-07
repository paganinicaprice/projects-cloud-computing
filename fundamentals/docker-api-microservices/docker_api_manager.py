import docker

try:
    client = docker.DockerClient(base_url="npipe:////./pipe/docker_engine")  # Windows
except:
    client = docker.DockerClient(base_url="unix:///var/run/docker.sock")  # Linux

print("\n Running Containers:")
for container in client.containers.list():
    print(f"- {container.name} ({container.status})")

print("\n Starting a new microservice container...")
container = client.containers.run(
    "my-microservice",
    name="microservice-api",
    ports={"5000/tcp": 5001},
    detach=True
)
print(f"Container {container.name} started successfully!")

print("\n Container Details:")
import json
print(json.dumps(container.attrs, indent=4))

input("\nPress ENTER to stop and remove the container...")
container.stop()
container.remove()
print("Container stopped and removed.")
