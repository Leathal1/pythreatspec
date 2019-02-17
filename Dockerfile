FROM awilson/python27

WORKDIR /usr/src/app
COPY . .

RUN apt-get update
RUN apt-get -y install nodejs
RUN python --version
RUN nodejs -v
