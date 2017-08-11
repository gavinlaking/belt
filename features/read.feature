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
    Halted.
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
    Halted.
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
    Halted.
    """

  Scenario: Instruction: 'inc'
    Given a file named "inc.bt" with:
    """
    incr
    incr
    incr
    halt
    """
    When I run `belt inc.bt` interactively
    Then I will see the following output:
    """
    1
    2
    3
    Halted.
    """

  Scenario: Instruction: 'dec'
    Given a file named "dec.bt" with:
    """
    incr
    incr
    decr
    halt
    """
    When I run `belt dec.bt` interactively
    Then I will see the following output:
    """
    1
    2
    1
    Halted.
    """
