class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 100}
  before_save :capitalize_store, :store_exists?
  before_destroy :destroy_associations

  private

  def capitalize_store
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

  def store_exists?
    Store.all.each do |store|
      if store.name == self.name
        return self.save == false
      end
    end
  end
end
