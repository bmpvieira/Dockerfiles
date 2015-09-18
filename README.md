Dockerfiles
===========
My Dockerfiles. Trusted Builds also available in the [Docker registry](https://index.docker.io/u/bmpvieira/)  
Each folders contains a README with more information about the respective Dockerfile.

The next sections of this README contain some useful tips that I found and kept here for quick reference.

Useful Commands
---------------

```bash
# Stop all containers
docker stop (docker ps -a -q)
# Remove all containers
docker rm (docker ps -a -q)
# Remove all images
docker rmi (docker images -a -q)
```

Run containers without Docker
-----------------------------
Docker has great features, however in most HPC it cannot be used due to [security issues](https://docs.docker.com/articles/security/).
However, the OS can be extracted from a container and run with chroot or in a VM.
Example:
```bash
docker ps -a 
# CONTAINER ID        IMAGE                    COMMAND             CREATED             STATUS                           PORTS               NAMES
# d555fe341045        busybox                  "/bin/sh"           About an hour ago   Exited (139) About an hour ago                       elegant_poitras
docker export elegant_poitras > elegant_poitras.tar
tar xf elegant_poitras.tar
npm install -g mini-container
sudo mini-container bin/sh
```

# Some of the info below might be deprecated with new boot2docker

Docker on OSX
-------------
Since OSX isn't Linux and Docker is based on Linux Containers (LXC), the closest
you can get is to use boot2docker, a Linux VM, to run a Docker daemon inside to which the Docker
client on the OSX terminal can connect to build images and run containers.


### Setup ###

```bash
# Install
brew install boot2docker
brew install docker
# Get patched iso for shared folders (see: [boot2docker/pull/284](https://github.com/boot2docker/boot2docker/pull/284))
curl https://dl.dropboxusercontent.com/u/12014139/boot2docker.iso --create-dirs -o ~/.boot2docker/boot2docker.iso
# Create boot2docker VM
boot2docker init
# Add shared folder to boot2docker
VBoxManage sharedfolder add boot2docker-vm -name home -hostpath $HOME
# Export environment variable with address for Docker client to connect
echo 'export DOCKER_HOST=tcp://localhost:4243' >> ~/.profile
# Start boot2docker VM
boot2docker up
# Mount shared folder inside VM (password: tcuser)
boot2docker ssh "sudo modprobe vboxsf && mkdir -p $HOME && sudo mount -t vboxsf home $HOME"
```

### Workarounds ###

The following are temporary workaround to get shared folders between the host
and the Docker container working, and port forwarding (for example for web apps or ssh).  
See the [boot2docker repo](https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md) for more info.

#### Shared folders ####

Because we used a [patched iso](https://github.com/boot2docker/boot2docker/pull/284), the ```-v``` parameter should just work:

```bash
docker run -v ~/share:/share ubuntu
```

See the [Docker documentation](http://docs.docker.io/en/latest/reference/commandline/cli/#run) for more info.


#### Forward Ports #####

The simplest is to just do:

```bash
# e.g. Port 8080
boot2docker ssh -L 8000:localhost:8000 # keep it open
```

See the [boot2docker repo](https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md#port-forwarding) for more info.

License
-------
[MIT](https://raw.github.com/bmpvieira/Dockerfiles/master/LICENSE)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/bmpvieira/dockerfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

