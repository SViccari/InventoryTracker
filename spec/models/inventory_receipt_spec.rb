require 'spec_helper'

describe InventoryReceipt do
  it { should have_valid(:title).when('French Fries', 'Hamburgers') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:description).when('crazy good','awesome') }
  it { should_not have_valid(:description).when('',nil) }

  it { should have_valid(:quantity).when(5, 50) }
  it { should_not have_valid(:quantity).when('',nil,'foo') }  
end
