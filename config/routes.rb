Rails.application.routes.draw do
  get 'lists/new'
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  get 'homes/top'
#  get '/top', to:  'homes#top'.  #homes/topで打ってなかったからダメだった。URL通り打つこと
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

