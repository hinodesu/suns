class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  before_action :set_annual_event

  before_action :login_check

  def index
    #日付の降順に並べる
    @notifications = Notification.all.order(:d_day => "desc")
    #今日の日付取得
    @today = Date.today
    #表示日付が今日、カテゴリーが時間割(１)を指定
    @today_timetable = @notifications.find_by(d_day: @today, category: 1)
    #表示日付が明日、カテゴリーがお知らせ(２)を指定
    @tomorrow_notice = @notifications.find_by(d_day: @today+1, category: 2)
    #ユーザー
    @user_code = session[:login_user]




  end


  # GET /notifications
  # GET /notifications.json


  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    logger.debug("================")
    logger.debug(@notification)

  

    #画像設定
    if params[:notification][:filename].present?
      @notification.filename = params[:notification][:filename].original_filename


      File.open("app/assets/images/#{@notification.filename}",'w+b'){ |f| f.write(params[:notification][:filename].read)
      }
    end

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'お知らせの作成が完了しました。' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update

     #画像設定
      if params[:notification][:filename].present?
        @notification.filename = params[:notification][:filename].original_filename
       #画像の保存
       File.open("app/assets/images/#{@notification.filename}",'w+b'){ |f| f.write(params[:notification][:filename].read)
       }
      end
    
      #パラメータの修正
      if params[:notification][:filename].present?
       params[:notification][:filename] = params[:notification][:filename].original_filename
      else
       params[:notification][:filename] = ""
      end

    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'お知らせの更新が完了しました。' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'お知らせの削除が完了しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:filename, :category, :d_day)
    end
end


