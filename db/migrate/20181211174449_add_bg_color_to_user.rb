class AddBgColorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bg_color, :string, default: '#005a55'
  end
end
