Given /^the following projects:$/ do |projects|
  Project.create!(projects.hashes)
end