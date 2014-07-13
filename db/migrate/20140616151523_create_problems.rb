class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems, id: false do |t|
      t.integer :number
      t.text :name
      t.text :solution
    end
  end
end
