class TeamsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find params[:id]
    redirect_to edit_team_path @team
  end
  
  def create
    @team = Team.create!(team_params)
    redirect_to manage_event_path(@team.event_id)
  end

  def edit
    @team = Team.find params[:id]
  end
  
  def update
    @team = Team.find params[:id]	
    before = "#{@team.name}"
    @team.update_attributes!(team_params)
    after = "#{@team.name}"
    flash[:notice] = "Team name changed: was #{before}; now #{after}."
    redirect_to edit_team_path @team
  end
  
  def destroy
    @team = Team.find(params[:id])
    name = @team.name
    if @team.destroy and 
      flash[:notice] = "Team #{name} has been deleted."
    else
      flash[:notice] = "Team #{name} WAS NOT DELETED!"
    end
    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:name, :event_id)
  end
end
