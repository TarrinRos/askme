class RenameBodyToNameInHashtag < ActiveRecord::Migration[5.2]
  def change
    rename_column :hashtags, :body, :name

  end
end
