Feature: Register user
  As a prospective user
  So that I can use the app's features
  I want to create a profile
  
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
    
  Scenario: Log a user in
    Given the following users:
      |email|password|name|last_name|
      |test@email.com|password123|Lucas|Eager Leavitt|
    And I am on the login page
    When I fill in "Email" with "test@email.com"
    And I fill in "Password" with "password123"
    And I press "Log in"
    Then I should be on the project feed page
    And I should see "Signed in successfully."
    
  Scenario: Log a user out
    Given I am a new authenticated user
    And I am on the home page
    When I follow "Log out"
    Then I should be on the login page
    And I should see "You need to sign in or sign up before continuing."
    
  Scenario: Go to user's profile
    Given I am a new authenticated user
    And I am on the home page
    When I follow "Profile"
    Then I should be on the user's profile page

