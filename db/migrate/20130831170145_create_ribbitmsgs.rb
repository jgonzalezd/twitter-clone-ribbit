class CreateRibbitmsgs < ActiveRecord::Migration
  def change
    create_table :ribbitmsgs do |t|
      t.text :content
      t.references :user
    end
  end
end
