Skeleton::Application.routes.draw do
  devise_for :users, skip: [:sessions, :password, :registrations],
      controllers: {
        omniauth_callbacks: "users/omniauth_callbacks"
      }

  root :to => "welcome#index"
end
