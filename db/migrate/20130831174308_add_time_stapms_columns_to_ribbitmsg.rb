class AddTimeStapmsColumnsToRibbitmsg < ActiveRecord::Migration
  def change
    add_timestamps(:ribbitmsgs)
  end
end
