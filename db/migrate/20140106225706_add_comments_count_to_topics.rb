class AddCommentsCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :comments_count, :integer
  end
end
