DOCKER_REPO=gijzelaerr/logoplacer:dev

.PHONY: build clean notebook docker

all: run

build:
	docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

notebook:
	 .virtualenv/bin/jupyter-notebook --notebook-dir=notebooks

docker: build
	docker run -ti -p 8888:8888 -v `pwd`/notebooks:/notebooks:rw ${DOCKER_REPO} python2 /usr/local/bin/jupyter notebook --allow-root --port=8888 --notebook-dir=/notebooks --ip=*
