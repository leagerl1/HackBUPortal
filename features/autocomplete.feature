Feature: autocomplete search skills
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Autocomplete
    Given the following skills:
        |name|
        |Ruby|
        |C|
        |Python|
        |Java|
    And I go to the home page
    And I fill in "Skills" with "ruby"
    And I choose "ruby" in the autocomplete list
    Then the "Skills" field should contain "Ruby"
    