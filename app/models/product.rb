class Product < ApplicationRecord
    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
    mount_uploader :avatar, AvatarUploader

    searchable do
        text :name, :description
    end

end
