Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Email" with "email1@test.com"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I fill in "Name" with "name1"
    And I fill in "Last name" with "last_name1"
    And I press "Sign up"
    Then I should be on the project feed page
    And I should see "Welcome! You have signed up successfully."
    
  Scenario: Registering fails because of missing field
    Given I am on the new user page
    When I fill in "Email" with "email1@test.com"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I fill in "Name" with "name1"
    And I press "Sign up"
    Then the "Last name" field should have the error "can't be blank"

#  Scenario: Delete user
#    Given the following users:
#      |email|password|name|last_name|
#      |email 1|password 1|name 1|last_name 1|
#      |email 2|password 2|name 2|last_name 2|
#      |email 3|password 3|name 3|last_name 3|
#      |email 4|password 4|name 4|last_name 4|
#    When I delete the 3rd user
#    Then I should see the following users:
#      |Email|Password|Name|Last name|
#      |email 1|password 1|name 1|last_name 1|
#      |email 2|password 2|name 2|last_name 2|
#      |email 4|password 4|name 4|last_name 4|
