Feature: Edit project
  As a user with a created project
  So that I can keep my project up to date
  I want to edit attributes of my project
  
  Background: a user has been added to the database and logged in
    Given I am a new authenticated user
    
  Scenario: Edit an existing project's fields
    Given the following projects:
      |name|description|
      |ProjectTest|This project tests the fields|
    And I am on "ProjectTest"'s edit page
    When I fill in the following:
      | Name        | ProjectTest |
      | Description | This project tests the fields yet again |
      | Repo        | https://github.com/leagerl1/HackBUPortal |
    And I press "Update"
    Then I should be on "ProjectTest"'s project page
    And I should see "Project was successfully updated"
    
  Scenario: Information about a particular project is displayed correctly
    Given the following projects:
      | name         | description      | repo           |
      | Project Test | Test description | www.myrepo.com |
    And the following users:
      | email            | password  | name  | last_name  |
      | email2@test.com  | password1 | name1 | last_name1 |
    And I have added "name1" as a member to the project "Project Test"      
    And I am on "Project Test"'s project page
    Then I should see "Project Test"
    And I should see "Test description"
    And I should see "www.myrepo.com"
    And I should see "name1"
    And I should see "last_name1"
    
     
    