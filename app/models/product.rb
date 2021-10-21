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

    # def self.to_csv(fields = column_names, options = {})
    #     binding.pry
    #     CSV.generate(options) do |csv|
    #         csv << fields
    #         all.each do |product|
    #             csv << product.attributes.values_at(*fields)
    #         end
    #     end
    # end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Product.create! row.to_hash
        end
    end
end
