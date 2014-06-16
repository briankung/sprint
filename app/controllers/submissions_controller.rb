class SubmissionsController < ApplicationController
  def show
    @submission = Submission.find params[:id]
    redirect_to edit_submission_path @submission
  end

  def index
    @submissions = Submission.all
  end
  
  def new
    # default
  end
  
  def create
    team = Team.find_by_id(params[:new_submission][:team])
    problem = params[:new_submission][:problem]
    @submission = Submission.create!({team: team, problem: problem})
    flash[:notice] = "Submission #{@submission.team.name}/#{@submission.problem} has been added."
    if URI(request.referer).path == new_submission_path
      redirect_to new_submission_path
    else
      redirect_to submissions_path
    end
  end
  
  def edit
    @submission = Submission.find params[:id]
  end
  
  def update
    @submission = Submission.find params[:id]	
    before = "#{@submission.team.name} / #{@submission.problem}"
    team = Team.find_by_id(params[:submission][:team])
    problem = params[:submission][:problem]
    @submission.update_attributes!({team: team, problem: problem})
    after = "#{@submission.team.name} / #{@submission.problem}"
    flash[:notice] = "Was #{before}; now #{after}."
    redirect_to edit_submission_path @submission
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    name = @submission.team.name
    problem = @submission.problem
    if @submission.destroy
      flash[:notice] = "Submission #{name}/#{problem} has been deleted."
    else
      flash[:notice] = "Submission #{name}/#{problem} WAS NOT DELETED!"
    end
    redirect_to submissions_path
  end
end
