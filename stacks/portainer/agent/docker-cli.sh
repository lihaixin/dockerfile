docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v /:/host \
  -v /var/portainer_agent_data:/data \
  --restart always \
  -p 9001:9001 \
  -p 9090:9090 \
  -e EDGE=0 \
  -e EDGE_ID=733c7ebf-6804-4604-ae41-a1444b6cec34 \
  -e EDGE_KEY=aHR0cHM6Ly91aS0yLjE1MDk5Lm5ldHx1aS0yLjE1MDk5Lm5ldDo4MDA4fDROaFAzd2lsOENIbkFLYzl6Mi9DUndGQkhJWGF1LzRlZnhpbVdzWlhBNXc9fDQ5NA \
  -e EDGE_INSECURE_POLL=1 \
  --name ui2 \
  lihaixin/portainer:agent-2.19.5 
