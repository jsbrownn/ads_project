class CreateAdPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ad_posts do |t|
      t.string :title
      t.string :description
      t.timestamps
    end

end
