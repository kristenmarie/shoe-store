class Store < ActiveRecord::Base
  has_many :associations
  has_many :brands, through: :associations
  validates :name, presence: true, length: {maximum: 100}
end
