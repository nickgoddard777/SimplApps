Feature: Manage mainly static pages
    In order to have static pages that are easy to updated
    As an administrator
    I want to manage pages

    Scenario: List of pages
        Given I have the following page records
        | name       | page_type | content              |
        | Home       | home      | This is the homepage |
        | About Us   | about     | We are here          |
        | Contact Us | contact   | Get in touch         |
        When I go to the list of pages
        Then I should see "Home"
        And I should see "This is the homepage"

    Scenario:  Create Valid Page
  	Given I have no pages
  	And I am on the list of pages
  	When I follow "New Page"
  	And I fill in "Name" with "Home"
  	And I fill in "Page type" with "home"
  	And I fill in "Content" with "This is the home page"
  	And I press "Create Page"
  	Then I should see "Successfully created page."
  	And I should see "This is the home page"
  	And I should have 1 page

  Scenario: Show an individual page record
  	Given I have the following page records
  	    | name       | page_type | content              |
        | Home       | home      | This is the homepage |
  	When I go to the list of pages
  	And I follow "Show"
  	Then I should see "Home"
  	And I should see "home"
  	And I should see "This is the homepage"
  	And I should see "View All"

  Scenario: Edit Valid Page
  	Given I have the following page records
  	    | name       | page_type | content              |
        | Home       | home      | This is the homepage |
  	And I am on the list of pages
  	When I follow "Edit"
  	And I fill in "Name" with "New Homepage"
  	And I fill in "Content" with "This is our new homepage"
  	And I press "Update"
  	Then I should see "Successfully updated page."
  	And I should see "New Homepage"
  	And I should see "This is our new homepage"
  	And I should see "home"

  Scenario: Delete Page
   	Given I have the following page records
      	| name       | page_type | content              |
        | Home       | home      | This is the homepage |
  	When I go to the list of pages
  	And I follow "Delete"
  	Then I should see "Successfully deleted page."
  	And I should have 0 page

