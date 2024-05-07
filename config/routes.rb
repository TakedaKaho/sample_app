#ネットワーク上でデータを転送する際、その経路を導き出すことをルーティング

Rails.application.routes.draw do
  #get.    URL  =>. コントローラ名#アクション名
  
  get 'lists/new'  #GETはデータの取得をするためのHTTPメソッド
  post 'lists' => 'lists#create' #POSTはデータを新規保存するためのHTTPメソッド
  get 'lists' =>'lists#index' #index 一覧
  get 'lists/:id' => 'lists#show',as: 'list' #詳細画面では、投稿データのidもURLに含む。URLの/lists/:id
                          # asは、英語で「～として」の意味 'lists#show'の設定を、listとして利用できるよーってこと
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
                                        #名前付きルート（as: 'edit_list'）の記述
  patch 'list/:id' => 'lists#update',as:'update_list' #patchは更新
  get 'top' => 'homes#top'
#  get '/top', to:  'homes#top'.  #homes/topで打ってなかったからダメだった。URL通り打つこと
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

