class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 100}
  before_save :capitalize_store, :store_exists?
  before_destroy :destroy_associations

  private

  def capitalize_store
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end

  def store_exists?
    Store.all.each do |store|
      if store.name == self.name
        return self.save == false
      end
    end
  end
end
