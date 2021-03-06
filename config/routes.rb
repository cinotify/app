Rails.application.routes.draw do
  devise_for :users
  root to: 'application#index'
  resource :account do
    post 'subscribe', to: 'accounts#subscribe'
  end
  get :docs, to: 'application#docs'
  namespace :legal do
    get 'terms', to: 'legal#terms'
    get 'privacy', to: 'legal#privacy'
  end
  namespace :api do
    post 'notify', to: 'api#notify'
  end
end
