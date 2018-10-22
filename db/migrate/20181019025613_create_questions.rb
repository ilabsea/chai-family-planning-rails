class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :uuid
      t.string :name
      t.string :label
      t.string :kind
      t.integer :order
      t.boolean :required, default: false
      t.references :version, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
