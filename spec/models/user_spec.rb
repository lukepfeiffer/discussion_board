require 'rails_helper'

RSpec.describe User, type: :model do
  let(:unconfirmed) { Fabricate(:unconfirmed_user) }

  it "updates user to be confirmated" do
    unconfirmed.email_activate
    expect(unconfirmed.confirmed_email).to eq(true)
  end
end
