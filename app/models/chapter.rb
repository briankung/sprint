class Chapter < ActiveRecord::Base
  has_many :events
  has_many :admin_chapters
  has_many :admins, through: :admin_chapters
end
