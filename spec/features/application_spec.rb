require "rails_helper"

feature "Application" do
  scenario "Can do stuff" do
    visit "/"

    expect(page).to have_content "Welcome"
  end

  scenario "Anon users can visit an about page" do
    visit "/"

    expect(page).to have_link("About")

    click_link("About")

    expect(page).to have_content("About")
    expect(page).to have_content("Not much to say here.")
  end
end
