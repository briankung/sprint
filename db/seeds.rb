load "#{Rails.root}/db/seeds/problem_seeds.rb"
if Rails.env != "production"
  load "#{Rails.root}/db/seeds/team_seeds.rb"
end
