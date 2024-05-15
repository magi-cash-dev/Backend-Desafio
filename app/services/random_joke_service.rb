# app/services/random_joke_service.rb

class RandomJokeService
    include HTTParty
    base_uri 'https://api.chucknorris.io/jokes'
  
    def self.call
      response = get('/random')
      if response.success?
        response['value']
      else
        raise StandardError, 'Não foi possível pegar uma frase de Chuck Norris.'
      end
    end
  end