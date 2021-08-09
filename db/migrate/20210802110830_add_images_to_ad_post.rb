class AddImagesToAdPost < ActiveRecord::Migration[6.1]
  def change
    add_column :ad_posts, :images_filename, :json
  end
end
