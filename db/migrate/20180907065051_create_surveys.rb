class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.text :value
      t.string :version
      t.datetime :uuid
      t.datetime :start_entried_at
      t.datetime :end_entried_at

      t.timestamps null: false
    end
  end
end
