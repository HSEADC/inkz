require "test_helper"

class TattoosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tattoo = tattoos(:one)
  end

  test "should get index" do
    get tattoos_url
    assert_response :success
  end

  test "should get new" do
    get new_tattoo_url
    assert_response :success
  end

  test "should create tattoo" do
    assert_difference("Tattoo.count") do
      post tattoos_url, params: { tattoo: { master_id: @tattoo.master_id, specialization: @tattoo.specialization, title: @tattoo.title } }
    end

    assert_redirected_to tattoo_url(Tattoo.last)
  end

  test "should show tattoo" do
    get tattoo_url(@tattoo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tattoo_url(@tattoo)
    assert_response :success
  end

  test "should update tattoo" do
    patch tattoo_url(@tattoo), params: { tattoo: { master_id: @tattoo.master_id, specialization: @tattoo.specialization, title: @tattoo.title } }
    assert_redirected_to tattoo_url(@tattoo)
  end

  test "should destroy tattoo" do
    assert_difference("Tattoo.count", -1) do
      delete tattoo_url(@tattoo)
    end

    assert_redirected_to tattoos_url
  end
end
