Skeleton::Application.routes.draw do
  devise_for :users,
      controllers: {
        omniauth_callbacks: "users/omniauth_callbacks",
        sessions: "users/sessions"
      }

  scope '/api' do
    devise_scope :user do
      get '/current_user' => 'users#current_user_info'
      delete 'sessions' => 'users/sessions#destroy'
    end
  end

  root 'welcome#index'
end
