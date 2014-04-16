R-lang
======
Ubuntu 13.10 that you can SSH into. Can run GUI apps with x11 forward. R installed.

Usage
-----

```bash
# [Optional] Build Docker image (you can skip to the next step to fetch from the registry)
docker build -t bmpvieira/r-lang .
# Run a new container in detached mode with SSH server running
docker run -d -p 42222:22 bmpvieira/r-lang
# [OSX specific] Forward port to boot2docker VM (keep open and use another terminal)
boot2docker ssh -L 42222:localhost:42222 #password: tcuser
# Find IP address of the running container (check the PORTS column). On OSX it will always be localhost.
docker ps
# Connect to Docker container through SSH with X11 forward.
ssh root@localhost -p 42222 -Y #password: root
```

License
-------
[MIT](https://raw.github.com/bmpvieira/Dockerfiles/master/LICENSE)
