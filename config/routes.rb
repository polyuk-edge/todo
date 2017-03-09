Rails.application.routes.draw do
  resources :todos do
    collection do
      put :check_all
      delete :destroy_all
    end
  end
end
