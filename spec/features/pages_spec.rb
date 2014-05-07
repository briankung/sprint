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
    xit 'has rules' do
      click_link 'Rules'
      expect(page).to have_content "Bitches"
    end
  end
end