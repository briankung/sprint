class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
