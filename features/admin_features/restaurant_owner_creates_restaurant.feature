Feature: Admin can edits a restaurant
  As an Admin
  In order to update a restaurant
  I  would like to be able to edit the restaurant

  Background:
    Given An admin exists "mythai_owner@example.com" with "password" and super_admin "false"
    Given An admin exists "mymex_owner@example.com" with "password" and super_admin "false"
    Given the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name | restaurant_owner         |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     | mythai_owner@example.com |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Lunch     | mymex_owner@example.com  |
    And I am logged in to AA as "mythai_owner@example.com"
    And I go to the dashboard

  Scenario: Admin updates restaurant
    Given I click "Restaurants"
    When I click "Edit" for "My Thai" restaurant
    And I fill in "Name" with "The Old Thai Restaurant"
    And I fill in "Address" with "Street 78"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Mexican" from restaurant category dropdown
    When I click "Update Restaurant"
    Then I should see "Restaurant was successfully updated."

  Scenario: Admin deletes restaurant
    Given I click "Restaurants"
    When I click "Delete" for "My Thai" restaurant
    #And I click ok on alert box
    Then I should see "Restaurant was successfully destroyed."
