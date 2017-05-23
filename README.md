# Nvidia-Docker Image Processing - Project Base
A nvidia-docker base image with:
* Cuda8.0
* Cudnn v5
* Opencv 3.2
* python 2.7 with Numpy and Scipy
* Caffe

## How to Use
 - [Install Docker](https://docs.docker.com/engine/installation/linux/ubuntu/)
 - [Install Nvidia's wrapper for Docker](https://github.com/NVIDIA/nvidia-docker)
 - Run "docker build -t projectbase github.com/JYandev/NDIP_ProjectBase"
 - Run "xhost local:root" in order to share x11 socket with docker (Needed for any GUI apps!)
 - Run "sudo nvidia-docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix projectbase"
 - If you want to add a shared folder, or "Volume" as it is referred to in docker, add a "-v /Example/Full/Directory:/New/Example/Full/Directory"

 You should now be in the terminal of the new container! Read up more on docker to learn how to best incorporate it into your workflow. I think [this guide on volumes](https://docs.docker.com/engine/tutorials/dockervolumes/#mount-a-shared-storage-volume-as-a-data-volume) will be extremely helpful for running your machine's code in any of your containers.
