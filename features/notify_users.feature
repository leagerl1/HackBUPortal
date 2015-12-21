Feature: notify users of requests
  In order to send other users requests to join a project
  As a project owner or potential project member
  I want to ask to join a project
  
  Background: a user has been added to the database and logged in and projects and users exist with correct associations
    Given I am a new authenticated user
    And the following projects:
      | name         | description  | owner_id |
      | Project Test | Test project | 1     |
    And the following users:
      |email|password|name|last_name|
      |test@email.com|password123|Lucas|Eager Leavitt|
    And "test@email.com" is connected to "Project Test"
  
      Scenario: A project owner asks a user to join their project
        Given I am on the project feed page
        When I follow "request-user"
        Then I should be on the project feed page
        And I should see "Request sent"
        
      Scenario: A community member asks to join a project
        Given I am on the project feed page
        When I follow "Request to Join"
        Then I should be on the project feed page
        And I should see "Request sent"