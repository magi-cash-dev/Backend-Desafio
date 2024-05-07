# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'apipie/apipies#index'
  apipie

  get '/random-joke', to: 'jokes#random'
end
