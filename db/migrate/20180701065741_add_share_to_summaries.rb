class AddShareToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :share, :boolean, default: false
  end
end
