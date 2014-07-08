Feature: Manage events
  In order to run a competition
  As an organizer
  I want to record scores and display and archive a scoreboard

  Background:
    Given the following admins exist
    | email                 | password       |
    | admin@eulersprint.org | secretpassword |
    Given the following events exist
    | name          |
    | Example event |
    And the following teams exist
    | name   | event         |
    | Team 1 | Example event |
    | Team 2 | Example event |
    And the following submissions exist
    | team   | problem |
    | Team 1 | 1       |
    | Team 1 | 10      |
    | Team 2 | 2       |
    | Team 2 | 200     |

  Scenario: A user should be able to view a list of events
    Given I am not signed in as an admin
    When I go to the Events page
    Then I should see "Example event"

  Scenario: A user should be able to view the scoreboard of an event
    Given I am not signed in as an admin
    When I go to the Events page
    And I follow "Example event"
    Then I should see "Team name"
    And I should see "Score"

  Scenario: A non-admin should not be able to create an event
    Given I am not signed in as an admin
    When I go to the Events page
    Then I should not see "<Admin: New Event>"

  Scenario: A non-admin should not be able to manage an event
    Given I am not signed in as an admin
    When I go to the Events page
    And I follow "Example event"
    Then I should not see "Manage Event"

  Scenario: An admin should be able to create an event
    Given I am signed in as an admin
    When I go to the Events page
    And I follow "<Admin: New Event>"
    And I fill in the new event field with "Testing creation of event"
    And I submit the new event form
    Then I should see the new team field

  Scenario: An admin should be able to manage an existing event
    Given I am signed in as an admin
    When I go the the Events page
    And I follow "Example event"
    Then I should see the new team field

  Scenario: An admin should be able to change the name of an event
    Given I am signed in as an admin
    When I go the the Events page
    And I follow "Example event"
    And I follow "Manage event"
    And I follow "Example event"
    And I fill in the event field with "Edited event"
    And I submit the event form
    Then I should see "Edited event"

  Scenario: An admin should be able to delete an event
    Given I am signed in as an admin
    When I go the the Events page
    And I follow "Example event"
    And I follow "Manage event"
    And I follow "Example event"
    And I fill in the event field with "delete"
    And I submit the event form
    Then I should be on the Events page
    And I should not see "Example event"
    And I should not see "delete"

  Scenario: An admin should be able to add a team to an event

  Scenario: An admin should be able to change the name of a team

  Scenario: An admin should be able to delete a team

  Scenario: An admin should be able to record a score for a team

  Scenario: An admin should be able to change a recorded score

  Scenario: An admin should be able to delete a recorded score
