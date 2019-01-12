Rails.application.routes.draw do
  resources :promotions
  resources :products
  get '/products/:product_ids/:promotion_id/scan', to: 'products#scan'
end
