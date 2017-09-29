class Brand < ActiveRecord::Base
  has_many :associations
  has_many :stores, through: :associations
end
