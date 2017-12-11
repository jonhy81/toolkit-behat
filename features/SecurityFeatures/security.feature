Feature: User authentication
  In order to protect the integrity of the website
  As a product owner
  I want to make sure only authenticated users can access the site administration

  Scenario Outline: Anonymous user cannot access site administration
    Given I am not logged in
    When I go to "<path>"
    Then I should get an access denied error

    Examples:
      | path            |
      | admin/config    |
      | admin/structure |

  @api @javascript
  Scenario Outline: Administrators can access certain administration pages
    Given I am logged in as a user with the "administrator" role
    Then I visit "<path>"

    Examples:
      | path            |
      | admin/config    |
      | admin/structure |

  @api @javascript
  Scenario Outline: Only Administrators can access views configuration
    Given I log in as user "Test User"
    Then I visit "<path>"
    Then I should see the text "You are not authorized to access this page."

    Examples:
      | path            |
      | admin/structure/views    |
      | admin/structure/views/settings |
