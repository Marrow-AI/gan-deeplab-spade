#!/bin/sh
python demo_spade.py live -c cocostuff164k.yaml -m checkpoints/deeplab/deeplabv2_resnet101_msc-cocostuff164k-100000.pth --dataset_mode coco --dataroot SPADE/datasets/coco_stuff/ --checkpoints_dir checkpoints/spade --exp_name coco_pretrained
