class RemoveTimeStapmsToRibbitmsg < ActiveRecord::Migration
  def change
    remove_column :ribbitmsgs, :timestamps, :date
  end
end
