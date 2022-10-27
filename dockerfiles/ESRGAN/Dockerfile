# Non Cuda x86 version

FROM python:3.9-slim

RUN apt-get update
RUN apt-get install -y \
    bash \
    git \
    curl \
    build-essential
RUN apt-get clean

# Using this repo: https://github.com/xinntao/esRGAN
RUN git clone https://github.com/xinntao/ESRGAN
WORKDIR ESRGAN

# Prepare RRDB_ESRGAN_x4.pth for copy to docker image
# The models folder can be mounted to use preferred pre-trained model
COPY RRDB_ESRGAN_x4.pth models/RRDB_ESRGAN_x4.pth

# Install pytorch cpu only (non-cuda)
RUN pip install numpy opencv-python
RUN pip install torch==1.8.2 torchvision==0.9.2 torchaudio==0.8.2 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cu102

# mount the LR folder to supply low-res images
# mount a results folder to 
CMD ['python', 'test.py'] 
