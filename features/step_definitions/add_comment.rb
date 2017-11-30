Then(/^I want to add a comment on an exsiting event$/) do
  @event = FactoryGirl.create :event
  @comment = FactoryGirl.build :comment
end

When(/^I visit the event page$/) do
  visit events_path
end

Then(/^I should see the events announced$/) do
  expect(page).to have_css('a', text: /#{@event.title}/)
end

When(/^I click an event$/) do
  #find(".list-group-item").click
  #find_link(@event.title).click
  click_link(@event.title, match: :first)
end

Then(/^I should see the event details$/) do
  expect(page).to have_content (@event.title)
end

When(/^I fill in the comment box and submit it$/) do

  fill_in 'exampleFormControlTextarea1', with: @comment.content
  click_button 'Post'
end

Then(/^I should see the comment/) do
  expect(page).to have_content (@comment.content)
end
