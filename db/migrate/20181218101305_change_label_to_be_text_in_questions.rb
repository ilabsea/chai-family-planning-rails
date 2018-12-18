class ChangeLabelToBeTextInQuestions < ActiveRecord::Migration[5.1]
  def up
    change_column :questions, :label, :text
  end

  def down
    change_column :questions, :label, :string
  end
end
