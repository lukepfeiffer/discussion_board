When /^I sign in as a user$/ do
  # must have user in the database!!!
  visit sign_in_path
  fill_in 'sign_in_email', with: 'email@example.com'
  fill_in 'sign_in_password', with: 'password'
  click_button 'Sign In'
end

Given /^I am on the root path$/ do
  visit root_path
end

When /^I sign in as a super user$/ do
  # must have user in the database!!!
  visit sign_in_path
  fill_in 'sign_in_email', with: 'superuser@example.com'
  fill_in 'sign_in_password', with: 'password'
  click_button 'Sign In'
end

Then "the user should receive a confirmation email" do
  # this will get the first email, so we can check the email headers and body.
  email = ActionMailer::Base.deliveries.first
  expect(email.from).to eq(["webmaster.uf.ace@gmail.com"])
  expect(email.to).to eq([User.last.email])
  expect(email.subject).to include("Registration Confirmation")
end

When /^I sign in as an admin$/ do
  # must have admin in the database!!!
  visit sign_in_path
  fill_in 'sign_in_email', with: 'admin@example.com'
  fill_in 'sign_in_password', with: 'password'
  click_button 'Sign In'
end

When /^I go to the "(.+)" page$/ do |path|
  visit path
end

When /^I follow "(.+)"$/ do |link_name|
  click_link link_name
end

When "I debug" do
  require 'pry'; binding.pry;
end

Given "I am on the home page" do
  visit root_path
end

And /^I am on a show post page$/ do
  visit post_path(Post.last.id)
end

And /^I visit the course show page$/ do
  visit course_path(Course.last.id)
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
