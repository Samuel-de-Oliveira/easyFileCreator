import express from 'express';
import path from 'path';

const __dirname = path.resolve(path.dirname(''));
const app = express();
const PORT = 3000;
const Hello = `Hello, world!`;

app.get(`/`, (req, res) => {
  res.send(Hello);
});

app.listen(PORT, (err) => {
  if (err) {
    throw err;
  }

  console.log(
    `Your server is running at http://127.0.0.1:${PORT}.`
  );
});
