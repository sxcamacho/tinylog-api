Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'dummy#greet'

  resources :folders do
    resources :logs, :except => [:update]
  end
end
