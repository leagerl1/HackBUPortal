Given /^the following skills:$/ do |skills|
  Skill.create!(skills.hashes)
end