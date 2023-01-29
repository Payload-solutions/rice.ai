FROM python:3.10.8
ENV PYTHONUNBUFFERED 1
ENV TF_CPP_MIN_LOG_LEVEL=3
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/

RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . /code/
