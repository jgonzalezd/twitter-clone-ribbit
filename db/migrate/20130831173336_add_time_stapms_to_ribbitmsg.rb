class AddTimeStapmsToRibbitmsg < ActiveRecord::Migration
  def change
    add_column :ribbitmsgs, :timestamps, :datetime
  end
end
