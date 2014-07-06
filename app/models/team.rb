class Team < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :event_id, presence: true
  belongs_to :event
  has_many :submissions, dependent: :destroy

  def problems_solved
    Submission.where(team_id: self).order(:problem).pluck(:problem)
  end
end
