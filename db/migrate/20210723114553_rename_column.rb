class RenameColumn < ActiveRecord::Migration[6.1]

    def change
        rename_column :tags, :tag, :title
      end

end
