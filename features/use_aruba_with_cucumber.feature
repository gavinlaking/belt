Feature: Using aruba with cucumber

Scenario: First run
  Given a file named "file.txt" with:
  """
  Hello World
  """
  Then the file "file.txt" should contain:
  """
  Hello World
  """
