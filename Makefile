# Photo-a-day Aligner Makefile

all:
	docker build -t pada .

run:
	docker run --name pada pada

copy:
	docker cp pada:data/aligned data
	docker cp pada:data/filtered.txt data

clear:
	docker rm pada