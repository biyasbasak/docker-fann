FROM ubuntu:latest

# install nodejs, build essentials and git
RUN apt-get update -y
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y git-all

# install fann
ENV LD_LIBRARY_PATH=/usr/local/lib
RUN export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
RUN git clone https://github.com/libfann/fann.git && cd ./fann && cmake . && make install

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm install 
# Bundle app source
COPY . /usr/src/app
#RUN chmod +x script.sh
#RUN ./script.sh
CMD [ "npm", "start" ]





