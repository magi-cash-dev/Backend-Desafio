<<<<<<< HEAD
<<<<<<< HEAD
# Teste Introdutório para Desenvolvedor Backend: API de Piadas do Chuck Norris

## Objetivo do Teste
Desenvolver uma API simples, utilizando Node.js com TypeScript ou Ruby on Rails, que faça uso de um endpoint para buscar piadas aleatórias usando a API do [Chuck Norris](https://api.chucknorris.io/).

## Descrição do Teste
Criar um endpoint do tipo `GET` chamado `/random-joke` que, ao ser acessado, faz uma chamada para `https://api.chucknorris.io/jokes/random`. Você pode formatar a resposta como considerar mais apropriado, priorizando a legibilidade e utilidade dos dados retornados.

## Requisitos Básicos
1. **Funcionalidade**: O endpoint deve ser facilmente acessível e retornar uma piada aleatória em formato JSON.
2. **Tratamento de Erros**: A API deve gerenciar erros de forma eficaz, retornando uma mensagem clara caso a chamada à API externa falhe.
3. **Cliente**: Imagine que a API vai ser consumida por um website que está sob o dns https://fake-website-never-exists.com.fake.

## Documentação
- Forneça instruções claras sobre como configurar e executar a API, incluindo quaisquer dependências necessárias.

## Entrega
- Submeta o código através de uma Pull Request neste repositório.

## Nota para o Candidato
- Este teste tem como objetivo avaliar suas habilidades básicas em desenvolvimento de APIs. A qualidade do código, organização, e a aderência às práticas recomendadas serão consideradas na avaliação. Novos testes podem ser solicitados.
=======
# README
=======
# Random Joke API
>>>>>>> 2f5f228 (add documentation)

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

<<<<<<< HEAD
* ...
>>>>>>> 53f8562 (create new jokes endpoint)
=======
   ```sh
   docker compose run web rails db:create

### Uso

Para obter uma piada aleatória, faça uma requisição GET para:

```sh
http://localhost:3000/random-joke

### Exemplo de resposta

```sh
{
  "value": "Chuck Norris joke"
}

### Tratamento de Erros

Se a chamada à API externa falhar, a resposta será:

```sh
http://localhost:3000/random-joke

### Exemplo de resposta

```sh
{
  "error": "Failed to fetch joke: <error_message>"
}

### Testes

Para executar os testes, use o comando:

   ```sh
   docker compose run web bundle exec rspec
>>>>>>> 2f5f228 (add documentation)
