@read
Feature: Read

  Scenario: With no instructions
    Given a file named "empty.bt" with:
    """
    """
    When I run `belt empty.bt` interactively
    Then I will see the following output:
    """
    Nothing to do: 'empty.bt'
    """

  Scenario: Instruction: 'halt'
    Given a file named "halt.bt" with:
    """
    halt
    """
    When I run `belt halt.bt` interactively
    Then I will see the following output:
    """
    Halted: 'halt.bt'
    """

  Scenario: Instruction: 'noop'
    Given a file named "noop.bt" with:
    """
    noop
    halt
    """
    When I run `belt noop.bt` interactively
    Then I will see the following output:
    """
    noop
    Halted: 'noop.bt'
    """

  Scenario: Instruction: 'beep'
    Given a file named "beep.bt" with:
    """
    beep
    halt
    """
    When I run `belt beep.bt` interactively
    Then I will see the following output:
    """
    beep
    Halted: 'beep.bt'
    """
