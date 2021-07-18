require "application_system_test_case"

class AdPostsTest < ApplicationSystemTestCase
  setup do
    @ad_post = ad_posts(:one)
  end

  test "visiting the index" do
    visit ad_posts_url
    assert_selector "h1", text: "Ad Posts"
  end

  test "creating a Ad post" do
    visit ad_posts_url
    click_on "New Ad Post"

    fill_in "Description", with: @ad_post.description
    fill_in "Title", with: @ad_post.title
    click_on "Create Ad post"

    assert_text "Ad post was successfully created"
    click_on "Back"
  end

  test "updating a Ad post" do
    visit ad_posts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @ad_post.description
    fill_in "Title", with: @ad_post.title
    click_on "Update Ad post"

    assert_text "Ad post was successfully updated"
    click_on "Back"
  end

  test "destroying a Ad post" do
    visit ad_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ad post was successfully destroyed"
  end
end
