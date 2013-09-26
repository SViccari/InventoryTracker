class InventoryReceipt < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description

  validates_numericality_of :quantity, 
    allow_blank: false
end
