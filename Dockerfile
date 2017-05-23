### Goal Image ###
## Ubuntu 14.04
## Cuda 8.0
## CuDNN v5
## Opencv 3.1
## Python 2.7 with Numpy & Scipy
## Caffe
### ###

### Instructions ###
# Install docker
# Install nvidia-docker wrapper for docker
# Run "docker build -t projectbase github.com/JYandev/NDIP_ProjectBase"
# Run "xhost local:root" in order to share x11 socket with docker (used to run GUI apps).
# Run "sudo nvidia-docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix projectbase"
### ###

# Set the base image to Nvidia's Cuda+Cudnn Ubuntu
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

# Update the repository sources list
RUN apt-get update

### Extra Cuda Samples (Located in /usr/local/cuda/samples)###
RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-samples-$CUDA_PKG_VERSION && \
rm -rf /var/lib/apt/lists/*

### Caffe Installation ###
ENV CAFFE_PKG_VERSION 0.15.13-3ubuntu14.04+cuda8.0
RUN apt-get update && apt-get install -y --no-install-recommends \
        caffe-nv=$CAFFE_PKG_VERSION \
        caffe-nv-tools=$CAFFE_PKG_VERSION \
        python-caffe-nv=$CAFFE_PKG_VERSION \
        libcaffe-nv0=$CAFFE_PKG_VERSION && \
    rm -rf /var/lib/apt/lists/*

### Python Stack Installation ###
RUN apt-get update -y
RUN sudo apt-get install -y build-essential cmake
RUN apt-get install -y qt5-default libvtk6-dev
RUN apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev
RUN apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
RUN apt-get install -y libtbb-dev libeigen3-dev
# RUN apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

### Opencv 3.1 Installation ###
RUN apt-get install -y unzip wget
RUN wget https://github.com/opencv/opencv/archive/3.2.0.zip && unzip 3.2.0.zip && rm 3.2.0.zip && mv opencv-3.2.0 OpenCV && cd OpenCV && mkdir build && cd build && cmake .. && make -j8 && make install && ldconfig

# Set work directory as the cuda samples folder
WORKDIR /usr/local/cuda/samples

### File Author / Maintainer ###
MAINTAINER Joseph Yankel
