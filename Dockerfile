FROM ghost:latest

WORKDIR /usr/src/ghost/content/themes/iberian
ADD . /usr/src/ghost/content/themes/iberian

RUN npm i -g bower

RUN npm install
RUN bower install --allow-root

WORKDIR /usr/src/ghost

CMD ["npm", "start"]