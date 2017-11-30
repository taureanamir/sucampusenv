Then(/^I want to edit an existing comment$/) do
  @event = FactoryGirl.create :event
  @comment = FactoryGirl.build :comment
end

When(/^I visit event page$/) do
  visit events_path
end


When(/^I click on an event$/) do
  #find(".list-group-item").click
  #find_link(@event.title).click
  click_link(@event.title, match: :first)
end


Then(/^I see the event details$/) do
  expect(page).to have_content (@event.title)
  fill_in 'exampleFormControlTextarea1', with: @comment.content
  click_button 'Post'
end

When(/^I click edit$/) do
  find_link("Edit").click
end

Then(/^I should see the editable text/) do
  expect(page).to have_content (@comment.content)
end

When(/^I edit comment and save changes$/) do
  fill_in ('content'), :with => 'Edited Comment'
  click_button 'Post'
end

Then(/^I should see the edited comment$/) do
  expect(page).to have_content ('Edited Comment')
end