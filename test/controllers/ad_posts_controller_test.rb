require "test_helper"

class AdPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ad_post = ad_posts(:one)
  end

  test "should get index" do
    get ad_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_ad_post_url
    assert_response :success
  end

  test "should create ad_post" do
    assert_difference('AdPost.count') do
      post ad_posts_url, params: { ad_post: { description: @ad_post.description, title: @ad_post.title } }
    end

    assert_redirected_to ad_post_url(AdPost.last)
  end

  test "should show ad_post" do
    get ad_post_url(@ad_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_ad_post_url(@ad_post)
    assert_response :success
  end

  test "should update ad_post" do
    patch ad_post_url(@ad_post), params: { ad_post: { description: @ad_post.description, title: @ad_post.title } }
    assert_redirected_to ad_post_url(@ad_post)
  end

  test "should destroy ad_post" do
    assert_difference('AdPost.count', -1) do
      delete ad_post_url(@ad_post)
    end

    assert_redirected_to ad_posts_url
  end
end
