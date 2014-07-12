class AdminChapter < ActiveRecord::Base
  belongs_to :admin
  belongs_to :chapter
end
