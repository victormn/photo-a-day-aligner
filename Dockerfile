FROM python:3

# FOR pada.py align
RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get install cmake -y
RUN apt-get install pkg-config -y

RUN apt-get install libx11-dev -y
RUN apt-get install libatlas-base-dev -y

RUN apt-get install libgtk-3-dev -y
RUN apt-get install libboost-python-dev -y

RUN apt-get install libgl1-mesa-glx -y
RUN apt-get install libsm6 -y
RUN apt-get install libxext6 -y

RUN pip install numpy
RUN pip install scipy
RUN pip install matplotlib
RUN pip install scikit-image
RUN pip install scikit-learn
RUN pip install ipython
RUN pip install dlib
RUN pip install opencv-python
RUN pip install appdirs
RUN pip install ffmpeg
RUN pip install image

# FOR make_vid.sh
RUN apt-get install mencoder -y

ADD pada.py /
ADD pada.conf /
ADD scripts/make_vid.sh /
ADD pada /pada
ADD data /data

CMD [ "sh", "-c", "python ./pada.py align && python ./pada.py framedrop && ./make_vid.sh" ]