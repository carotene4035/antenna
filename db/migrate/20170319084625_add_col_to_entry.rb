class AddColToEntry < ActiveRecord::Migration
  def change
      add_column :entries, :blog_id, :int, :after =>:id
  end
end
