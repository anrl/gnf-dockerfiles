glanf VNF dockerfiles
===========

This repository contains NFs implemented by the authors of the [GLANF framework](https://netlab.dcs.gla.ac.uk/projects/glasgow-network-functions).


Installation
============

This setup requires *sudo* permissions and also makes network level changes. Thus it is best to experiment with it in a Linux VM or use the **testing** docker image within which *docker* is installed.

### Pre-req
1. If running *glanf*  in host or VM then you need the `pipework` tool
    - You can get it [here](https://github.com/jpetazzo/pipework)
    - It is a shell script named *pipework*
    -Just copy this file to */usr/bin*

2. Must have **docker** installed

3. Must have python package `flask-restful` installed to run the test *webapp*
    - You can install it using **pip** : `pip install flask-restful` 

### Build 

- Build all VNF docker-images using the [*buildAll.sh*](https://github.com/anrl/gnf-dockerfiles/blob/master/buildAll.sh) script.
    - run `docker images` to view the image names

- This script will create the following aliases in your `.bashrc` file:
    - `glanf_start`, `glanf_stop`, `glanf_clean`, `glanf_reset`
    - each of these commands simply run this [**glanf**](https://github.com/anrl/gnf-dockerfiles/blob/master/testing/glanf) script.


#### Running the [glanf](https://github.com/anrl/gnf-dockerfiles/blob/master/testing/glanf) script

    - glanf_start <BASE_IMAGE> <INTERMEDIARY_VNF_1_IMAGE> <INTERMEDIARY_VNF_2_IMAGE> ....
    - glanf_stop (stops all the running containers)  
    - glanf_reset (stops any running containers, cleans the connections, cleans the OVS bridge)

Always use `glanf_reset` between subsequent calls to `glanf_start` to get a clean state.

#### glanf_start

Ex: `glanf_start glanf/base glanf/wire`

The above example has used the `glanf/base` as the base-image and has one *middlebox container* from the image `glanf/wire`

    



#### loadsim - VNF

This NF behaves as `glanf/wire` does, but with additional delay added and load
performed for each packet which passes through the device. This is meant to
simulate devices which have inherent baseline latency which they add and which
perform processing per packet.

The amount of "processing" performed per packet scales exponentially according
to a load factor, which can be tweaked by configuring the `LOAD_FACTOR`
environment variable (which can be a floating point value). The amount of
processing performed is equal to `LOAD_FACTOR * ( 2 ** LOAD_FACTOR)` which has
the nice property that it scales from 0 to a large number very quickly.

The delay is added to outgoing packets on both interfaces.

An example invocation is as follows:

```
docker run -itd --cap-add=NET_ADMIN --env="LOAD_FACTOR=8.0" --env="DELAY=2ms" glanf/loadsim
```