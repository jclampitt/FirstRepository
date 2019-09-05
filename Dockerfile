FROM node
#Gets the docker image from dockerhub and installs the required linux/node files

WORKDIR /usr/src/app
#Sets the working directory on the container to /usr/src/app

COPY package*.json ./
#Copies package.json from local machine to container into the working dir

RUN npm install
#Installs all the required packages thar are defined in the package.json file.

COPY . .
#Copies the rest of the files into the workdir

EXPOSE 3000
#Exposes the port 3000 to the localmachine

CMD ["node", "app.js"]
#This will run the app we created app.js on the container
