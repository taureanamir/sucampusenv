


When(/^I visit my profile page$/) do
  click_link 'My Profile'
end

Then(/^I should see a link to see my articles' status$/) do
  expect(page).to have_link ('My Articles')
end

When(/^I click the link my articles$/) do
  click_link ('My Articles')
  #save_and_open_page
end

Then(/^I should be able to see the status of article$/) do
  expect(page).to have_content ('Status')
end
