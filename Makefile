DOCKER_IMAGE ?= noxecane/aws-helm

ifeq ($(REPOSITORY_NAME), master)
	DOCKER_TAG = latest
else
	DOCKER_TAG = $(REPOSITORY_NAME)
endif

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	  
push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

test:
	docker run $(DOCKER_IMAGE):$(DOCKER_TAG) version