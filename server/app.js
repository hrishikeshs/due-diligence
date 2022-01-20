const express = require('express');

const app = express();

app.listen(3000, () => {
  console.log("Server started. Listening to requests on port 3000");
})


app.get('/', (req, res) => {
  res.end('Hello, world');
})
