Rails.application.routes.draw do
  resources :promotions
  resources :products
  get '/checkout/:product_codes/:promotion_code', to: 'checkout#index'
end
