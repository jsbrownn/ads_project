class CreateJoinTableAdPostTag < ActiveRecord::Migration[6.1]
  def change
    create_join_table :ad_posts, :tags do |t|
      # t.index [:ad_post_id, :tag_id]
      # t.index [:tag_id, :ad_post_id]
    end
  end
end
