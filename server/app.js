const express = require('express');
const path = require('path');


const app = express();

app.listen(3000, () => {
  console.log("Server started. Listening to requests on port 3000");
})

app.use(express.static(path.resolve('../build/')));

app.get('/', function(req, res){
  res.sendFile(path.resolve(`../build/index.html`));
});
