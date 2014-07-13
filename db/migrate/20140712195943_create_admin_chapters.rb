class CreateAdminChapters < ActiveRecord::Migration
  def change
    create_table :admin_chapters do |t|
      t.integer :admin_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end
