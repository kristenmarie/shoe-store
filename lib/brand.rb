class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 100}, :exclusion => { :in => %w(clodhopper lout curmudgeon), case_sensitive:false }
  before_save :capitalize_brand, :currency_convert



  private

  def capitalize_brand
    non_capitals = ["a", "an", "the", "and", "at", "by"]
    capitalized = []
    name = self.name.split(" ")
    name.map do |word|
      if !non_capitals.include?(word)
        capitalized.push(word.capitalize)
      else
        capitalized.push(word)
      end
    end
    self.name = capitalized.join(" ")
  end

  def currency_convert
    self.price = '$' + self.price + ".00"
  end
end
