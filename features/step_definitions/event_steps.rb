Then(/^I click on event I want to register$/) do
  @event = FactoryGirl.create :event
  visit events_path
  #find(".list-group-item").click
  click_link(@event.title, match: :first)
end

When(/^I click Register$/) do
  click_link 'Register'
end

And(/^I enter my details$/) do
  fill_in ('First Name'), :with => 'Thierry'
  fill_in ('Last Name'), :with => 'Henry'
  fill_in ('FOS'), :with => 'CSIM'
  click_button 'Register'
end


Then(/^I should see a confirmation for registration\.$/) do
    expect(page).to have_content ('You have been registered !!!')
end
