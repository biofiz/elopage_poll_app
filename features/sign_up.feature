Feature: Sign up

  Scenario: Sign up successfully
    Given I open "Sign up" page
    When I sign up with "test@gmail.com" and "password"
    Then I should be signed in
