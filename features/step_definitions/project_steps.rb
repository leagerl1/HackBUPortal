Given /^the following projects:$/ do |projects|
  Project.create!(projects.hashes)
end

Given /^I have added "(.*)" as a member to the project "(.*)"$/ do |user_name, project_name|
  Project.find_by_name(project_name).users << User.find_by_name(user_name)
end