require 'test_helper'

class DailyweatherTest < ActiveSupport::TestCase
  test "test invalid with bad zipcode" do
    d = dailyweathers(:valid_dailyweather)
    d.zipcode = "00000"
    assert !d.valid?, "=> zipcode is not being validated"
  end
  test "test invalid without zipcode" do
    d = dailyweathers(:valid_dailyweather)
    d.zipcode = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:zipcode].join, "=> Presence error for zipcode not found daily weather."
  end
  test "test invalid without api source" do
    d = dailyweathers(:valid_dailyweather)
    d.apisource = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:apisource].join, "=> Presence error for api source not found for daily weather."
  end
  test "test invalid without precipitationprob" do
    d = dailyweathers(:valid_dailyweather)
    d.precipitationprob = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:precipitationprob].join, "=> Presence error for precipitationprob not found for daily weather."
  end
  # test "test invalid without precipitation_actual" do
  #   d = dailyweathers(:valid_dailyweather)
  #   d.precipitation_actual = nil
  #   d.valid?
  #   assert_match /can't be blank/, d.errors[:precipitation_actual].join, "=> Presence error for precipitation_actual not found for daily weather."
  # end
  test "test invalid without wind" do
    d = dailyweathers(:valid_dailyweather)
    d.wind = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:wind].join, "=> Presence error for wind not found for daily weather."
  end
  test "test invalid without mintemp" do
    d = dailyweathers(:valid_dailyweather)
    d.mintemp = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:mintemp].join, "=> Presence error for mintemp not found for daily weather."
  end

  test "test invalid without maxtemp" do
    d = dailyweathers(:valid_dailyweather)
    d.maxtemp = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:maxtemp].join, "=> Presence error for maxtemp not found for daily weather."
  end
  #-----------------------------------------------
  test "valid with all attributes" do
    d = dailyweathers(:valid_dailyweather)
    assert d.valid?, "=> all attributes valid but did not save"
  end
  #-----------------------------------------------
    
end
