require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  	@user = FactoryBot.build(:user)
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with email and password" do
  	  expect(@user).to be_valid
  end

  it "is invalid without an email" do
  	user = FactoryBot.build(:user, email: nil)
  	user.valid?
  	expect(user.errors[:email]).to include("can't be blank")
  end
  	
  it "is invalid without a password" do
  	user = FactoryBot.build(:user, password: nil)
  	user.valid?
  	expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
  	FactoryBot.create(:user, email: "test@mail.com")
  	user = FactoryBot.build(:user, email: "test@mail.com")
	user.valid?
	expect(user.errors[:email]).to include("has already been taken") 

  end
end
