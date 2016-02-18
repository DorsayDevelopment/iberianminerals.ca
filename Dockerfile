FROM ghost:latest

COPY config.js ./
WORKDIR content/themes/iberian
COPY . ./

RUN npm i -g bower

RUN apt-get update -y
RUN apt-get install -y git

RUN npm install
RUN bower install --allow-root

WORKDIR /usr/src/ghost

USER root

RUN chmod -R 777 /usr/src/ghost

CMD ["npm", "start", "--production"]