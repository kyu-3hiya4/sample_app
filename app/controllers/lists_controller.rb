class ListsController < ApplicationController
  def new
    # Viewへ渡すインスタンス変数に空のModelオブジェクト生成
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    # 詳細画面へリダイレクト
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
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end