class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, :limit => 50, :null => false
      t.string :answer, :limit => 20, :null => false
      t.string :distractors, :limit => 50, :default => "", :null => true
      t.integer :difficulty, :default => 0

      t.timestamps null: true
    end
  end
end
