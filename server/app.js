const express = require('express');

const app = express();

app.listen(4000, () => {
  console.log("Server started. Listening to requests on port 4000");
})


app.get('/', (req, res) => {
  res.end('Hello, world');
})
