require 'spec_helper'


describe('Brand') do
  describe("#save") do
    it('does not allow a blank name') do
      brand = Brand.new({name: '', price: 80})
      expect(brand.save).to(eq(false))
    end

    it('does not allow a blank price') do
      brand = Brand.new({name: "wooley walkers", price: nil})
      expect(brand.save).to(eq(false))
    end

    it('name cannot have more than 100 characters') do
      brand = Brand.new({name: 'This is a really really long store name that is completely unnecessary but it is for testing purposes!! :)', price: 90})
      expect(brand.save).to(eq(false))
    end

    it('cannot be created if the name already exists in the database') do
      Brand.create({name: "wooley walkers", price: 90})
      brand2 = Brand.new({name: "wooley walkers", price: 90})
      expect(brand2.save).to(eq(false))
    end

    it('formats price entry into currency format') do
      brand = Brand.create({name: "wooley walkers", price: 90})
      expect(brand.price).to(eq('$90.00'))
    end

    it('name cannot contain offensive language') do
      brand = Brand.new({name: "curmudgeon", price: 90})
      expect(brand.save).to(eq(false))
    end
  end

    describe("#capitalize_brand") do
      it("capitalizes first letter in each word of brand") do
        brand = Brand.create(name: "wooley walkers", price: 40)
        expect(brand.name).to(eq("Wooley Walkers"))
      end

      it("will not capitalize words that should remain lowercase") do
        brand = Brand.create(name: "wooley and walkers", price: 40)
        expect(brand.name).to(eq("Wooley and Walkers"))
      end
    end
end
