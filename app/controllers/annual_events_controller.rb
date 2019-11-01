class AnnualEventsController < ApplicationController
  before_action :set_annual_event, only: [:show, :edit, :update, :destroy]

  # GET /annual_events
  # GET /annual_events.json
  def index
    @annual_events = AnnualEvent.all
  end

  # GET /annual_events/1
  # GET /annual_events/1.json
  def show
  end

  # GET /annual_events/new
  def new
    @annual_event = AnnualEvent.new
  end

  # GET /annual_events/1/edit
  def edit
  end

  # POST /annual_events
  # POST /annual_events.json
  def create
    @annual_event = AnnualEvent.new(annual_event_params)

    if params[:annual_event][:filename].present?
      @annual_event.filename = params[:annual_event][:filename].original_filename

      File.open("app/assets/images/#{@annual_event.filename}",'w+b'){ |f|
        f.write(params[:annual_event][:filename].read)
      }
    end

    respond_to do |format|
      if @annual_event.save
        format.html { redirect_to @annual_event, notice: 'Annual event was successfully created.' }
        format.json { render :show, status: :created, location: @annual_event }
      else
        format.html { render :new }
        format.json { render json: @annual_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annual_events/1
  # PATCH/PUT /annual_events/1.json
  def update
    respond_to do |format|
      if @annual_event.update(annual_event_params)
        format.html { redirect_to @annual_event, notice: 'Annual event was successfully updated.' }
        format.json { render :show, status: :ok, location: @annual_event }
      else
        format.html { render :edit }
        format.json { render json: @annual_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annual_events/1
  # DELETE /annual_events/1.json
  def destroy
    @annual_event.destroy
    respond_to do |format|
      format.html { redirect_to annual_events_url, notice: 'Annual event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annual_event
      @annual_event = AnnualEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annual_event_params
      params.require(:annual_event).permit(:filename)
    end
end
