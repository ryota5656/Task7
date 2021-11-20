class ChangeData < ActiveRecord::Migration[5.2]
  def change
    change_column :users , :name , :boolean , null:true
    change_column :users , :image , :boolean , null:true
    change_column :users , :introduction , :boolean , null:true
  end
end
