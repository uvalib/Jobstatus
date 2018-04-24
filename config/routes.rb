Rails.application.routes.draw do
  resources :jobs do
    #jobs/group
    collection do
      get :group
    end
  end

  root 'jobs#index'

end
