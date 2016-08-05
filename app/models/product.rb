class Product < ApplicationRecord
  has_many :reviews
  # has_many :users, through: :reviews
  validates :name, :price,
            presence: true

  scope     :search, -> search { where("name LIKE ?", "%#{search}%")}

  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  # end

end
