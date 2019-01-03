class ChangeNameToBeStringInHashtags < ActiveRecord::Migration[5.2]
  def change
    change_column :hashtags, :name, :string
  end
end
