Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index' => 'translate#index'
  post 'get_translate' => 'translate#translator'

  root to: 'translate#index'
end