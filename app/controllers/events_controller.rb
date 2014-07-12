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
    @chapter = Chapter.find(params[:chapter_id])
    session[:event_id] = nil
  end

  def edit
    authenticate_admin!
    @event = Event.find(params[:id])
    if @event.finalized
      flash[:notice] = "This event has been finalized"
      redirect_to event_path(@event)
    elsif @event.admin_id != current_admin.id
      flash[:notice] = "This event belongs to #{Admin.find(@event.admin_id)[:email]}"
      redirect_to events_path
    else
      flash[:edit] = :event
      redirect_to manage_event_path(@event)
    end
  end

  def manage
    authenticate_admin!
    @event = Event.find(params[:id])
    if @event.admin_id != current_admin.id
      flash[:notice] = "This event belongs to #{Admin.find(@event.admin_id)[:email]}"
      redirect_to events_path
    end
    
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
      @event = Event.create!({admin_id: current_admin.id, chapter_id: params[:chapter_id]}.merge event_params)
      redirect_to manage_event_path(@event)
    else
      redirect_to events_path
    end
  end

  def update
    authenticate_admin!
    @event = Event.find(params[:id])
    if @event.admin_id != current_admin.id
      flash[:notice] = "This event belongs to #{Admin.find(@event.admin_id)[:email]}"
      redirect_to events_path
    end
    if @event.finalized
      redirect_to events_path
    elsif event_params[:name] =~ /^deleted?$/i
      name = @event.name
      if @event.destroy
        flash[:notice] = "Event #{name} has been deleted."
        session[:event_id] = nil
        redirect_to events_path
      else
        flash[:notice] = "Event #{name} WAS NOT DELETED!"
        redirect_to manage_event_path(@event)
      end
    elsif event_params[:name] =~ /^finalized?$/i
      @event.update! finalized: true
      flash[:notice] = "Event #{name} has been finalized."
      redirect_to events_path
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
