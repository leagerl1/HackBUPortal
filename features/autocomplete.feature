Feature: autocomplete search skills
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  Background: a user has been added to the database and logged in
    Given I am a new authenticated user
  
  @javascript
  Scenario: Autocomplete search on projects feed
    Given the following skills:
        |name|
        |Ruby|
        |C|
        |Python|
        |Java|
    And I go to the home page
    And I fill in "skills_search" with "ru"
    And I choose "Ruby" in the autocomplete list
    Then the "skills_search" field should contain "Ruby"
  
