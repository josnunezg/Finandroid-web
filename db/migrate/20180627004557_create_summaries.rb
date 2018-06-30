class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.string :trackable
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
