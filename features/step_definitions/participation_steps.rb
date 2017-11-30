When(/^I visit the participants list page$/) do
  @event = FactoryGirl.build :new_event
  find_link('Add New Event', href: new_event_path(@event)).click
  fill_in 'Title', with: @event.title
  fill_in 'Description', with: @event.description
  fill_in 'Event Date', with: @event.event_date
  fill_in 'Event Time', with: @event.event_time
  fill_in 'Contact Number', with: @event.contact
  fill_in 'Venue', with: @event.venue
  check('event_is_publised')
  click_button 'Add'
  visit events_path
  #save_and_open_page
  #find(".list-group-item").click
  click_link(@event.title, match: :first)
  #save_and_open_page
  click_link 'Register'
  fill_in ('First Name'), :with => 'Thierry'
  fill_in ('Last Name'), :with => 'Henry'
  fill_in ('FOS'), :with => 'CSIM'
  click_button 'Register'
  find_link('My Profile').click
  find_link('Participants List').click
end

Then(/^I select an event from the dropdown$/) do
  select "Discussion board on clean envirnoment", :from => "event"
end

When(/^I click go$/) do
  click_button 'Go'
end

Then(/^I should see the list of participants$/) do
  expect(page).to have_content(@user.first_name)
  expect(page).to have_content(@user.last_name)
  expect(page).to have_content(@event.event_date)
end
