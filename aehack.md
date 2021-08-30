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

```
        _, frame = cap.read() # Read from webcam
        image, raw_image = preprocessing(frame, device, CONFIG) # Process image
        labelmap = inference(model, image, raw_image, postprocessor) # Run model
```

# About me
[Hello](www.google.com)
