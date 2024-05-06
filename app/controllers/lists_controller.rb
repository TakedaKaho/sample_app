class ListsController < ApplicationController
  def new
     # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new  
  end

 def create #投稿を保存するためのcreateアクション
   # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params) #viewに渡さないから＠Listじゃない。ローカル変数
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. トップ画面へリダイレクト　redirect_to」は画面を遷移するためのメソッド
    redirect_to '/top'
 end 


  def index #書籍の巻末の索引のように、多数のものの中から特定の対象をすばやく見つけ出すため識別情報や、整列された所在情報の一覧などを指す
      @lists = List.all #@がついてるからインスタンス変数（自由記載）　ここで指定しておくとview上でインスタンス変数に格納された情報を表示できる
  end

  def show
  end

  def edit
  end
  
  private # ストロングパラメータ
  #privateは一種の境界線で、「ここから下はこのcontrollerの中でしか呼び出せません」てゆう意味
  #privateより後に定義されたメソッドは、アクションとして認識されなくなり、URLと対応できなくなる
  def 
    list_params #formから送られてくるデータはparamsの中に入っています。
    params.require(:list).permit(:title, :body)
    # require. 送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。
    # permit.   requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
  end 
end
