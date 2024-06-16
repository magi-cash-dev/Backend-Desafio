import {
    FastifyInstance,
    FastifyPluginOptions,
    FastifyPluginAsync
} from 'fastify';
import fp from 'fastify-plugin';
import axios from 'axios';

const JokeRoute: FastifyPluginAsync = async (server: FastifyInstance, options: FastifyPluginOptions) => {

    server.get('/random-joke', {}, async (request, reply) => {
        try {
            const response = await axios.get('https://api.chucknorris.io/jokes/random');
            const joke = {
                id: response.data.id,
                joke: response.data.value,
            };

            return reply.code(200).send(joke);
        } catch (error) {
            request.log.error(error);
            return reply.code(500).send(error);
        }
    });
};
export default fp(JokeRoute);