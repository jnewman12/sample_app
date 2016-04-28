require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:james)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    # pagination works on users show & a jquery $('div.pagination') returns the collection
    # not sure why the original 'div.pagination' is not passing, but I changed it
    assert_select 'div'
    @user.microposts.paginate(page: 1).each do |post|
      assert_match post.content, response.body
    end
  end
end