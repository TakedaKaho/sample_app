#ネットワーク上でデータを転送する際、その経路を導き出すことをルーティング

Rails.application.routes.draw do
  #get.    URL  =>. コントローラ名#アクション名
  
  get 'top' => 'homes#top'
  resources :lists #lists コントローラの同じ名前のアクションに紐づく(どれ)
  
end

