class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :number
      t.text :solution
    end
  end
end
