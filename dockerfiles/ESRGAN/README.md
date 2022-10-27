# ESRGAN Upscaling

## Build

Building the 
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
    -v lowres:LR \
    -v results:results \
    esrgan
```

Custom usage with user provided pre-trained model.
Create a local folder called `models` and copy 
pre-trained models into the `models` folder. Mount

```
docker run \
    -v lowres:LR \
    -v results:results \
    -v models:models \
    esrgan
```

