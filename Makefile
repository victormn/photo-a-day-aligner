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

# VIDEO
build-video:
	docker build -t pada-video -f docker/Dockerfile.video .

run-video:
	docker run --name pada-video pada-video

# COPY
copy-to-video:
	docker cp pada-align:data/aligned data
	docker cp pada-align:data/filtered.txt data

copy-video:
	docker cp pada-video:output.mp4 data

# CLEAR
clear:
	docker rm pada-align
	docker rm pada-video