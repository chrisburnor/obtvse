class UpdatePublishedAtDate < ActiveRecord::Migration
  def up
    Post.all.each do |post|
      post.update_attributes! :published_at => post.updated_at
    end
  end

  def down
  end
end
