Feature: Manage projects
    In order to have projects that are easy to updated
    As an administrator
    I want to manage projects

    Scenario: List of projects
        Given I have the following project records
        | name    | project_type  | client       | description       |
        | Proj 1  | Website       | Client 1     | A Test project |
        | Proj 2  | Custom Web App| Client 2     | A Test project |
        When I go to the list of projects
        Then I should see "Proj 1"
        And I should see "Website"
        And I should see "Client 2"
        And I should see "Proj 2"

    Scenario:  Create Valid project
      	Given I have no projects
      	And I am on the list of projects
      	When I follow "New project"
      	And I fill in "Name" with "Test project"
      	And I fill in "Project type" with "Website"
      	And I fill in "Client" with "Client"
      	And I fill in "Description" with "This is the test project"
      	And I press "Create"
      	Then I should see "Successfully created project."
      	And I should see "Test project"
      	And I should have 1 project

    Scenario: Show an individual project record
        Given I have the following project records
      	| name    | project_type  | client       | description       |
        | Proj 1  | Website       | Client 1     | A Test project |
      	When I go to the list of projects
      	And I follow "Show"
      	Then I should see "Proj 1"
      	And I should see "Website"
      	And I should see "Client 1"
      	And I should see "View All"


  Scenario: Edit Valid Project
  	Given I have the following project records
      	| name    | project_type  | client       | description       |
        | Proj 1  | Website       | Client 1     | A Test project |
  	When I am on the list of projects
  	And I follow "Edit"
  	And I fill in "Project type" with "New Project"
  	And I fill in "Description" with "This is a different description"
  	And I press "Update"
  	Then I should see "Successfully updated project."
  	And I should see "New Project"
  	And I should see "This is a different description"
  	And I should see "Proj 1"

  Scenario: Delete Project
   	Given I have the following project records
      	| name    | project_type  | client       | description       |
        | Proj 1  | Website       | Client 1     | A Test project |
  	When I go to the list of projects
  	And I follow "Delete"
  	Then I should see "Successfully deleted project."
  	And I should have 0 project

