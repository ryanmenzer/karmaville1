require 'spec_helper'

feature "page rendering with route bar" do
  background do
    90.times {|n| FactoryGirl.create(:user_with_karma, :first_name => "Jack", :total => (500 + n), :points => 2)}
    10.times {|n| FactoryGirl.create(:user_with_karma, :first_name => "Mandy", :total => (600 + n), :points => 2)}
    9.times {|n| FactoryGirl.create(:user_with_karma, :first_name => "Sonia", :total => (700 + n), :points => 2)}
    FactoryGirl.create(:user_with_karma, :first_name => "Ryan", :last_name => "Menzer", :total => 800, :points => 5)
    FactoryGirl.create(:user_with_karma, :first_name => "Kevin", :last_name => "Berry", :total => 100, :points => 5)
    FactoryGirl.create(:user_with_karma, :first_name => "Jake", :last_name => "TheSnake", :total => 650, :points => 5)
  end

  scenario "Seeing top 10 karma users on homepage" do
    visit root_path
    expect(page).to have_content("Ryan Menzer")
  end


  scenario "clicking forward to next page" do
    visit root_path
    click_link 'Next'
    expect(page).to have_content("Jake TheSnake")
  end


end
