class Team < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :event
  has_many :submissions

  #attr_accessible :id, :name

  def problems_solved
    Submission.where(team_id: self).order(:problem).pluck(:problem)
  end
end
