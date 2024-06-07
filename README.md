# Start API to Chuck Norris Joke

This file will inform about how run this API locally.

## Requisites

You need: Docker, Docker-compose, installed in your machine.

## File `.env`
The file needs to be created but may be empty.

## Start Conteiner
```
docker-compose up
```

Now your API is just running in:

```
localhost:3000
```

## For Run Tests

```
docker-compose exec app rspec
```