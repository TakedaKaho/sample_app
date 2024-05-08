class ListsController < ApplicationController
  def new
     # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new  
  end

 def create #保存 #viewファイルに写す必要が出たから＠verになる　ただの保存ならList=でいい
    @list = List.new(list_params) 
    if @list.save #データをデータベースに保存するためのsaveメソッド実行
     flash[:notice] = "投稿に成功しました。"   # フラッシュメッセージを定義 12章
    redirect_to list_path(@list.id) #listやからshow(詳細に戻る)
     else 
       flash.now[:alert] = "投稿に失敗しました。"
       render:new #renderはアクション名　同じコントローラ内の別アクションのViewを表示できます
     end 
 end 
 


  def index #書籍の巻末の索引のように、多数のものの中から特定の対象をすばやく見つけ出すため識別情報や、整列された所在情報の一覧などを指す
      @lists = List.all #@がついてるからインスタンス変数（自由記載）　ここで指定しておくとview上でインスタンス変数に格納された情報を表示できる
  end

  def show
      @list = List.find(params[:id]) #今回はレコードを1件だけ取得するので、インスタンス変数名は単数形
  end                   #params[:id] は決まり？？
         #allは全て、に対しfindメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得。

  def edit #編集という意味
      @list = List.find(params[:id]) #投稿済みのデータを編集するからfind(s探す)を使う
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end
  
  def destroy #消去
      list = List.find(params[:id]) #list(データベース)から消す。findで対象探す
      list.destroy #探せたら消す
      redirect_to '/lists' #消せたら戻る。今回は一覧に戻るため'/lists'　getと
  end 
  
  private #プライベート
  #privateは一種の境界線で、「ここから下はこのcontrollerの中でしか呼び出せません」てゆう意味
  #privateより後に定義されたメソッドは、アクションとして認識されなくなり、URLと対応できなくなる
  def 
    list_params #paramsとは、フォームなどによって送られてきた情報（パラメーター）を取得するメソッド
    # ↓がストロングパラメータ。悪質なコードとかを入力されるのを防ぐ人工知能的な。
    params.require(:list).permit(:title, :body,:image) #入力をされる→悪質な悪戯を受ける可能性があるから入力勢（titleとか）この知能を入れとく。
    # require. 送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。
    # permit.   requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
  end 
  
end
