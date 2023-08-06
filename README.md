# ipfs-infra
Dockerized infrastructure for a IPFS node

- Tested on Raspbian ARM7
- Tested on Windows 11

## Execute

```
$ docker-compose build
$ docker-compose up
```

### Ports
- 4001 tcp/udp for swarm connection
- 5001 tcp api management
- 8080 tcp gateway (HTTP)

Web console management:
http://<IP>:5001/webui 

