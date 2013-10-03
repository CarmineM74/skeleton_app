Skeleton::Application.routes.draw do
  devise_for :users,
      controllers: {
        omniauth_callbacks: "users/omniauth_callbacks",
        sessions: "users/sessions"
      }

  scope '/api' do
    devise_scope :user do
      get 'sessions/current_user' => 'users/sessions#current_user'
    end
  end

  delete '/logout' => 'users/sessions#destroy'

  root 'welcome#index'
end
