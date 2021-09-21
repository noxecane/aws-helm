DOCKER_IMAGE ?= noxecane/aws-helm

ifeq ($(REPOSITORY_BRANCH), master)
	DOCKER_TAG = latest
else
	DOCKER_TAG = $(REPOSITORY_BRANCH)
endif

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	  
push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

test:
	docker run $(DOCKER_IMAGE):$(DOCKER_TAG) version