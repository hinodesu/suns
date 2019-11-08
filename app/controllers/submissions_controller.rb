class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @members = User.where(grade: @submission.grade ,class_room: @submission.class_room)
    logger.debug("================")
    logger.debug(@members)
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create

    #選んだクラスの取得
    select_classrooms = params[:target].keys.map(&:to_i)
    @submissions = []

    select_classrooms.each do | gc |
      #パラメータの上書き
      params[:submission][:grade] = gc/10
      params[:submission][:class_room] = gc%10

      @submission = Submission.new(submission_params)
      if params[:submission][:filename].present?
        @submission.filename = params[:submission][:filename].original_filename
        File.open("/#{@submission.filename}", 'w+b') { |f| f.write(params[:submission][:filename].read)
        }
      end

      @submissions << @submission
    end

    respond_to do |format|
      if ::Submission.import(@submissions)
      # if @submissions.save
        format.html { redirect_to submissions_path, notice: 'Submission was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @today = Date.today.to_s
    @submissions = Submission.all.order(:deadline => "desc")
    if params[:search][:subject].present?
      @submissions = @submissions.where("subject like '%" + params[:search][:subject] + "%'").order(:deadline => "desc")
    end

    if params[:search][:deadline] == "期限前"
      @submissions = @submissions.where("deadline >= '" + @today + "'").order(:deadline => "desc")
    end
    if params[:search][:deadline] == "期限切れ"
      @submissions = @submissions.where("deadline < '" + @today + "'").order(:deadline => "desc")
    end
    if params[:search][:title].present?
      @submissions = @submissions.where("title like '%" + params[:search][:title] + "%'").order(:deadline => "desc")
    end
    render :index
  end

  def select_edit
    @select_submissions = params[:select_datas].keys.map(&:to_i)
    @submissions = Submission.where(id: @select_submissions)
    #if paraams[:select_edit][:commit] == "選択編集"
    #if paraams[:select_edit][:commit] == "選択削除"
    
  end

  def select_edit_all
      @select_submissions = params[:select_datas].keys.map(&:to_i)
      @submissions = Submission.where(id:@select_submissions)
      submission_count = 0
          
    if params[:commit] == "選択編集"
      respond_to do |format|
        format.html { redirect_to submissions_path, notice: '提出物を一括で編集しました。' }
      end
    end

    if params[:commit] == "選択削除"
      #「select_submissions」の数字とSubmissionモデルのidが一致するデータを取
      submissions = Submission.where(id: @select_submissions)
      #提出物一括削除
      if submissions.destroy_all
        #submission_countにselect_submissionsの値の数を代入
        submission_count = @select_submissions.size
      end
      redirect_to submissions_path, notice: "#{submission_count}件の提出物を削除しました。"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:subject, :title, :deadline, :filename, :grade, :class_room, :student1, :student2, :student3, :student4, :student5, :student6, :student7, :student8, :student9, :student10, :student11, :student12, :student13, :student14, :student15, :student16, :student17, :student18, :student19, :student20, :student21, :student22, :student23, :student24, :student25, :student26, :student27, :student28, :student29, :student30, :student31, :student32, :student33, :student34, :student35, :student36, :student37, :student38, :student39, :student40)
    end
end