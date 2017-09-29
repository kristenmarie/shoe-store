require 'spec_helper'


describe('Brand') do
  describe("#save") do
    it('does not allow a blank name') do
      brand = Brand.new({name: '', price: 80})
      expect(brand.save).to(eq(false))
    end

    it('name cannot have more than 100 characters') do
      brand = Brand.new({name: 'This is a really really long store name that is completely unnecessary but it is for testing purposes!! :)', price: 90})
      expect(brand.save).to(eq(false))
    end
  end

    describe("#capitalize_brand") do
      it("capitalizes first letter in each word of brand") do
        brand = Brand.create(name: "wooley walkers", price: 40)
        expect(brand.name).to(eq("Wooley Walkers"))
      end
    end
end
