class Store < ActiveRecord::Base
  has_many :associations
  has_many :brands, through: :associations
end
