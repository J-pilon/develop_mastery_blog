require 'rails_helper'

RSpec.feature "Paginations", type: :feature do

  before do
    visit articles_path
  end

  scenario "user visits articles home page to see only 10 articles", js: true do

    expect(page).to have_css "div.item-container-sizing.item-container-padding.flex-row-space-between", count: 10
  end

  scenario "user clicks on prev button", js: true do
    click_link('next page')
    click_link('prev page')

    expect(page).to have_content('Article 100')
  end

  scenario "user tries to click prev button on first page but button is disabled", js: true do
    
    expect(page).to have_link('prev page', style: 'pointer-events: none;')
  end

  scenario "user clicks on next button", js: true do
    click_link('next page')

    expect(page).to have_content('Article 90')
  end

  scenario "user tries to click next button on last page but button is disabled", js: true do
    click_link('last page')

    expect(page).to have_link('next page', style: 'pointer-events: none;')
  end

  scenario "user clicks on first page button", js: true do
    click_link('first page')

    expect(page).to have_content('Article 100')
  end


  scenario "user clicks on last page button", js: true do
    click_link('last page')

    expect(page).to have_content('Article 1')
  end

  scenario "user selects 5 for limit of items", js: true do
    select '5', from: 'paginator'

    expect(page).to have_css "div.item-container-sizing.item-container-padding.flex-row-space-between", count: 5
  end

  scenario "user selects 10 for limit of items", js: true do
    select '10', from: 'paginator'

    expect(page).to have_css "div.item-container-sizing.item-container-padding.flex-row-space-between", count: 10
  end

  scenario "user selects 25 for limit of items", js: true do
    select '25', from: 'paginator'

    expect(page).to have_css "div.item-container-sizing.item-container-padding.flex-row-space-between", count: 25
  end


  scenario "user selects 50 for limit of items", js: true do
    select '50', from: 'paginator'

    expect(page).to have_css "div.item-container-sizing.item-container-padding.flex-row-space-between", count: 50
  end


  scenario "user selects all for limit of items", js: true do
    select 'all', from: 'paginator'

    expect(page).to have_css "div.item-container-sizing.item-container-padding.flex-row-space-between", count: 100
  end

end
