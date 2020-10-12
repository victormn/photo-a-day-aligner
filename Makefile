# Photo-a-day Aligner Makefile

build-align:
	docker build -t pada-align -f Dockerfile.align .

build-video:
	docker build -t pada-video -f Dockerfile.video .

run-align:
	docker run --name pada-align pada-align

run-video:
	docker run --name pada-video pada-video

copy-to-video:
	docker cp pada-align:data/aligned data
	docker cp pada-align:data/filtered.txt data

copy-video:
	docker cp pada-video:output.mp4 data

clear:
	docker rm pada-align
	docker rm pada-video