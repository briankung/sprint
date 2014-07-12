class AdminChapter < ActiveRecord::Base
  belongs_to :admin
  belongs_to :chapter

  def self.authorized?(admin_id, chapter_id)
    if AdminChapter.where(admin_id: admin_id, chapter_id: :chapter_id).empty?
      return false # Not associated => not authorized
    else
      return true # Associated => authorized
    end
  end
end
