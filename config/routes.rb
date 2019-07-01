Rails.application.routes.draw do
  root to: "admin/posts#index"

  namespace :api, defaults: {format: :json} do
    resources :posts
  end

  namespace :admin do
    resources :posts
  end
end
