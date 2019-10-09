require 'test_helper'

class AnnualEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annual_event = annual_events(:one)
  end

  test "should get index" do
    get annual_events_url
    assert_response :success
  end

  test "should get new" do
    get new_annual_event_url
    assert_response :success
  end

  test "should create annual_event" do
    assert_difference('AnnualEvent.count') do
      post annual_events_url, params: { annual_event: { filename: @annual_event.filename } }
    end

    assert_redirected_to annual_event_url(AnnualEvent.last)
  end

  test "should show annual_event" do
    get annual_event_url(@annual_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_annual_event_url(@annual_event)
    assert_response :success
  end

  test "should update annual_event" do
    patch annual_event_url(@annual_event), params: { annual_event: { filename: @annual_event.filename } }
    assert_redirected_to annual_event_url(@annual_event)
  end

  test "should destroy annual_event" do
    assert_difference('AnnualEvent.count', -1) do
      delete annual_event_url(@annual_event)
    end

    assert_redirected_to annual_events_url
  end
end
