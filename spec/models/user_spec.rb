require_relative '../spec_helper'

# close the test for our various models
# User is the class that we want
describe User do# describe - wrape and enclose the various test for our various models

  #1. describe the attributes of a user
  #2. the string '' is ->'use string to describe this paticular test'
  it 'has a first name, last name, and email' do
    user = User.new(first_name: "Cernan", last_name: "Bernardo", email: "cernan@flatironschool.com")

    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = User.create(last_name: "Bernardo", email: "cernan@flatironschool.com")

    expect(user).to_not be_valid
  end

  it 'is invalid without a last name' do
    user = User.create(first_name: "Cernan", email: "cernan@flatironschool.com")

    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.create(last_name: "Bernardo", first_name: "Cernan")

    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
      user1 = User.create(first_name: "Cernan", last_name: "Bernardo", email: "cernan@flatironschool.com")
      user2 = User.create(first_name: "Ashley", last_name: "Jones", email: "cernan@flatironschool.com")

      expect(user2).to_not be_valid
  end

  it 'knows its full name' do
      user = User.create(first_name: "Cernan", last_name: "Bernardo", email: "cernan@flatironschool.com")

      expect(user.full_name).to eq("Cernan Bernardo")
  end

  it 'is created with a default status of non-premium' do
    user = User.create(first_name: "Cernan", last_name: "Bernardo", email: "cernan@flatironschool.com")

    expect(user.status).to eq('Non-Premium')
  end
# "it" is the start of an actual test
# "describe" is a way to group your test together
  describe 'associations' do
    it 'has many carts' do
      user = User.create(first_name: "Cernan", last_name: "Bernardo", email: "cernan@flatironschool.com")
      cart = Cart.create
      cart2 = Cart.create
      user.carts << cart
      user.carts << cart2

    end

    it 'has many items'
  end

end
