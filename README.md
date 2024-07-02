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

### Requisitos:
- Ruby 3.2 (Recomendo [asdf](https://github.com/asdf-vm/asdf-ruby))
- Rails 7
- Bundler

### Instruções:

Rodando localmente:
```bash
$ bundle
$ bundle exec rails s
$ curl localhost:3000/random-joke
```
Specs e Lint:
```bash
$ bundle exec rspec
$ bundle exec rubocop
```

## Entrega
- Submeta o código através de uma Pull Request neste repositório.

## Nota para o Candidato
- Este teste tem como objetivo avaliar suas habilidades básicas em desenvolvimento de APIs. A qualidade do código, organização, e a aderência às práticas recomendadas serão consideradas na avaliação. Novos testes podem ser solicitados.
