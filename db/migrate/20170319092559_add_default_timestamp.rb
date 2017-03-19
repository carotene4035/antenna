class AddDefaultTimestamp < ActiveRecord::Migration
  def change
      change_column :blogs, :latest_entry_published_at, :int, :default => 0
  end
end
