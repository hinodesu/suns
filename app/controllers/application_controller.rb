class ApplicationController < ActionController::Base
  def login_check
    if session[:login_user].blank?
      redirect_to home_login_path, notice: "ログインされてないか、セッションが切れています。再度ログインしてください。", layout: nil
    end

  end

  def teacher_check
    if session[:login_user] && session[:login_user].first == "s" 
     redirect_to home_top_path, notice: "権限がないページにアクセスしようとしています。", layout: nil
    end
  end

  protect_from_forgery with: :exception
end
