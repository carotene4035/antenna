class RenamePublishedDateToPublisheAt < ActiveRecord::Migration
  def change
      rename_column :entries, :published_date, :published_at
  end
end
