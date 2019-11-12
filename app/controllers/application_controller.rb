class ApplicationController < ActionController::Base
  def login_check
        if session[:user_id].blank?
          redirect_to home_login_path, notice: "ログインされてないか、セッションが切れています。再度ログインしてください。", layout: nil
        end
   end
  protect_from_forgery with: :exception
end
