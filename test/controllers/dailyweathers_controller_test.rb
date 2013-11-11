require 'test_helper'

class DailyweathersControllerTest < ActionController::TestCase
  setup do
    @dailyweather = dailyweathers(:valid_dailyweather)
  end
  # 
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:dailyweathers)
  # end
  # 
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  # 
  # test "should create dailyweather" do
  #   assert_difference('Dailyweather.count') do
  #     post :create, dailyweather: { actual: @dailyweather.actual, apisource: @dailyweather.apisource, maxtemp: @dailyweather.maxtemp, mintemp: @dailyweather.mintemp, precipitation_actual: @dailyweather.precipitation_actual, precipitationprob: @dailyweather.precipitationprob, summary: @dailyweather.summary, wind: @dailyweather.wind, zipcode: @dailyweather.zipcode }
  #   end
  # 
  #   assert_redirected_to dailyweather_path(assigns(:dailyweather))
  # end
  # 
  # test "should show dailyweather" do
  #   get :show, id: @dailyweather
  #   assert_response :success
  # end
  # 
  # test "should get edit" do
  #   get :edit, id: @dailyweather
  #   assert_response :success
  # end
  # 
  # test "should update dailyweather" do
  #   patch :update, id: @dailyweather, dailyweather: { actual: @dailyweather.actual, apisource: @dailyweather.apisource, maxtemp: @dailyweather.maxtemp, mintemp: @dailyweather.mintemp, precipitation_actual: @dailyweather.precipitation_actual, precipitationprob: @dailyweather.precipitationprob, summary: @dailyweather.summary, wind: @dailyweather.wind, zipcode: @dailyweather.zipcode }
  #   assert_redirected_to dailyweather_path(assigns(:dailyweather))
  # end
  # 
  # test "should destroy dailyweather" do
  #   assert_difference('Dailyweather.count', -1) do
  #     delete :destroy, id: @dailyweather
  #   end
  # 
  #   assert_redirected_to dailyweathers_path
  # end
end
