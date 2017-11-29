Given(/^I am a user who wants to register in the app$/) do
  @user = FactoryGirl.build :user
end

When(/^I visit the root page$/) do
  visit sucampusenv_home_path
end

Then(/^I should see a link to register$/) do
  expect(page).to have_link('Register')
end

And(/^I submit the form$/) do
  find_link('Register').click
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  fill_in 'First name', with: @user.first_name
  fill_in 'Last name', with: @user.last_name
  fill_in 'Password confirmation', with: @user.password_confirmation
  click_button 'Sign up'
end

Then(/^I should see my profile page$/) do
  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_link('Edit Profile')
end

# ----------------------------------------------------------------------------------------

When(/^I visit my profile$/) do
  click_link 'My Profile'
end

Then(/^I should see a link to edit profile$/) do
  expect(page).to have_link('Edit Profile')
end

When(/^I change my details and I submit the form$/) do
  click_link 'Edit Profile'
  fill_in ('First name'), :with => 'Thierry'
  fill_in ('Last name'), :with => 'Henry'
  fill_in ('Current password'), :with => 'password'
  fill_in ('Fos'), :with => 'CSIM'
  click_button 'Update'
end

Then(/^I should see my edited profile$/) do
  expect(page).to have_content('Your account has been updated successfully.')
  click_link 'My Profile'
  expect(page).to have_content('Name: Thierry Henry')
  expect(page).to have_content('Field of Study: CSIM')
end


