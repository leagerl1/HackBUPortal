Feature: Edit user profile
  As a user with a created profile
  So that I can keep my profile up to date
  I want to edit attributes of my profile
  
  Background: a user has been added to the database and logged in
    Given I am a new authenticated user
    
  Scenario: Edit an existing user's profile
    Given I am on the edit profile page
    When I fill in the following:
      | Name        | Alex |
      | Last name | Terela |
    And I press "Update User"
    Then I should be on the user's profile page
    And I should see "User was successfully updated"
    And I should see "Alex Terela"
    
  