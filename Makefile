
default: docker_build

DOCKER_IMAGE ?= noxecane/aws-helm:tagname
GIT_BRANCH ?= `git rev-parse --abbrev-ref HEAD`

ifeq ($(GIT_BRANCH), master)
	DOCKER_TAG = latest
else
	DOCKER_TAG = $(GIT_BRANCH)
endif

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	  
push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

test:
	docker run $(DOCKER_IMAGE):$(DOCKER_TAG) version