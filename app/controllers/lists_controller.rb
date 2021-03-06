class ListsController < ApplicationController


  def new
    @list = List.new
  end


  def create
    #1.& 2.データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    #4. showへのリダイレクト
    redirect_to list_path(list.id)
  end


  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  private
  #ストロングパラメーター
  def list_params
    params.require(:list) .permit(:title, :body)
  end

end