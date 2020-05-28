# Use the official image as a parent image.
FROM selenium/standalone-chrome:latest

# Set the working directory.
WORKDIR /usr/src/app

# Copy the file from your host to your current location.
COPY package*.json ./

USER root

RUN apt-get update
# install curl
RUN apt-get install curl
# get install script and pass it to execute:
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
# and install node
RUN apt-get install nodejs

# Run the command inside your image filesystem.
RUN npm install
RUN npm run webdriver-manager -- update --versions.chrome="81.0.4044.138"

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Run the specified command within the container. This will start both BE and FE
CMD ["npm", "test"]
