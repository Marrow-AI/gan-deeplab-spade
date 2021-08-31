# Drawing the inner world of GauGAN
_
#### Ars Electronica hackathon.

# Background

#### The Marrow Project
#### A collaboration with shirin anlen
#### Supported by the National Film Board of Canada and Atlas V

- _Marrow_ is an interactive theater piece where the participants
play the role of machine learning models in a family dinner setting.

- It asks the question:
**If an AI reaches the level of complexity required to achieve mental states, 
could it also exhibit mental disorders?**

- Each participant receives a random role of one of the family members:
Mother, Father, Brother, or Sister.

- Once seated, they are immersed in an AI powered environment that
reflects upon the story and real-life happenings.

- The main focus was on the GAN generative network.

[see shirin's page](https://shirin.works/Marrow-teach-me-how-to-see-you-mother-Machine-learning-immersive)

# GAN
#### How does GAN see the world?
#### Can we generate a mirror or the room in GAN's eyes?

- Traditionally, GAN is trained to reproduce images.

[Example](https://thiscatdoesnotexist.com)

- But _Conditional_ GAN can produce images based on input

[Example](https://affinelayer.com/pixsrv/)

- GAN _perceives_ and then _generates_ (don't we all?)

- A more sophisticated conditional GAN, which understands semantics:

[SPADE/GauGAN](http://nvidia-research-mingyuliu.com/gaugan)

# GauGAN

#### How does it see the world?

- It (the trained model) sees [COCO-Stuff](https://github.com/nightrome/cocostuff)

- We can also see COCO-Stuff using:
[DeepLab](https://github.com/tensorflow/models/tree/master/research/deeplab)

```python
        _, frame = cap.read() # Read from webcam
        image, raw_image = preprocessing(frame, device, CONFIG) #Format image
        labelmap = inference(model, image, raw_image, postprocessor) # Run model
```

- **Demo**

# SPADE
#### Can we 'inject' a drawing?

```python
        labelimg = Image.fromarray(np.uint8(labelmap), 'L')
        # Instance image derived from the labels
        item = coco_dataset.get_item_from_images(labelimg, instanceimg)
        generated = spade_model(item, mode='inference')
        generated_np = util.tensor2im(generated[0])
        generated_rgb = cv2.cvtColor(generated_np, cv2.COLOR_BGR2RGB)
```

# Let's play

#### Manipulating GauGAN's world of COCO-stuff labels

- The labels file:
```
./deeplab-pytorch/data/datasets/cocostuff/labels.txt
```

- Making a change:
```python
labelmap[labelmap == 43] = 118 # Map bottle to flower
labelmap[labelmap == 63] = 16 # Potted plant to cat
```

- Clean up the scene
```python
mask = np.isin(labelmap, [118,16,0] , invert=True)
labelmap[mask] = 156 #Everything else is sky (include person == 0)
```


# About me
[Hello](www.google.com)
