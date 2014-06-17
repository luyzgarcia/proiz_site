require 'test_helper'

class ContatoControllerTest < ActionController::TestCase
  test "should get getClientes" do
    get :getClientes
    assert_response :success
  end

end
