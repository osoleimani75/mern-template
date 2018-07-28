FROM kaxi1993/ubuntu

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Run APP
EXPOSE 5000
CMD ["pm2-docker", "process.json", "--only", "production"]
