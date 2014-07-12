class AddChapterIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :chapter_id, :integer
  end
end
