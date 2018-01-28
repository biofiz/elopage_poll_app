Given("I open {string} page") do |page|
  case page
  when 'Sign up'
    visit new_user_registration_path
  when 'Create new poll'
    visit new_poll_path
  else
    visit root_path
  end
end
