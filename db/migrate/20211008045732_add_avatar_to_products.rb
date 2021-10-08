class AddAvatarToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :avatar, :string
  end
end
