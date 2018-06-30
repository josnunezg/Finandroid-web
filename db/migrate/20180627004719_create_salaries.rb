class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :name
      t.text :description
      t.integer :amount, default: 0
      t.references :bank_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
