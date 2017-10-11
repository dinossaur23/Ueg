require 'test_helper'

class UevsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uev = uevs(:one)
  end

  test "should get index" do
    get uevs_url
    assert_response :success
  end

  test "should get new" do
    get new_uev_url
    assert_response :success
  end

  test "should create uev" do
    assert_difference('Uev.count') do
      post uevs_url, params: { uev: { token: @uev.token } }
    end

    assert_redirected_to uev_url(Uev.last)
  end

  test "should show uev" do
    get uev_url(@uev)
    assert_response :success
  end

  test "should get edit" do
    get edit_uev_url(@uev)
    assert_response :success
  end

  test "should update uev" do
    patch uev_url(@uev), params: { uev: { token: @uev.token } }
    assert_redirected_to uev_url(@uev)
  end

  test "should destroy uev" do
    assert_difference('Uev.count', -1) do
      delete uev_url(@uev)
    end

    assert_redirected_to uevs_url
  end
end
