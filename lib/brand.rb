class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 100}
  before_save :capitalize_brand



  private

  def capitalize_brand
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end

  def currency_convert
    number_to_currency(self.price)
  end
end
