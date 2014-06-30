require 'test_helper'

class DefineIdiomaControllerTest < ActionController::TestCase
  test "should get portugues" do
    get :portugues
    assert_response :success
  end

  test "should get ingles" do
    get :ingles
    assert_response :success
  end

end
