class Problem < ActiveRecord::Base
  def self.check number, solution
    q = self.where number: number
    if q.any?
      return q.where(solution: solution).any?
    else
      return nil
    end
  end
end
