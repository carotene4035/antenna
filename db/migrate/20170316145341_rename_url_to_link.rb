class RenameUrlToLink < ActiveRecord::Migration
  def change
      rename_column :entries, :url, :link
  end
end
