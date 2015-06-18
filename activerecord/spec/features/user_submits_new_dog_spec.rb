require "spec_helper"
require_relative "../../models/owner"
require_relative "../../models/dog"

feature "User submits new dog" do
  scenario "user successfully fills out form" do
    Owner.create!(name: "Christina")

    visit "/dogs/new"

    fill_in "name", with: "Fido"
    fill_in "age", with: "5"
    select "Christina", from: "owner"
    click_on "Submit"

    expect(page).to have_content("Fido")
  end

end
