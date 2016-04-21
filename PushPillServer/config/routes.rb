Rails.application.routes.draw do
  devise_for :doctor, controllers: { sessions: 'doctor/sessions', registrations: 'doctor/registrations' }
  devise_for :users, controllers: { sessions: 'user/sessions', registrations: 'user/registrations' }
  # devise_for :managers, class_name: "Admin::Manager", controllers: { sessions: 'admin/managers/sessions' }, skip: %i(registrations passwords)

  scope 'admin' do
    devise_for :managers, class_name: "Admin::Manager", controllers: { sessions: 'admin/manager/sessions' }#, skip: %i(registrations passwords)
  end

  namespace :admin do
    root 'home#index'

    resources :users, only: %i(index show) do
      member do
        post 'push'
      end
    end
  end

  namespace :api, defaults: {format: :json} do
    resource :doctor, controller: 'doctor' do
      resources :patients, only: %i(show index create destroy) do
        collection do
          get 'alert'
        end
        member do
          post 'push'
        end
      end
    end

    resource :user, controller: 'user' do
      collection do
        get 'patients'
      end
    end
    resources :pills do
      collection do
        get 'complete'
      end

      member do
        get 'check'
      end
    end
  end
end
