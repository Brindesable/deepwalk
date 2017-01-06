FROM python:2.7

RUN mkdir -p /usr/deepwalk
WORKDIR /usr/deepwalk

COPY requirements.txt /usr/deepwalk/requirements.txt
RUN pip install numpy
RUN pip install cython
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/deepwalk
RUN python setup.py install 
