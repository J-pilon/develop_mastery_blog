require 'rails_helper'

RSpec.describe Article, type: :model do

  it "is valid with a title and body" do
    expect(FactoryBot.build(:article)).to be_valid
  end

  it "is invalid without a title" do 
    article = FactoryBot.build(:article, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do
    article = FactoryBot.build(:article, body: nil)
    article.valid?
    expect(article.errors[:body]).to include("can't be blank")
  end
end
