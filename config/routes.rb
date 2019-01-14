Rails.application.routes.draw do
  resources :promotions
  resources :products
  get '/checkout/:product_ids/:promotion_id', to: 'checkout#index'
end
