# Drawing the inner world of GauGAN

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

# Other things

- NYTimes R&D: 3D Environmental photography and LiDAR scanning
<img src="https://static01.nyt.com/images/2021/05/16/nyregion/16gospelchoirsA/merlin_186911460_81ee06a7-00dc-4daf-8702-8fb189da4555-superJumbo.jpg" width=300>

[Story](https://www.nytimes.com/interactive/2021/05/12/nyregion/harlem-gospel-church-choir.html)

[USUS California wildfires](https://bit.ly/3kGRDbR)

**Ask me about open source 3D visualization**

# Other things

- Aalto PhD: Telerobotic puppetry
<img src="https://cloud.avner.us/index.php/s/48ZqJ7x5c297C4i/download">
<img src="https://cloud.avner.us/index.php/s/5SKY46rQtwqDq7A/download">

[Blog post](https://bit.ly/3kB9pO0)
[Mediapipe Hands](https://google.github.io/mediapipe/solutions/hands.html)

**Ask me about Inverse Reinforcement Learning**

# Thank you
