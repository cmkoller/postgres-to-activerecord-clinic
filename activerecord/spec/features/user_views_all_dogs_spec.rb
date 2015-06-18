require "spec_helper"
require_relative "../../models/owner"
require_relative "../../models/dog"

feature "User views all dogs", %(
  As a User
  I want to view all the dogs in the park
  So that I know who's out to play with today

  Acceptance Criteria:
  [ ] When I visit "/dogs", I can see a list of all dogs
) do

  scenario "user views dogs" do
    Dog.create!(name: "Fido", age: 7)

    visit "/dogs"

    expect(page).to have_content("Fido")
  end

end
