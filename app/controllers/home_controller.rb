class HomeController < ApplicationController

  def top
    @user_code
  end
<<<<<<< HEAD

  def login
    @user_code = ""
    session.clear if session.present?
  #ヘッダーを表示しない
    render layout: nil
  end

  def check
    @user_code = params[:user_code]
    password = params[:password]
    if user = User.find_by(code: @user_code, password: password)
      session[:login_user] = @user_code
      # メニューバーに表示するログインユーザー名をsessionにセットする
      session[:login_user_name] = user.try(:name)
      redirect_to root_path
    else
      flash.now.alert = "ユーザーIDまたはパスワードが正しくありません。"
      render :login, layout: nil
    end
  end

  def logout
    # sessionを削除
    reset_session
    redirect_to login_url
  end

=======
  def login
  end
>>>>>>> c3728357145372315cf389cc9fed06a668ad5c0b
end
