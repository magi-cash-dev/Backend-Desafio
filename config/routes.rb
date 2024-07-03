Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'jokes/random', to: 'jokes#random'
    end
  end
end
