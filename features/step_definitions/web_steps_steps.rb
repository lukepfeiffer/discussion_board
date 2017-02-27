When /^I sign in as a user$/ do
  visit root_path
  fill_in 'email', with: 'email@example.com'
  fill_in 'password', with: 'password'
  click_button 'Sign In'
end

When /^I confirm the dialogue$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I follow "(.+)"$/ do |link_name|
  click_link link_name
end

Given "I am on the home page" do
  visit root_path
end

And /^I am on the "(.+)" page$/ do |path|
  visit path
end

When /^I fill in "(.+)" with "(.+)"$/ do |field, value|
  fill_in field, with: value
end

When /^I press "(.+)"$/ do |button_name|
  click_button button_name
end

Then /^I should be on the "(.+)" page$/ do |path|
  expect(page.current_path).to eq(path)
end

Then /^I should see "(.+)"$/ do |content|
  expect(page).to have_content(content)
end
Then /^I should not see "(.+)"$/ do |content|
  expect(page).not_to have_content(content)
end
