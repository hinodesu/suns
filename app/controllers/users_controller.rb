class UsersController < ApplicationController
  before_action :teacher_check
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_annual_event

  # GET /users
  # GET /users.json
  def index
   # @users = User.all.order(:grade).order(:class_room).order(:kana => "desc")

   if session[:search_grade].present?
      @users = User.where("grade like '%" + session[:search_grade] + "%'").order(:grade).order(:class_room).order(:kana => "asc")
    else
      @users = User.all.order(:grade).order(:class_room).order(:kana => "asc")
    end

    if session[:search_class_room].present?
      @users = User.where("class_room like '%" + session[:search_class_room] + "%'").order(:grade).order(:class_room).order(:kana => "asc")
    else
      @users = User.all.order(:grade).order(:class_room).order(:kana => "asc")
    end


    if session[:search_name].present?
      @users = User.where("name like '%" + session[:search_name] + "%'").order(:grade).order(:class_room).order(:kana => "asc")
    else
      @users = User.all.order(:grade).order(:class_room).order(:kana => "asc")
    end
  

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    if params[:user][:number][0] == "s"
      params[:user][:grade] = params[:user][:number][-4]
      params[:user][:class_room] = params[:user][:number][-3]
    else
      params[:user][:grade] = "0"
      params[:user][:class_room] = "0"
    end

    @user = User.new(user_params)

    if params[:user][:password] != params[:user][:password_confirmation]
      @user.errors[:base] << 'パスワードとパスワード確認が異なります'
      render :new
    else
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'ユーザーの登録が完了しました。' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    if params[:user][:password] != params[:user][:password_confirmation]
      @user.errors[:base] << 'パスワードとパスワード確認が異なります'
      render :edit
    else
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'ユーザーの更新が完了しました。' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'ユーザーの削除が完了しました。' }
      format.json { head :no_content }
    end
  end

  def search

    @users = User.all.order(:grade).order(:class_room).order(:kana => "asc")
    session[:search_grade] = nil
    session[:search_class_room] = nil
    session[:search_name] = nil



    if params[:search][:grade].present?
      @users = @users.where("grade like '%" + params[:search][:grade] + "%'").order(:grade).order(:class_room).order(:kana => "asc")
      session[:search_grade] = params[:search][:grade]
    end

    if params[:search][:class_room].present?
      @users = @users.where("class_room like '%" + params[:search][:class_room] + "%'").order(:grade).order(:class_room).order(:kana => "asc")
      session[:search_class_room] = params[:search][:class_room]
    end

    if params[:search][:name].present?
      @users = @users.where("name like '%" + params[:search][:name] + "%'").order(:grade).order(:class_room).order(:kana => "asc")
      session[:search_name] = params[:search][:name]
    end


  
   render :index

  end


  def select_edit
    if params[:select_datas].present?
      @select_users = params[:select_datas].keys.map(&:to_i)
      @users = User.where(id:@select_users).order(:grade).order(:class_room).order(:kana => "asc")
      @users_default_class = @users.first.grade + 1
      #if params[:select_edit][:commit] == "選択編集"
      #end
      #if params[:select_edit][:commit] == "選択削除"
      #end
    else
      redirect_to users_path, notice: "編集または削除するデータを一件以上チェックしてください。"
    end  
  end

  def select_edit_all
      session[:select_users] = params[:select_datas].keys.map(&:to_i)
      @select_users = session[:select_users]
      @users = User.where(id:@select_users)
      session[:user_grade] = params[:user][:grade]
      session[:user_class] = params[:user][:class_room]
      user_count = 0
      #「select_users」の数字とUserモデルのidが一致するデータを取
      users = User.where(id: @select_users)


    if params[:commit] == "選択編集"
      @users_kizon = User.where(grade: params[:user][:grade], class_room: params[:user][:class_room])
      if @users_kizon.present?
        redirect_to users_select_edit_kakunin_path
      else
        redirect_to users_select_edit_kettei_path
      end
    end
        
    if params[:commit] == "選択削除"

      #ユーザ一括削除
      if users.destroy_all
        
        #user_countにcselect_usersの値の数を代入
        user_count = @select_users.size
      end
      redirect_to users_path, notice: "#{user_count}件のユーザーを削除しました。"
    end
  end

  #確認画面
def select_edit_kakunin
  @select_users = session[:select_users]
  @users = User.where(id:@select_users)
  @user_grade = session[:user_grade]
  @user_class = session[:user_class]
end

#確定処理
def select_edit_kettei
  if params[:select_datas].present?
    @select_users = params[:select_datas].keys.map(&:to_i)
  else
    @select_users = session[:select_users]
  end
  users = User.where(id: @select_users)
  if users.update_all(grade: session[:user_grade], class_room: session[:user_class])
  end
  respond_to do |format|
    format.html { redirect_to users_path, notice: 'ユーザーを一括で編集しました。' }
  end
end

  def bulk_new
  end

  def bulk_create
     #if users_file = nil
    # １年生の各クラスの既存生徒を取得
    class1_1 = User.where(grade: 1, class_room: 1).count
    class1_2 = User.where(grade: 1, class_room: 2).count
    class1_3 = User.where(grade: 1, class_room: 3).count
    class1_4 = User.where(grade: 1, class_room: 4).count
    if params[:users_file].blank?
      redirect_to users_bulk_new_path,flash:{error:'ファイルを選択してください。'}
    else
      if class1_1 >= 10 || class1_2 >= 10  || class1_3 >= 10  || class1_4 >= 10
        render :bulk_new,flash:{error:'1年生のクラスに学生が10人以上存在しています。１年生のクラス替えを先におこなってください'}
      else  
        user_count = import_users
        redirect_to users_path, notice:"#{user_count}件登録しました。"
      end
    end
  end

  def download
    download_file_name = "public/master/test.csv"
    send_file download_file_name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:number, :grade, :class_room, :name, :kana, :gender, :password)
    end

    def import_users
      # 登録処理前のレコード数
      current_user_count = ::User.count
      users = []
      u_id = User.maximum(:id) + 1
      # windowsで作られたファイルに対応するので、encoding: "SJIS"を付けている
      CSV.foreach(params[:users_file].tempfile.path, headers: true, encoding: "SJIS") do |row|
        users << User.new( number: row["学籍番号"], grade: row["学籍番号"][-4], class_room: row["学籍番号"][-3], name: row["名前"] , kana: row["フリガナ"], gender: row["性別"] , password: row["パスワード"])
      end
      # importメソッドでバルクインサートできる
      ::User.import(users)
      # 何レコード登録できたかを返す
      ::User.count - current_user_count
    end


end
