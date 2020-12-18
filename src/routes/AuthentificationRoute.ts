import { Router } from 'express';

const route: Router = Router();

route.get('/ooo', () => {
    console.log('test ok');
});

export {route as AuthentificationRoute}