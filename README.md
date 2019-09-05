# DevOps Technical Test
## Jaymie Clampitt
---

Steps taken to create the node express webserver

Step 1: The first step was to create the node project. This was done using the below command.
```bash 
nmp init
```
This initated the project and the project details were filled out creating the package.json

Step 2: The next step was to install npm express. his was done using the below command.
```bash 
npm i -s express
```
This installs npm express and saves the dependancies in the package.json we created previously

Step 3: I then went on to create the app using the following command in the terminal. 
```bash
touch app.js
```
Once this was created i opened it in Visual Studio Code to make the required changes to the file. 

Using the basic "Hello World" app that is provided on the front page of the express package page for npm.

https://www.npmjs.com/package/express

```js
const express = require('express')
const app = express()
 
app.get('/', function (req, res) {
  res.send('Hello World')
})
 
app.listen(3000)
```
Step 4: Creating the JSON object within the app.

Here I used the constant to create a JSON object called "me" and included the details about myself.

```js
const me = {
    "firstname": "Jaymie",
    "lastname": "Clampitt",
    "age": "29",
    "hobbies": ["Games","Movies","Motorcycles"],
    "relatives": {
        "mother": "Tracy",
        "father": "Mark",
        "yongerbrother": "Steven",
        "youngestbrother": "Ben",
        "girlfriend": "Rachel"
    }   
}
```
Once I had created the JSON objec i needed a webpage to print the information. Here i reused the "Hello World" js to create a new page for my JSON object "me".

```js
app.get('/me', function (req, res) {
  res.send(me)
})
```

Step 5: Next I created the docker file for that would build and contain the webserver.

```docker
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

CMD["node", "app.js"]
#This will run the app we created app.js on the container
```

Step 7: Here I creted the start.sh shell script. This was done by touching start.sh 

```bash
touch start.sh
```
In visual studio code I then added the script to build and run the docker container. 

```sh
#!/bin/sh

docker build -t devopstest .
#This builds the image from the dockerfile tagging the image as devopstest located in the current directory

docker run -p 8080:3000 -d devopstest
#This runs a command in the new container publishing the containers port to the host machine 

sleep 3
#I added the sleep function as the container needed a few seconds to boot up before returning the curl request

curl http://localhost:8080/me
#This prints the JSON object from the 8080/me webpage
```

Step 8: The final step in creating this project was to make the start.sh file executable. This was done by using chmod demonstrated below

```bash
chmod +x ./start.sh
```
Step 9: Run the start.sh script in the terminal
```bash
./start.sh
```

