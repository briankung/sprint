class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :team
      t.integer :problem

      t.timestamp
    end
  end
end
