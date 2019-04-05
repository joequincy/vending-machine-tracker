require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @snack_1 = @dons.snacks.create(name: "Fruit Roll-Ups", price: 0.50)
    @snack_2 = @dons.snacks.create(name: "Chex Trail Mix", price: 1.50)
    visit machine_path(@dons)
  end

  scenario 'they see the location of that machine' do
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see a list of snacks in the machine, and their price' do
    expect(page).to have_content("#{@snack_1.name}: $0.50")
    expect(page).to have_content("#{@snack_2.name}: $1.50")
  end

  scenario 'they see the average price of snacks in machine' do
    expect(page).to have_content("Average Price: $1.00")
  end
end
