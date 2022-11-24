FROM python:3.10.8
RUN pip install --upgrade pip
ENV PYTHONUNBUFFERED 1
COPY . /code/
COPY requirements.txt /code/requirements.txt
WORKDIR /code/
RUN pip install -r requirements.txt
EXPOSE 8000