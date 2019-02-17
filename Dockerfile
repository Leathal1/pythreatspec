FROM awilson/python27

WORKDIR /usr/src/app
COPY . .

#Update apt-get and add nodejs
RUN apt-get update
RUN apt-get -y install nodejs

#Verify python
RUN python --version
#Verify nodejs
RUN nodejs -v
