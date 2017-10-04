require 'spec_helper'

describe('Store') do
  describe("#save") do
    it('does not allow a blank name') do
      store = Store.new({name: ''})
      expect(store.save).to(eq(false))
    end

    it('name cannot have more than 100 characters') do
      store = Store.new({name: 'This is a really really long store name that is completely unnecessary but it is for testing purposes!! :)'})
      expect(store.save).to(eq(false))
    end
    it('cannot be created if the name already exists in the database') do
      Store.create({name: "wellies unlimited"})
      store = Store.new({name: "wellies unlimited"})
      expect(store.save).to(eq(false))
    end
  end

  describe("#capitalize_store") do
    it("capitalizes first letter in each word of store name") do
      store = Store.create(name: "wellies unlimited")
      expect(store.name).to(eq("Wellies Unlimited"))
    end

    it("will not capitalize words that should remain lowercase") do
      store = Store.create(name: "smith and mason")
      expect(store.name).to(eq("Smith and Mason"))
    end
  end
end
