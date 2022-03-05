require 'rails_helper'

RSpec.describe :User, type: :model do
  it "is valid with username and email" do
    user = FactoryBot.build(:user)

    expect(user).to be_valid
  end

  it "is not valid without username" do
    user = FactoryBot.build(:user, username: nil)

    expect(user).to_not be_valid
  end

  it "is not valid without email" do
    user = FactoryBot.build(:user, email: nil)

    expect(user).to_not be_valid
  end

  it "is not valid if username is not unique" do
    FactoryBot.create(:user, username: "username")

    dublicate_user = FactoryBot.build(:user, username: "username")
    dublicate_user.valid?

    expect(dublicate_user.errors[:username]).to include("has already been taken")
  end

  it "is not valid if email is not unique" do
    FactoryBot.create(:user, email: "test@yahoo.ca")

    dublicate_user = FactoryBot.build(:user, email: "test@yahoo.ca")
    dublicate_user.valid?

    expect(dublicate_user.errors[:email]).to include("has already been taken")
  end

  it "is not valid if username is less then 3 characters" do
    user = FactoryBot.build(:user, username: "ab")
    user.valid?

    expect(user).to_not be_valid
    expect(user.errors[:username]).to include("is too short (minimum is 3 characters)")
  end

  it "is not valid if email doesn't match format" do
    user = FactoryBot.build(:user, email: "invalid email format")
    user.valid?

    expect(user).to_not be_valid
    expect(user.errors[:email]).to include("email does not match required format")
  end
end
