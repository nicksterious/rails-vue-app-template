Rails.application.routes.draw do
  namespace :api do
    [:movies, :genres, :actors].each do |route|
	get "#{route}(.:format)", controller: route, action: :index
	get "#{route}/:id(.:format)", controller: route, action: :show 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
