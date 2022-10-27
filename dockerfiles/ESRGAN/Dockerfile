# Non Cuda x86 version

FROM python:3.9-slim

RUN apt-get update
RUN apt-get install -y \
    bash \
    git \
    curl \
    ffmpeg \
    libsm6 \
    libxext6
RUN apt-get clean

# Using this repo: https://github.com/xinntao/esRGAN
RUN git clone https://github.com/xinntao/ESRGAN
WORKDIR ESRGAN

# Prepare RRDB_ESRGAN_x4.pth for copy to docker image
# The models folder can be mounted to use preferred pre-trained model
COPY RRDB_ESRGAN_x4.pth models/RRDB_ESRGAN_x4.pth

# Install pytorch cpu only (non-cuda)
RUN pip install numpy opencv-python
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

RUN pip install opencv-contrib-python-headless
RUN apt-get install -y libgl1-mesa-glx 
# mount the LR folder to supply low-res images
# mount a results folder to 
CMD ["python", "test.py"] 
