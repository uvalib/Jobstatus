Rails.application.routes.draw do
  resources :jobs do
    #jobs/group
    collection do
      get :group
    end
  end

  root 'jobs#index'

  # health check and version endpoints
  resources :healthcheck, only: [ :index ]
  resources :version, only: [ :index ]

end
