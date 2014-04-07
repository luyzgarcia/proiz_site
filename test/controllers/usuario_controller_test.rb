require 'test_helper'

class UsuarioControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get logar" do
    get :logar
    assert_response :success
  end

end
