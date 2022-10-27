# ESRGAN Upscaling

## Build

Building the ESRGAN upscaling docker image. Download the 
pre-trained model from the github repository readme and
place in the same directory as the `Dockerfile`

```
docker build -t esrgan .
```

## Usage

Normal usage with included pre-trained  model.
Copy all low-res images into a folder (`lowres`) and
mount the folder to `LR`.
create a local folder called `results` and mount it
to the folder `results`. The upscaled images will be
stored in the `results` folder.

```
docker run \
    -v `pwd`/lowres:/ESRGAN/LR \
    -v `pwd`/results:/ESRGAN/results \
    esrgan
```

Custom usage with user provided pre-trained model.
Create a local folder called `models` and copy 
pre-trained models into the `models` folder. Mount

```
docker run \
    -v `pwd`/lowres:/ESRGAN/LR \
    -v `pwd`/results:/ESRGAN/results \
    -v `pwd`/models:/ESRGAN/models \
    esrgan
```

### CPU mode (non-CUDA)

the `test.py` script is defaulted to using CUDA. To fix this,
`bash` into the container and install `vim` to edit `test.py`
and update with `cpu` line.
