Rails.application.routes.draw do
  get 'lists/new'  #GETはデータの取得をするためのHTTPメソッド
  post 'lists' => 'lists#create' #POSTはデータを新規保存するためのHTTPメソッド
  get 'lists' =>'lists#index'
  get 'lists/show'
  get 'lists/edit'
  get 'top' => 'homes#top'
#  get '/top', to:  'homes#top'.  #homes/topで打ってなかったからダメだった。URL通り打つこと
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

