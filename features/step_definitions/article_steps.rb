Given(/^I am a user$/) do
  @user = FactoryGirl.create :member
end

Given(/^I am signed in$/) do
  visit sucampusenv_home_path
  find_link('Login').click
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Then(/^I want to add an article$/) do
  @article = FactoryGirl.build :article
end

When(/^I visit the article page$/) do
  visit articles_path
end

Then(/^I should see a link to submit an article$/) do
  expect(page).to have_link('Submit Article')
end

Then(/^I should see a list of articles if exists$/) do
  expect(page).to have_content ("News")
end

When(/^I click the submit article link$/) do
  find_link('Submit Article').click
end

Then(/^I should be able to fill in the title and content$/) do
  expect(page).to have_content('Title')
  expect(page).to have_content('Content')
  fill_in 'Title', with: @article.title
  fill_in 'content', with: @article.content
end

When(/^I submit the article$/) do
  click_button 'Submit'
end

Then(/^I should see a confirmation for submission\.$/) do
  expect(page).to have_content('Your article has been submitted for review !!!')
end

# --------------------------------------------------------------------


Given(/^I submit an article$/) do
  @article = FactoryGirl.build :article
  visit articles_path
  find_link('Submit Article').click
  fill_in 'Title', with: @article.title
  fill_in 'content', with: @article.content
  click_button 'Submit'
end

When(/^I visit my articles page$/) do
  visit sucampusenv_my_articles_path
end

Then(/^I should see the status of my article$/) do
  expect(page).to have_content('Status')
  expect(page).to have_content('Being Reviewed')
end

#--------------------------------------------------------------------------------
When(/^I go to the list of all articles page$/) do
  @article = FactoryGirl.build :article
  visit articles_path
  find_link('Submit Article').click
  fill_in 'Title', with: @article.title
  fill_in 'content', with: @article.content
  click_button 'Submit'
  visit sucampusenv_articles_list_path
end

Then(/^I should see all the articles submitted by the users$/) do
  expect(page).to have_content('All Articles')
  expect(page).to have_content('Title')
  expect(page).to have_content('Status')
  expect(page).to have_content('Uploaded Date')
  expect(page).to have_content('Approve/Reject')
  expect(page).to have_content('Published ?')

end

When(/^I review an article$/) do
  find_link(@article.title).click
end

Then(/^I should be able to approve or reject it$/) do
  visit sucampusenv_articles_list_path
  find_link('Approve').click
end

When(/^I click approve I should be able to get the approval notice$/) do
  expect(page).to have_content('Article approved !!!')
end

When(/^when I click reject I should be able to get the reject notice$/) do
  visit sucampusenv_articles_list_path
  find_link('Reject').click
  expect(page).to have_content('Article rejected !!!')
end

