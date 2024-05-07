# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name = 'Desafio Backend'
  config.api_base_url = ''
  config.doc_base_url = '/documentacao'
  config.app_info = 'Teste Introdutório para Desenvolvedor Backend: API de Piadas do Chuck Norris'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
