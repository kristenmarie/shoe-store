class Store < ActiveRecord::Base
  has_many :associations
  has_many :brands, through: :associations
  validates :name, presence: true, length: {maximum: 100}
  before_save :capitalize_store

  private

  def capitalize_store
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end
end
