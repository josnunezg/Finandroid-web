class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.integer :balance, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
