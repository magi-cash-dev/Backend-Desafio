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

---

# Random Joke API

Welcome to the Random Joke API! This project provides an endpoint that returns a random joke from the Chuck Norris API. It's built using Ruby on Rails and follows the principles of Test-Driven Development (TDD) with RSpec.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Make sure you have the following software installed:

- Ruby
- Rails
- Bundler

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/jpmsantana/Backend-Desafio
    cd Backend-Desafio
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    ```

### Running the Application

1. **Start the Rails server:**

    ```bash
    rails server
    ```

2. **Access the application:**

    Open your browser and navigate to `http://localhost:3000/random-joke` to get a random joke in JSON format.

### Running the Tests

We use RSpec for testing. To run the test suite, use the following command:

```bash
bundle exec rspec
```
