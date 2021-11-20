class ChangeDate2 < ActiveRecord::Migration[5.2]
  def change
     change_column :users , :name , :string , null:true
    change_column :users , :image , :string, null:true
    change_column :users , :introduction , :string , null:true
  end
end
