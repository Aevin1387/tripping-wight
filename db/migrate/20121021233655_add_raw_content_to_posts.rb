class AddRawContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :raw_content, :text
  end
end
