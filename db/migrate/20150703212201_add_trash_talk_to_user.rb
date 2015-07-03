class AddTrashTalkToUser < ActiveRecord::Migration
  def change
    add_column :users, :trash_talk, :text
  end
end
