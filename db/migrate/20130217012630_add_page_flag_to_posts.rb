class AddPageFlagToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_page, :boolean
  end
end
