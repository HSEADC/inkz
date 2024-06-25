require "test_helper"

class MastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master = masters(:one)
  end

  test "should get index" do
    get masters_url
    assert_response :success
  end

  test "should get new" do
    get new_master_url
    assert_response :success
  end

  test "should create master" do
    assert_difference("Master.count") do
      post masters_url, params: { master: { name: @master.name, nickname: @master.nickname } }
    end

    assert_redirected_to master_url(Master.last)
  end

  test "should show master" do
    get master_url(@master)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_url(@master)
    assert_response :success
  end

  test "should update master" do
    patch master_url(@master), params: { master: { name: @master.name, nickname: @master.nickname } }
    assert_redirected_to master_url(@master)
  end

  test "should destroy master" do
    assert_difference("Master.count", -1) do
      delete master_url(@master)
    end

    assert_redirected_to masters_url
  end
end
