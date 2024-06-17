import { fastify } from 'fastify';
import pino from 'pino';
import cors from '@fastify/cors';

const Port = 7000;
const server = fastify({
    logger: pino({ level: 'info' })
});
import JokeRoute from './routes/jokeRoute';

server.register(JokeRoute);

const start = async () => {
    try {
        await server.register(cors);
        await server.listen({
            port: Port,
        });
        console.log('Server started successfully on Port 7000');
    } catch (err) {
        server.log.error(err);
        process.exit(1);
    }
};

start();
