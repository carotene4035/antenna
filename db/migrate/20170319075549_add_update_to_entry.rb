class AddUpdateToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :published_date, :int
  end
end
