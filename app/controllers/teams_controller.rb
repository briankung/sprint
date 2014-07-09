class TeamsController < ApplicationController
  before_action :authenticate_admin!

  def create
    if team_params[:name] =~ /\S/
      @team = Team.create!(team_params)
    end
    redirect_to manage_event_path(session[:event_id])
  end

  def edit
    team = Team.find params[:id]
    flash[:edit] = :team
    flash[:team_id] = team.id
    redirect_to manage_event_path team.event_id
  end
  
  def update
    team = Team.find params[:id]	
    event = Event.find team.event_id
    if event.finalized
      flash[:notice] = "Event is finalized; no edits permitted."
      redirect_to events_path
    elsif team_params[:name] =~ /^deleted?$/i
      team.destroy
      redirect_to manage_event_path event
    elsif team_params[:name] =~ /\S/
      team.update_attributes!(team_params)
      redirect_to manage_event_path event
    end
  end
  
  private
  def team_params
    params.require(:team).permit(:name, :event_id)
  end
end
