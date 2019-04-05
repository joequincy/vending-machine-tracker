require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before(:each) do
    @owner_1 = Owner.create(name: "Sam's Snacks")
    @dons  = @owner_1.machines.create(location: "Don's Mixed Drinks")
    @snack_1 = @dons.snacks.create(name: "Fruit Roll-Ups", price: 0.50)
    @snack_2 = @dons.snacks.create(name: "Chex Trail Mix", price: 1.50)
  end

  scenario 'they see the name of the snack' do
    visit snack_path(@snack_1)
    
    expect(page).to have_content(@snack_1.name)
  end

  xscenario 'they see the price of the snack' do
    #
  end

  xscenario 'they see a list of locations which have the snack' do
    #
  end

  xscenario 'they see the average price of all snacks in each machine' do
    #
  end

  xscenario 'they see a count of different items in each machine' do
    #
  end
end
