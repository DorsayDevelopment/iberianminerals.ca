FROM ghost:latest

COPY config.example.js ./
WORKDIR content/themes/iberian
COPY . ./

RUN npm i -g bower

RUN apt-get update && apt-get install -y \
    git

RUN npm install
RUN bower install --allow-root

WORKDIR /usr/src/ghost

USER root

RUN chmod -R 777 /usr/src/ghost
CMD ["npm", "start", "--production"]