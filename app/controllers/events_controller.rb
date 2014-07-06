class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event  = Event.find(params[:id])
    @boards = @event.divisions
    if params.has_key? :refresh
      if params[:refresh].to_i > 0
        @refresh = params[:refresh].to_i
      else
        @refresh = 60
      end
    end
    if params.has_key? :countdown
      require 'time'
      diff = Time.parse(params[:countdown]) - Time.now
      if diff > 0
        h_m = Time.at(diff).gmtime.strftime("%H:%M")
        @countdown = "#{h_m} remaining"
      else
        @countdown = "Time has expired!"
      end
    end
  end

  # GET /events/new
  def new
    authenticate_admin!
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    authenticate_admin!
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :finalized)
    end
end
