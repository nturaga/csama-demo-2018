docker images

docker pull bioconductor/release_base2:latest

docker run -p 8787:8787 -e PASSWORD=bioc bioconductor/release_base2:latest

docker ps

## take down container ID

docker kill <container ID>

## Interactive bash
docker run -it bioconductor/release_base2:latest bash

## kill this (CTRL D)

## interactive R
docker run -it bioconductor/release_base2:latest R

## interactive LOGIN to running container
docker exec -it <container ID> bash

sudo su - rstudio

touch blah

## kill container,

# EXTEND container, with Dockerfile

## Inherit from the bioconductor/release_base2 image
FROM bioconductor/release_base2:latest
## Add packages
RUN  R -e "BiocManager::install('BiocParallel')"

docker build -t my_image:1 .
