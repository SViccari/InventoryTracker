require 'spec_helper'

feature 'receive inventory', %Q{ 
  As a food service employee
  I want to receive inventory
  So that it can be recorded 
  that we have food items
} do 

  # Acceptance Criteria

  # *I must specify a title, description, 
  #   and quantity of the food item
  # *If I do not specify the required information, 
  #   I am prompted to fix errors and to resubmit
  # *If I specify the required information, 
  #   my inventory entry is recorded.

  scenario 'required information is supplied' do 
    prev_count = InventoryReceipt.count 
    visit new_inventory_receipt_path
    fill_in 'Title', with: 'French Fries'
    fill_in 'Description', with: 'Better than yours'
    fill_in 'Quantity', with: '5'
    click_button 'Receive'

    expect(page).to have_content('Receipt recorded.')
    expect(InventoryReceipt.count).to eql(prev_count + 1)
  end

  scenario 'required information is not supplied' do 
    prev_count = InventoryReceipt.count

    visit new_inventory_receipt_path
    click_button 'Receive'
    expect(InventoryReceipt.count).to eql(prev_count)
    expect(page).to have_content("can't be blank")
  end
end
