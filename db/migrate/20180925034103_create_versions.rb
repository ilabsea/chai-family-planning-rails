class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :uuid
      t.string :version
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps null: false
    end
  end
end
