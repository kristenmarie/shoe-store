class Brand < ActiveRecord::Base
  has_many :associations
  has_many :stores, through: :associations
  validates :name, presence: true, length: {maximum: 100}
end
