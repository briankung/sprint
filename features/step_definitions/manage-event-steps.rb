Given (/^the following admins exist$/) do |table|
  table.hashes.each do |row|
    Admin.create!(row)
  end
end

Given(/^the following events exist$/) do |table|
  table.hashes.each do |row|
    Event.create! name: row[:name]
  end
end

Given(/^the following teams exist$/) do |table|
  table.hashes.each do |row|
    event = Event.find_by_name row[:event]
    Team.create! name: row[:name], event_id: event.id
  end
end

Given(/^the following submissions exist$/) do |table|
  table.hashes.each do |row|
    team = Team.find_by_name row[:team]
    Submission.create! problem: row[:problem], team_id: team.id
  end
end

Given(/^I am signed in as an admin$/) do
  email = 'admin@example.com'
  password = '12345678'
  Admin.create!(email: email, password: password)
  visit new_admin_session_path
  if page.has_field?("Email") && page.has_field?("Password")
    page.fill_in "Email", with: email
    page.fill_in "Password", with: password
    page.click_on "Sign in"
  end
end

Given(/^I am not signed in as an admin$/) do
  visit '/'
  if page.has_link?('a', text: 'Sign out')
    click_link('Sign out')
  end
end

When(/^I go to the Events page$/) do
  visit events_path
end

Then(/^I should see "(.*)"$/) do |arg1|
  page.should have_text(arg1)
end

Then(/^I should not see "(.*)"$/) do |arg1|
  page.should have_no_text(arg1)
end

When(/^I follow "(.*)"$/) do |arg1|
  click_link(arg1)
end
