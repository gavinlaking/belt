# frozen_string_literal: true

Then(/^I will see the following output:$/) do |string|
  expect(last_command_started).to have_output(string)
end
