Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    devise_for  :users,
                skip: [
                  :passwords,
                  # :registrations,
                  :sessions,
                  :confirmations],
                path: '',
                path_names: {
                  registration: 'signup'
                },
                controllers: {
                  registrations: 'registrations'
                }
  end
end
