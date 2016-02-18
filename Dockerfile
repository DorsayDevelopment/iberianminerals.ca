FROM ghost:latest

WORKDIR /usr/src/ghost/content/themes/iberian
ADD ./config.js /usr/src/ghost
ADD . /usr/src/ghost/content/themes/iberian

RUN npm i -g bower

RUN apt-get update -y
RUN apt-get install -y git

RUN npm install
RUN bower install --allow-root

WORKDIR /usr/src/ghost

USER root

RUN chmod -R 777 /usr/src/ghost

CMD ["npm", "start", "--production"]