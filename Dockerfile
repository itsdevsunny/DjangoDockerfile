FROM ubuntu

RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-venv -y
RUN apt-get install python3-pip -y
RUN python3 -m venv envDocker
RUN /bin/bash -c "source ./envDocker/bin/activate"

COPY . /opt/source-code

WORKDIR /opt/source-code

RUN pip3 install -U pip

RUN pip3 install -r requirements.txt

CMD ["python3", "./manage.py", "runserver", "0.0.0.0:8000"]

EXPOSE 8000/tcp