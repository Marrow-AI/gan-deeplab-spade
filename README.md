# gan-deeplab-spade

Code for [‘Drawing’ the inner world of a story using GauGAN in a real environment](https://towardsdatascience.com/drawing-the-inner-world-of-a-story-using-gaugan-in-a-real-environment-d8e303aaa2f9).

![gif](https://raw.githubusercontent.com/Marrow-AI/gan-deeplab-spade/master/gaugan.gif)

## Installation

Clone the repository including its submodules
```
git clone --recurse-submodules git@github.com:Marrow-AI/gan-deeplab-spade.git
```

Create and activate a conda environment from the suppplied file
```
cd gan-deeplab-spade
conda env create --file environment.yml
conda activate deeplab-spade
```

Download the DeepLabV2 CocoStuff checkpoint:
```
mkdir -p checkpoints/deeplab
gdown --id 18kR928yl9Hz4xxuxnYgg7Hpi36hM8J2d -O checkpoints/deeplab/deeplabv2_resnet101_msc-cocostuff164k-100000.pth
```
Download and extract the SPADE checkpoint:
```
mkdir -p checkpoints/spade
gdown --id 12gvlTbMvUcJewQlSEaZdeb2CdOB-b8kQ -O checkpoints/spade/checkpoints.tar.gz
tar xvf checkpoints/spade/checkpoints.tar.gz -C checkpoints/spade/
```
## Running
Run the demo to generate images from your webcam:
```
./demo_spade.sh
```

## Label manipulation
The demo transforms bottles (label ID 43) into flowers (label ID 118) in [this line](https://github.com/Marrow-AI/gan-deeplab-spade/blob/master/demo_spade.py#L285):
```
labelmap[labelmap == 43] = 118
```
Mappings between IDs and labels are found [here](https://github.com/Avnerus/deeplab-pytorch/blob/master/data/datasets/cocostuff/labels.txt).


## Attribution
- Feel free to use the code for any purpose, but we request that you attribute the work to [_shirin anlen_](https://github.com/ShirinStar) and [_Avner Peled_](https://github.com/avnerus/) of the [_Marrow_](https://shirin.works/Marrow-dev-phase-Machine-learning-immersive-theater-WIP) project.
- Deeplab pytorch implementation by [Kazuto Nakashima](https://github.com/kazuto1011/deeplab-pytorch).
- GauGAN SPADE implementation by [NVIDIA Corporation](https://github.com/NVlabs/SPADE).

Thank you and enjoy!


