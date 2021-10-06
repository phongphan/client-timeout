const express = require('express')
const app = express()
const port = 3000

app.get('/delay/:seconds', async (req, res) => {
  const seconds = parseInt(req.params.seconds, 10);
  console.log(`Delay ${seconds} seconds`);
  await new Promise(resolve => setTimeout(resolve, seconds * 1000));
  console.log('Delay finished');
  res.send(`Delay ${req.params.seconds} seconds`);
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
