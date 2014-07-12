class Event < ActiveRecord::Base
  belongs_to :chapter
  has_many :teams, :dependent => :destroy
  has_many :submissions, :through => :teams

  def teams
    Team.select(:id, :name).
    where("event_id = ?", self.id).
    order("name ASC")
  end

  def submissions
    Submission.joins(:team).
    where("event_id = ?", self.id).
    order("problem ASC")
  end

  def divisions
    divisions =
    [
      {
        title: "<i>e</i>",
        description: "All problems &le; 20",
        range: 1..20,
        teams: []
      },
      {
        title: "<i>i</i>",
        description: "Some problems between 21 and 99",
        range: 21..99,
        teams: []
      },
      {
        title: "&pi;",
        description: "Some problems &ge; 100",
        range: 100..Float::INFINITY,
        teams: []
      }
    ]
    
    team_records = {}
    teams.each do |team|
      team_records[team.id] = {name: team.name, problems: [], total: 0}
    end
    submissions.each do |submission|
      team_records[submission.team_id][:problems] << submission.problem
    end
    team_records.each do |team_id, team_record|
      max = team_record[:problems].max
      team_record[:total] = team_record[:problems].sum
      divisions.each do |division|
        if division[:range].include?(max)
          division[:teams] << team_record
        end
      end
    end
    divisions.each do |division|
      division[:teams].sort! do |a, b|
        b[:total] <=> a[:total]
      end
    end
    return divisions
  end
end
