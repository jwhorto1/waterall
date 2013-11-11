require 'test_helper'

class DailyweatheractualsControllerTest < ActionController::TestCase
  setup do
    @dailyweatheractual = dailyweatheractuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailyweatheractuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailyweatheractual" do
    assert_difference('Dailyweatheractual.count') do
      post :create, dailyweatheractual: { apicource: @dailyweatheractual.apicource, maxtemp: @dailyweatheractual.maxtemp, mintemp: @dailyweatheractual.mintemp, precipitation: @dailyweatheractual.precipitation, summary: @dailyweatheractual.summary, wind: @dailyweatheractual.wind, zipcode: @dailyweatheractual.zipcode }
    end

    assert_redirected_to dailyweatheractual_path(assigns(:dailyweatheractual))
  end

  test "should show dailyweatheractual" do
    get :show, id: @dailyweatheractual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailyweatheractual
    assert_response :success
  end

  test "should update dailyweatheractual" do
    patch :update, id: @dailyweatheractual, dailyweatheractual: { apicource: @dailyweatheractual.apicource, maxtemp: @dailyweatheractual.maxtemp, mintemp: @dailyweatheractual.mintemp, precipitation: @dailyweatheractual.precipitation, summary: @dailyweatheractual.summary, wind: @dailyweatheractual.wind, zipcode: @dailyweatheractual.zipcode }
    assert_redirected_to dailyweatheractual_path(assigns(:dailyweatheractual))
  end

  test "should destroy dailyweatheractual" do
    assert_difference('Dailyweatheractual.count', -1) do
      delete :destroy, id: @dailyweatheractual
    end

    assert_redirected_to dailyweatheractuals_path
  end
end
