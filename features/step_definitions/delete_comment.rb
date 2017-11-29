Then(/^I want to delete an existing comment$/) do
  @event = FactoryGirl.create :event
  @comment = FactoryGirl.build :comment
end


When(/^I click delete$/) do
  find_link("Delete").click
end

Then(/^I should not see the deleted comment$/) do
  expect(page).to have_no_content ('Edited Comment')
end