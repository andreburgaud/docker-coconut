TAG:=1.4.3
IMAGE:=andreburgaud/coconut

default: help

build:
	docker build -t ${IMAGE}:${TAG} .

clean:
	# Remove containers with exited status:
	docker rm `docker ps -a -f status=exited -q` || true
	docker rmi ${IMAGE}:latest || true
	docker rmi ${IMAGE}:${TAG} || true
	# Delete dangling images
	docker rmi `docker images -f dangling=true -q` || true

help:
	@echo 'Coconut ${TAG} Docker image build file'
	@echo
	@echo 'Usage:'
	@echo '    make build     Build the Coconut image using local Dockerfile'
	@echo '    make clean     Delete dangling and Coconut images'
	@echo '    make tag       Push code and tag to GitHub'
	@echo

tag:
	git push
	git tag -a ${TAG} -m 'Version ${TAG}'
	git push origin --tags

.PHONY: build clean help tag
