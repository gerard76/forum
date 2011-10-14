Forum::Application.routes.draw do
  devise_for :users
  
  # get '', as: :sign_in
  
  mount Forem::Engine, :at => "/"
  
  # root :to => "forem/forums#index"
end
