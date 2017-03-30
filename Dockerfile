
FROM node:7.6.0-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY node /usr/src/app
RUN npm i

# Bundle app source
COPY . /usr/src/app

EXPOSE 5000
CMD [ "npm", "start" ]