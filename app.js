const express = require('express')
const app = express()

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
 
app.get('/', function (req, res) {
  res.send('Hello World')
})

app.get('/me', function (req, res) {
    res.send(me)
  })

app.use(express.static('html'))

app.listen(3000)