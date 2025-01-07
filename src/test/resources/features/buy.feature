Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Butter" with price 120.00 and stock of 15 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00
    Then a product "Bread" should have stock of 3

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00
    Then a product "Bread" should have stock of 3
    Then a product "Jam" should have stock of 9

Scenario Outline: Buy one product
    When I buy <product> with quantity <quantity>
    Then total should be <total>
    Then a product <product> should have stock of <stock_left>
    Examples:
        | product  | quantity |  total  | stock_left |
        | "Bread"  |     1    |   20.50 |      4     |
        | "Jam"    |     2    |  160.00 |      8     |
        | "Butter" |     3    |  360.00 |      12    |

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "Butter" with quantity 1
    Then total should be 241.00
    Then a product "Bread" should have stock of 3
    Then a product "Jam" should have stock of 9
    Then a product "Butter" should have stock of 14