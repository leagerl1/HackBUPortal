Feature: Post project
  As a user with a project to work on
  So that I can get feedback on my project and build a team
  I want to post a project
  
  Background: a user has been added to the database and logged in
    Given I am a new authenticated user
   
  Scenario: Post a project with all valid fields filled in
    Given I am on the new project page
    When I fill in the following:
      | Name        | Project Test |
      | Description | This project tests the fields |
    And I press "Create"
    Then I should be on "Project Test"'s edit page
    And I should see "Project was successfully created"
    
  Scenario: Project creation fails because of missing name
    Given I am on the new project page
    When I fill in "Description" with "This project tests the fields"
    And I press "Create"
    Then I should see "APPLE"
    
    
  
    
    