# Photo-a-day Aligner Makefile

# PADA IMAGE
PADA_VERSION=1.0.0

build-pada:
	docker build -t pada -f docker/Dockerfile.pada .

tag-pada:
	docker image tag pada:latest victormnunes/pada:${PADA_VERSION}

push-pada:
	docker push victormnunes/pada:${PADA_VERSION}

# ALIGN
build-align:
	docker build -t pada-align -f docker/Dockerfile.align .

run-align:
	docker run --name pada-align pada-align

copy-align:
	docker cp pada-align:data/aligned data
	docker cp pada-align:data/filtered.txt data

clear-align:
	docker rm pada-align

align:
	make build-align
	make run-align
	make copy-align
	make clear-align

# VIDEO
build-video:
	docker build -t pada-video -f docker/Dockerfile.video .

run-video:
	docker run --name pada-video pada-video

copy-video:
	docker cp pada-video:output.mp4 data

clear-video:
	docker rm pada-video

video:
	make build-video
	make run-video
	make copy-video
	make clear-video

# UTILS
clear:
	rm -rf data/aligned
	rm data/output.mp4
	rm data/filtered.txt