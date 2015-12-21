Feature: Post project
  As a user with a project to work on
  So that I can get feedback on my project and build a team
  I want to post a project
  
  Background: a user has been added to the database and logged in
    Given I am a new authenticated user
   
  Scenario: Post a project with all fields filled in
    Given I am on the new project page
    When I fill in the following:
      | Name        | Project Test |
      | Description | This project tests the fields |
      | Repo        | https://github.com/leagerl1/HackBUPortal |
    And I press "Create"
    Then I should be on "Project Test"'s edit page
    And I should see "Project was successfully created"
    
    
  Scenario: Post a project with only required fields filled in
    Given I am on the new project page
    When I fill in the following:
      | Name         | Project Test |
      | Description  | This project tests the fields |
    And I press "Create"
    Then I should be on "Project Test"'s edit page
    And I should see "Project was successfully created"
    
  Scenario: Project creation fails because of missing name
    Given I am on the new project page
    When I fill in "Description" with "This project tests the fields"
    And I press "Create"
    Then the "Name" field should have the error "can't be blank"
   
  Scenario: Project creation fails because of missing description
    Given I am on the new project page
    When I fill in "Name" with "Project Test"
    And I press "Create"
    Then the "Description" field should have the error "can't be blank"
    
  Scenario: Project creation fails because of duplicate name
    Given the following projects:
      | name         | description  |
      | Project Test | Test project |
    And I am on the new project page
    When I fill in the following:
      | Name         | Project Test |
      | Description  | This project tests the fields |
    And I press "Create"
    Then the "Name" field should have the error "has already been taken"