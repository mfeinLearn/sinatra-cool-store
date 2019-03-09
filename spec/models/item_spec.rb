require_relative '../spec_helper'

describe Item do
  it 'has a name, price, and inventory'
  it 'is invalid without a  name'
  it 'is invalid without a  price'
  it 'is invalid without an inventory'

  describe 'associations' do
    it 'belongs to a cart' do
      cart = Cart.create
      item1 = Item.create(name: 'iPhone', price: 250, inventory: 70)
      cart.items << item1

      expect(item1.cart).to eq(cart)
    end
  end
end
