require 'rails_helper'

RSpec.feature "Paginations", type: :feature do

  before(:all) do
    ActionController::Base.allow_forgery_protection = true
  end

  after(:all) do
    ActionController::Base.allow_forgery_protection = false
  end

  scenario "user visits articles home page to see only 10 articles", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    expect(page).to have_css "h2.clickable-link", count: 10
  end

  scenario "user clicks on prev button", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    click_link('next page')
    click_link('prev page')
   
    expect(Article.count).to eq(11)
    expect(page).to have_content(Article.last.title)
  end

  scenario "user tries to click prev button on first page but button is disabled", js: true do
    FactoryBot.create(:article)

    visit articles_path

    expect(page).to have_link('prev page', style: 'pointer-events: none;')
  end

  scenario "user clicks on next button", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    click_link('next page')

    expect(page).to have_content(Article.first.title)
  end

  scenario "user tries to click next button on last page but button is disabled", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    click_link('last page')

    expect(page).to have_link('next page', style: 'pointer-events: none;')
  end

  scenario "user clicks on first page button", js: true do
    FactoryBot.create_list(:article, 1)

    visit articles_path

    click_link('first page')

    expect(page).to have_content(Article.last.title)
  end


  scenario "user clicks on last page button", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    click_link('last page')

    expect(page).to have_content(Article.first.title)
  end

  scenario "user selects 5 for limit of items", js: true do
    FactoryBot.create_list(:article, 6)

    visit articles_path

    select '5', from: 'paginator'

    expect(page).to have_css "h2.clickable-link", count: 5
  end

  scenario "user selects 10 for limit of items", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    select '10', from: 'paginator'

    expect(page).to have_css "h2.clickable-link", count: 10
  end

  scenario "user selects 25 for limit of items", js: true do
    FactoryBot.create_list(:article, 26)

    visit articles_path

    select '25', from: 'paginator'

    expect(page).to have_css "h2.clickable-link", count: 25
  end


  scenario "user selects 50 for limit of items", js: true do
    FactoryBot.create_list(:article, 51)

    visit articles_path

    select '50', from: 'paginator'

    expect(page).to have_css "h2.clickable-link", count: 50
  end


  scenario "user selects all for limit of items", js: true do
    FactoryBot.create_list(:article, 11)

    visit articles_path

    select 'all', from: 'paginator'

    expect(page).to have_css "h2.clickable-link", count: 11
  end
end