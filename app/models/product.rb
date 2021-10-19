class Product < ApplicationRecord
    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
    mount_uploader :avatar, AvatarUploader


    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    
    searchable do
        text :name, :description
    end

end
