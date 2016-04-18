Rails.application.routes.draw do
  scope '/json_api' do
    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations', confirmations: 'confirmations'}
  end
end
