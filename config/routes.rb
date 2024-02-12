Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index]
    end
  end
end
