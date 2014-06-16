class TeamsController < ApplicationController
  def show
    @team = Team.find params[:id]
    redirect_to edit_team_path @team
  end
  
  def index
    @teams = Team.all
  end

  def new
  end  

  def create
    @team = Team.create!(params[:new_team])
    flash[:notice] = "#{@team.name} has been added."
    redirect_to teams_path
  end

  def edit
    @team = Team.find params[:id]
  end
  
  def update
    @team = Team.find params[:id]	
    before = "#{@team.name}"
    @team.update_attributes!(params[:team])
    after = "#{@team.name}"
    flash[:notice] = "Team name changed: was #{before}; now #{after}."
    redirect_to edit_team_path @team
  end
  
  def destroy
    @team = Team.find(params[:id])

    Submission.where(team_id: @team).each do |s|
      s.destroy
    end
    
    name = @team.name
    if @team.destroy and 
      flash[:notice] = "Team #{name} has been deleted."
    else
      flash[:notice] = "Team #{name} WAS NOT DELETED!"
    end
    redirect_to teams_path
  end
end
