Feature: SignUp


  Background:
    Given User is on the sign up page


  Scenario: Try to signup with empty form

    Given the user clicks on sign up link
    When the user clicks the Create My Account button
    Then error message should appear



  Scenario: Sign up with valid credentials.
    When User enters valid inputs
    Then User should be able to sign up.


  @wip
  Scenario Outline: User should not be allowed to sign up with blank required inputs
    When the user leaves blank user information "<firstName>" "<lastName>""<linkedin>""<email>""<password>""<confirmPassword>""<gdpr>"
    Then error message should appear
    Examples:
      | firstName | lastName   |linkedin                          |email          |password     |confirmPassword    |gdpr   |
      |           |TestLastName|https://www.linkedin.com/in/test  |name@gmail.com |Test123456!  |Test123456!        |true   |
      |Testname   |            |https://www.linkedin.com/in/test  |name@gmail.com |Test123456!  |Test123456!        |true   |
      |Testname   |TestLastName|                                  |name@gmail.com |Test123456!  |Test123456!        |true   |
      |Testname   |TestLastName|https://www.linkedin.com/in/test  |               |Test123456!  |Test123456!        |true   |
      |Testname   |TestLastName|https://www.linkedin.com/in/test  |name@gmail.com |             |Test123456!        |true   |
      |Testname   |TestLastName|https://www.linkedin.com/in/test  |name@gmail.com |Test123456!  |                   |true   |
      |Testname   |TestLastName|https://www.linkedin.com/in/test  |name@gmail.com |Test123456!  |Test123456!        |false  |



  Scenario Outline: User should not be allowed to sign up with invalid email inputs

    When the user enters invalid "<email>" inputs
    Then correct error message should be displayed

    Examples:
    |email              |
    |without @          |
    |one letter only    |
    |special characters |
    |upper limit check  |
    |numeric            |
    |alphanumeric       |
    |emoji              |


