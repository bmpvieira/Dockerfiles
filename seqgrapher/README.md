SeqGrapheR
==========
>Simple GUI for graph based visualization of cluster of DNA sequence reads
by [Petr Novak](http://cran.r-project.org/web/packages/SeqGrapheR/index.html)

Ubuntu 13.10 with SSH, R and SeqGrapheR

Usage
-----

```bash
# [Optional] Build Docker image (you can skip to the next step to fetch from registry)
docker build -t bmpvieira/seqgrapher .
# Run new container in detached mode with SSH server running and shared folder
docker run -d -p 42222:22 -v ~/share:/share bmpvieira/seqgrapher
# [OSX specific] Forward port to boot2docker VM (keep open and use another terminal)
boot2docker ssh -L 42222:localhost:42222 #password: tcuser
# Find IP address of the running container (check the PORTS column). On OSX it will always be localhost.
docker ps
# Connect to Docker container through SSH with X11 forward.
ssh root@localhost -p 42222 -Y #password: root
# Run SeqGrapheR
R
```
```R
library(SeqGrapheR)
SeqGrapheR()
```

License
-------
[MIT](https://raw.github.com/bmpvieira/Dockerfiles/master/LICENSE)
