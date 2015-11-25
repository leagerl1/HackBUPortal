Given /^the following projects:$/ do |projects|
  Project.create!(projects.hashes)
end

When /^ I add (*.) as a member to the project (.*)$/ do |user_name, project_name|
    Project.find_by_name(project_name) << User.find_by_name(user_name)
end