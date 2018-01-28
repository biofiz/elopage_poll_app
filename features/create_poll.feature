@logged_in
Feature: Create new poll

  Scenario: Create new poll successfully
    Given I open "Create new poll" page
    When I create new poll with title "Do you like beer?" and answers "Yes" and "No"
    Then New poll should be created with title "Do you like beer?"
