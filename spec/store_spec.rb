require 'spec_helper'

describe('Store') do
  describe("#save") do
    it('does not allow a blank name') do
      store = Store.new({name: ''})
      expect(store.save).to(eq(false))
    end
  end
end
