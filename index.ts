import express from 'express';
import {AuthentificationRoute} from './src/routes/AuthentificationRoute';

const app = express();

app.use('/', AuthentificationRoute);


app.listen(3000, () => {
    console.log(`Server run to http://localhost:3000`);
});
