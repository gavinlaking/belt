@file
Feature: File

  Scenario: With no file specified
    Given I run `belt` interactively
    Then I will see the following output:
    """
    Usage: belt [filename]
    """

  Scenario: With a non-existent file specified
    When I run `belt missing.bt` interactively
    Then I will see the following output:
    """
    File not found: 'missing.bt'
    """

  Scenario: With an empty file specified
    Given a file named "empty.bt" with:
    """
    """
    When I run `belt empty.bt` interactively
    Then I will see the following output:
    """
    Nothing to do: 'empty.bt'
    """
