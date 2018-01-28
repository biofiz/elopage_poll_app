Before('@logged_in') do |scenario, block|
  user = FactoryBot.create(:user)
  login_as(user, scope: :user)
end

When("I create new poll with title {string} and answers {string} and {string}") do |title, option1, option2|
  find('#poll_title').set title
  find('#poll_answer_options_answer0').set option1
  find('#poll_answer_options_answer1').set option2
  click_button 'Save'
end

Then("New poll should be created with title {string}") do |title|
  within '.jumbotron' do
    expect(page).to have_css('h2', text: title)
  end
end
