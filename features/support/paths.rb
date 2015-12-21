# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    
    when /^the login page$/
      new_user_session_path
    
    when /the new user page/
      new_user_registration_path
    
    when /the user's profile page/
      '/users/1'
      
    when /the project feed page/
      projects_path
      
    when /^the new project page$/
      new_project_path
      
    when /^the edit profile page$/
      edit_user_path(User.find_by_email("email1@test.com").id)
      
    when /^"(.*)"'s edit page$/
      edit_project_path(Project.find_by_name($1))
      
    when /^"(.*)"'s project page$/
      project_path(Project.find_by_name($1))
    

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
