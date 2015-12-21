Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

Given /^I am a new authenticated user$/ do
  email = 'email1@test.com'
  password = 'password1'
  User.create(:email => email, :password => password, :name => 'name1', :last_name => 'last_name1', :password_confirmation => password)
  visit 'users/sign_in'
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button "Log in"
  
end

When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following users:$/ do |expected_users_table|
  expected_users_table.diff!(tableish('table tr', 'td,th'))
end

Given(/^"(.*?)" is connected to "(.*?)"$/) do |user_email, project_name|
  Project.find_by_name(project_name).users << User.find_by_email(user_email)
end