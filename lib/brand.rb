class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, presence: true, length: {maximum: 100}
  before_save :capitalize_brand

  private

  def capitalize_brand
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end
end
