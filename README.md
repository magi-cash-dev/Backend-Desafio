# Random Joke API

Este projeto é uma API simples desenvolvida em Ruby on Rails que retorna piadas aleatórias do Chuck Norris. Ele é configurado para rodar em um ambiente Docker e inclui testes automatizados para garantir que o endpoint está funcionando corretamente.

## Configuração

### Pré-requisitos

- Docker
- Docker Compose

### Instalação

1. Clone o repositório:

   ```sh
   git clone https://github.com/seu-usuario/random_joke_api.git
   cd random_joke_api

2. Configure e construa os contêineres Docker:

   ```sh
   docker compose up --build

3. Crie o banco de dados:
   ```sh
   docker compose run web rails db:create

### Uso

Para obter uma piada aleatória, faça uma requisição GET para:

  ```sh
  http://localhost:3000/random-joke
  ```

### Exemplo de resposta

```sh
{
  "value": "Chuck Norris joke"
}
```

### Tratamento de Erros

Se a chamada à API externa falhar, a resposta será:

```sh
http://localhost:3000/random-joke
```

### Exemplo de resposta

```sh
{
  "error": "Failed to fetch joke: <error_message>"
}
```

### Testes

Para executar os testes, use o comando:

```sh
docker compose run web bundle exec rspec
```