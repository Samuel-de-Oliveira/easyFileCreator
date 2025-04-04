import express from 'express';
import exphbs from 'express-handlebars';
import path from 'path';

const __dirname = path.resolve(path.dirname(''));
const app   = express();
const PORT  = 3000;
const hbs   = exphbs.create({
  defaultLayout: 'main',
  extname: '.hbs',
});

const Hello = 'Hello, world!';

app.engine('handlebars', hbs.engine);
app.set('view engine', 'hbs');

app.get('/', (req, res) => {
  res.render('index', {
    Message: Hello,
  });
});

app.listen(PORT, (err) => {
  if (err) {
    throw err;
  }

  console.log(`Your server is running at http://127.0.0.1:${PORT}.`);
});
