When("I sign up with {string} and {string}") do |email, password|
  find('#user_email').set email
  find('#user_password').set password
  find('#user_password_confirmation').set password
  click_button 'Sign up'
end

Then("I should be signed in") do
  expect(page.current_path).to eq root_path
  expect(page).to have_css('h1', text: 'All polls')
end
