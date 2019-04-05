require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before(:each) do
    @owner_1 = Owner.create(name: "Sam's Snacks")
    @owner_2 = Owner.create(name: "Owner 2")
    @owner_3 = Owner.create(name: "Owner 3")

    @loc1  = @owner_1.machines.create(location: "Don's Mixed Drinks")
    @loc2  = @owner_2.machines.create(location: "Location 2")
    @loc3  = @owner_3.machines.create(location: "Location 3")
    @loc4  = @owner_1.machines.create(location: "Location 4")
    @loc5  = @owner_2.machines.create(location: "Location 5")

    @snack_1 = @loc1.snacks.create(name: "Fruit Roll-Ups", price: 0.50)
    @snack_2 = @loc1.snacks.create(name: "Chex Trail Mix", price: 1.50)
    @snack_3 = @loc1.snacks.create(name: "Snack 3", price: 2.50)

    @loc2.snacks << @snack_1
    @loc2.snacks << @snack_3
    @snack_4 = @loc2.snacks.create(name: "Snack 4", price: 1.00)

    @loc3.snacks << @snack_2
    @loc3.snacks << @snack_3

    @loc4.snacks << @snack_1
    @loc4.snacks << @snack_2
    @loc4.snacks << @snack_4

    @loc5.snacks << @snack_2
    @loc5.snacks << @snack_4
  end

  scenario 'they see the name of the snack' do
    visit snack_path(@snack_1)
    expect(page).to have_content(@snack_1.name)

    visit snack_path(@snack_2)
    expect(page).to have_content(@snack_2.name)
  end

  scenario 'they see the price of the snack' do
    visit snack_path(@snack_1)
    expect(page).to have_content(@snack_1.price)

    visit snack_path(@snack_2)
    expect(page).to have_content(@snack_2.price)
  end

  scenario 'they see a list of locations which have the snack' do
    visit snack_path(@snack_1)

    within '#locations' do
      [@loc1, @loc2, @loc4].each do |location|
        expect(page).to have_content(location.name)
      end
    end
  end

  xscenario 'they see the average price of all snacks in each machine' do
    #
  end

  xscenario 'they see a count of different items in each machine' do
    #
  end
end
