Feature: View project feed
  As a user 
  So that I can view and find all available projects to work on
  I want to see a feed of all porjects on the hackBU portal
  
  Background: a user has been added to the database and logged in and projects exist to view
    Given I am a new authenticated user
    And the following projects:
        | name         | description  |
        | Project Test | Test project |
        | Project 2     | Description 2|
    
    Scenario: See the project feed
      Given I am on the project feed page
      Then I should see "Project Test"
      And I should see "Project 2"
    