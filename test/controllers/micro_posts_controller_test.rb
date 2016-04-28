require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase

  def setup
    @micropost = microposts(:orange)
  end

  test "should redirect on create when not logged in" do 
    assert_no_difference 'Micropost.count' do 
      post :create, micropost: { content: 'Lorem ipsum' }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end

  test "should redirect on destroy when not logged in" do 
    assert_no_difference 'Micropost.count' do 
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end

  test "should redirect on destroy for wrong micropost" do 
    log_in_as(users(:james))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do 
      delete :destroy, id: micropost
    end
    assert_redirected_to root_url
  end  
end