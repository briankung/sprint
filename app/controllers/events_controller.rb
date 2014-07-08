class EventsController < ApplicationController
  def index
    @events = Event.all.order("id DESC")
  end

  def show
    @event  = Event.find(params[:id])
    session[:event_id] = @event.id
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
      if diff > 60
        h_m = Time.at(diff).gmtime.strftime("%H:%M")
        @countdown = "#{h_m} remaining"
      elsif diff > 0
        @countdown = "Less than a minute remaining!"
      else
        @countdown = "Time has expired!"
      end
    end
  end

  def new
    authenticate_admin!
    @event = Event.new
    session[:event_id] = nil
  end

  def edit
    authenticate_admin!
    @event = Event.find(params[:id])
    if @event.finalized
      flash[:notice] = "This event has been finalized"
      redirect_to event_path(@event)
    else
      flash[:edit] = :event
      redirect_to manage_event_path(@event)
    end
  end

  def manage
    authenticate_admin!
    @event = Event.find(params[:id])
    session[:event_id] = @event.id
    if @event.finalized
      flash[:notice] = "This event has been finalized"
      redirect_to event_path(@event)
    else
      @teams = @event.teams
      @submissions = @event.submissions
    end
  end

  def create
    authenticate_admin!
    if event_params[:name] =~ /\S/
      @event = Event.create!(event_params)
      redirect_to manage_event_path(@event)
    else
      redirect_to events_path
    end
  end

  def update
    authenticate_admin!
    @event = Event.find(params[:id])
    if event_params[:name] == "delete"
      name = @event.name
      if @event.destroy
        flash[:notice] = "Event #{name} has been deleted."
        session[:event_id] = nil
        redirect_to events_path
      else
        flash[:notice] = "Event #{name} WAS NOT DELETED!"
        redirect_to manage_event_path(@event)
      end
    elsif event_params[:name] =~ /\S/
      @event.update(event_params)
      redirect_to manage_event_path(@event)
    else
      redirect_to manage_event_path(@event)
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :finalized)
    end
end
