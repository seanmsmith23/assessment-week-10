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

  scenario "Anon user can create a gif" do
    visit "/"

    expect(page).to have_link "New gif"

    click_link "New gif"

    expect(page).to have_content("New gif")
    expect(page).to have_content("URL")
    expect(page).to have_content("Title")
    expect(page).to have_button("Create gif")

    fill_in "URL", with: "http://www.somegif.com"
    fill_in "Title", with: "Some gif"
    click_button "Create gif"

    expect(page).to have_content "Some gif"
    expect(page.find('.gif')['src']).to have_content("http://www.somegif.com")
    expect(page).to have_content "gif created successfully"
  end

  scenario "User cannot create gif without a url or title" do
    visit "/"

    click_link "New gif"

    click_button "Create gif"

    expect(page).to have_content "Url can't be blank"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_button("Create gif")
  end

  scenario "fancy errors" do
    visit "/"

    click_link "New gif"

    click_button "Create gif"

    expect(page.find('.error-message:nth-of-type(1)')).to have_content("can't be blank")
    expect(page.find('.error-message:nth-of-type(2)')).to have_content("can't be blank")
  end
end
