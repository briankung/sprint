require 'spec_helper'

describe 'Pages' do
  before(:each) { visit root_url }

  it 'has a header and a footer' do
    expect(page).to have_css('header')
    expect(page).to have_css('footer')
  end

  it 'has links to Rules and Meetups' do
    click_link 'Rules'
    click_link 'Meetups'
  end

  describe 'Rules' do
    it 'contains the Project Euler Sprint rules' do
      click_link 'Rules'
      expect(page).to have_css('h2', text: "Rules")
      expect(page).to have_css('ol li', minimum: 9)
    end
  end
end