# Data Science Portfolio

A small portfolio to show and practice data science. This project is also aimed to help data scientist to get introduced to Docker on the specific field of data science.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine. 

### Prerequisites

Make sure you have installed [Docker](https://www.docker.com/get-started) in your computer. Try to get your docker version on the command line

```sh 
docker --version
```
It's been tested on  ```Docker version 18.09.0``` but upper versions may work as well.


### Running

In the main folder run

```sh
make build-run
```

This will create the image and run the container. By default image name is *datascience* and container name *notebook*. 

## Accessing the notebooks

After making the *build-run* you should have a docker container named *notebook* running. To access the notebooks just open in your browser

```
http://localhost:8888/
```

And play!.

## Stopping container and deleting image

If you just want to stop the running container type

```
make stop
```

To restart the container run

```
make start
```

but if you want to get rid of everything in this project (images and containers), i.e. remove them, then type

```
make remove
```