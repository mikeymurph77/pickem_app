class AddTieToResults < ActiveRecord::Migration
  def change
    add_column :results, :tie, :boolean, default: false
  end
end
