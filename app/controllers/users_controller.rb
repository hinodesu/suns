class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search

    @users = User.all


    if params[:search][:grade].present?
      @users = @users.where("grade like '%" + params[:search][:grade] + "%'").order(:kana => "desc")
    end

    if params[:search][:class_room].present?
      @users = @users.where("class_room like '%" + params[:search][:class_room] + "%'").order(:kana => "desc")
    end

    if params[:search][:name].present?
      @users = @users.where("name like '%" + params[:search][:name] + "%'").order(:kana => "desc")
    end


  
   render :index

  end


  def select_edit

    @select_users = params[:select_datas].keys.map(&:to_i)
    @users = User.where(id:@select_users)

    #if params[:select_edit][:commit] == "選択編集"
    
    #end
    
    #if params[:select_edit][:commit] == "選択削除"
    
    #end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:number, :grade, :class_room, :name, :kana, :gender, :pass)
    end
end
