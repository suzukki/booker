class BookersController < ApplicationController
	protect_from_forgery except: :search # searchアクションを除外
  def show
  	@booker = Book.find(params[:id])
  end

  def index
  end

  def books
  	@bookers = Book.all
  	@booker = Book.new
  end
  def create
    	#「投稿する」ボタンを押すと、postsコントローラのcreateアクションにフォームに入力された値が送られます。
    	# DBにデータを保存するにはPostインスタンスを生成し、title, bodyに値をセットした後、「saveメソッド」を呼び出します。
    	# @のついたインスタンス変数とローカル変数の違いは@のついているインスタンス変数はビューファイルへ受け渡すことができます。
    	# ローカル変数は、ビューファイルに受け渡しができません。アクション内でしか利用できません
    	# 受け取ったデータをモデルを介してDBへ保存する
        booker = Book.new(booker_params)
        booker.save# DBへ保存する
        redirect_to booker_path(booker.id)# 詳細画面へリダイレクト
    end
  def new

  end

  def edit
  	@booker = Book.find(params[:id])
  end

  def update
        booker = Book.find(params[:id])
        booker.update(booker_params)
        redirect_to booker_path(booker.id)
  end

  def destroy
        booker = Book.find(params[:id])
        booker.destroy
        redirect_to bookers_path
  end

  private
    def booker_params
    	#params.require(:モデル名).permit(:カラム名1, :カラム)
        params.require(:book).permit(:title, :body)
    end
end
