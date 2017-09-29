require 'spec_helper'


describe('Brand') do
  describe("#save") do
    it('does not allow a blank name') do
      brand = Brand.new({name: '', price: 80})
      expect(brand.save).to(eq(false))
    end
  end
end
