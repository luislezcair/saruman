# frozen_string_literal: true

require 'rails_helper'

describe GroundWireSetupType do
  it 'has a valid factory' do
    b = build(:ground_wire_setup_type)
    expect(b).to be_valid
  end

  it 'is invalid without a name' do
    b = build(:ground_wire_setup_type, name: nil)
    expect(b).to_not be_valid
  end

  it 'is invalid without a unique name' do
    b = create(:ground_wire_setup_type)
    b2 = build(:ground_wire_setup_type, name: b.name.upcase)
    expect(b2).to_not be_valid
  end
end
