class HomeController < ApplicationController

  def top
    @user_code = session[:login_user]
    #@user_code.first = session[:user_code.first]
    @annual_event = AnnualEvent.first
  end

  def login
    @user_code = ""
    session.clear if session.present?
  #ヘッダーを表示しない
    render layout: nil
  end

  def check
    @user_number = params[:number]
    password = params[:password]
    logger.debug("============")
    logger.debug(@user_code)
    logger.debug(password)
    if user = User.find_by(number: @user_number, pass: password)
      session[:login_user] = @user_number
      # メニューバーに表示するログインユーザー名をsessionにセットする
      session[:login_user_name] = user.try(:name)
      redirect_to home_top_path
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
end
