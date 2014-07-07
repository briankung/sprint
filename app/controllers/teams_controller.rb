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
    event_id = team.event_id
    if team_params[:name] == "delete"
      team.destroy
    elsif team_params[:name] =~ /\S/
      team.update_attributes!(team_params)
    end
    redirect_to manage_event_path event_id
  end
  
  private
  def team_params
    params.require(:team).permit(:name, :event_id)
  end
end
