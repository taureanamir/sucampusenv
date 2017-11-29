Given(/^I am an admin$/) do
  @user = FactoryGirl.create :adminuser
end

Then(/^I should see admin dashboard$/) do
  expect(page).to have_content('Admin Dashboard')
  expect(page).to have_content('User Details')
  #save_and_open_page
end
#-------------------------------------------------------------------------------------

When(/^I click add new event$/) do
  find_link('Add New Event', href: new_event_path(@event)).click
end

Then(/^I should the form for event$/) do
  expect(page).to have_selector('form#new_event')
end

Then(/^I should fill the details for the event$/) do
  @event = FactoryGirl.build :new_event
  fill_in 'Title', with: @event.title
  fill_in 'Description', with: @event.description
  fill_in 'Event Date', with: @event.event_date
  fill_in 'Event Time', with: @event.event_time
  fill_in 'Contact Number', with: @event.contact
  fill_in 'Venue', with: @event.venue
  check('event_is_publised')
end

When(/^I submit the form for$/) do
  click_button 'Add'
end

Then(/^I should be able see the new event details$/) do
  expect(page).to have_content (@event.title)

end
#-----------------------------------------------------------------------------------

When(/^I click edit event$/) do
  @event = FactoryGirl.create :new_event
  find_link('Edit Events').click
end

Then(/^I should see list of events$/) do
  expect(page).to have_content ("Events List")
end

When(/^I click the event$/) do
  find(".list-group-item").click
end

Then(/^I should see edit button$/) do
 find_link('Edit')
end

When(/^I click the edit button$/) do
  find_link('Edit').click
end

Then(/^I should be able to edit the event$/) do
  fill_in ('Event Time'), :with => '9:00 AM'
end

When(/^I click update$/) do
  click_button 'Update'
end

Then(/^I should see the edited event details$/) do
  expect(page).to have_content ('9:00 AM')
  #save_and_open_page
end

#---------------------------------------------------------------------------------------

Then(/^I want see the event list$/) do
  @event = FactoryGirl.create :new_event
  visit events_path
end

When(/^I click on an event that i want to delete$/) do
  find(".list-group-item").click
end

Then(/^I see the event information$/) do
  expect(page).to have_content (@event.title)
end

When(/^I click delete button$/) do
  find_link('Delete').click
end

Then(/^I should not see the deleted event$/) do
  visit events_path
  #save_and_open_page
end
#-------------------------------------------------------------------------------------------

When(/^I click user details$/) do
  @user2 = FactoryGirl.create :member2
  @user = FactoryGirl.create :member
  find_link('User Details').click
  #save_and_open_page
end

Then(/^I should see a list of users$/) do
  expect(page).to have_content ('All Users')
end

When(/^I click ban a user$/) do
  click_link("Ban", match: :first)
  #save_and_open_page
end

Then(/^I should see the status of ban user$/) do
  expect(page).to have_link ('UnBan')
end

When(/^I click unban status of the user$/) do
  click_link("UnBan", match: :first)
end

Then(/^I shoud be able to see the user status changed$/) do
  expect(page).to have_link ('Ban')
end

#-----------------------------------------------------------------------------------------------

Then(/^I should be able to see a recently registered and singed in users$/) do
  expect(page).to have_content ('Recently Registered Users')
end
