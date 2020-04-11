//
//  WeatherDataValues.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 5/15/19.
//  Copyright © 2019 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import ForecastIO

var weatherLoaded: Bool = false
var distanceChange: Bool = false

// MARK: - Default values
var defaultInteger: Double = 0
var defaultString = "Oops! No summary found."

// MARK: - Location values
var selectedLocation: String = ""
var userDeniedLocation: Bool = false

var latitudeValue: Double = 0
var longitudeValue: Double = 0
var selectedLatitudeValue: Double = 0
var selectedLongitudeValue: Double = 0
var savedSelectedLatitudeValue: Double = 0
var savedSelectedLongitudeValue: Double = 0

var userSelectedSavedLocation: Bool = false
var userCurrentLocation: String = ""

var city: String = ""
var state: String = ""
var country: String = ""

// MARK: - Alert value
var alertCount: Int = 0
var alertTitle: String = ""
var alertBody: String = ""
var alertURI: String = ""

// MARK: - Units values
var unitsPrecipitation: String = ""
var unitsTemperature: String = ""
var unitsWindSpeed: String = ""
var unitsDistance: String = ""
var unitsPressure: String = ""

var weatherUnitsUSA: Bool = false
var weatherUnitsUK: Bool = false
var weatherUnitsCanada: Bool = false
var weatherUnitsInternational: Bool = false

// All weather values
// MARK: - Current weather values
var currentTemperature: Int = 0
var currentCondition: String = ""
var apparentTemperature: Int = 0
var currentSummary: String = ""
var fullSummary: String = ""
var hourSummary: String = ""
var nextHourCondition: String = ""
var minuteSummary: String = ""
var endingMinuteSummary: String = ""
var triggerMinute: Int = 0
var nearestStormDirectionString: String = ""
var windDirectionDegree: Double = 0
var windDirectionString: String = ""
var precipAccumulation: Double = 0

// MARK: - Weather condition daily values
var weatherCondition0: String = ""
var weatherCondition1: String = ""
var weatherCondition2: String = ""
var weatherCondition3: String = ""
var weatherCondition4: String = ""
var weatherCondition5: String = ""
var weatherCondition6: String = ""
var weatherCondition7: String = ""
var weatherCondition8: String = ""
var weatherCondition9: String = ""
var weatherCondition10: String = ""
var weatherCondition11: String = ""
var weatherCondition12: String = ""
var weatherCondition13: String = ""

// MARK: - Minutely precip probability values
// 1-20
var minutelyChance1: Int = 0
var minutelyChance2: Int = 0
var minutelyChance3: Int = 0
var minutelyChance4: Int = 0
var minutelyChance5: Int = 0
var minutelyChance6: Int = 0
var minutelyChance7: Int = 0
var minutelyChance8: Int = 0
var minutelyChance9: Int = 0
var minutelyChance10: Int = 0
var minutelyChance11: Int = 0
var minutelyChance12: Int = 0
var minutelyChance13: Int = 0
var minutelyChance14: Int = 0
var minutelyChance15: Int = 0
var minutelyChance16: Int = 0
var minutelyChance17: Int = 0
var minutelyChance18: Int = 0
var minutelyChance19: Int = 0
var minutelyChance20: Int = 0
// 21-40
var minutelyChance21: Int = 0
var minutelyChance22: Int = 0
var minutelyChance23: Int = 0
var minutelyChance24: Int = 0
var minutelyChance25: Int = 0
var minutelyChance26: Int = 0
var minutelyChance27: Int = 0
var minutelyChance28: Int = 0
var minutelyChance29: Int = 0
var minutelyChance30: Int = 0
var minutelyChance31: Int = 0
var minutelyChance32: Int = 0
var minutelyChance33: Int = 0
var minutelyChance34: Int = 0
var minutelyChance35: Int = 0
var minutelyChance36: Int = 0
var minutelyChance37: Int = 0
var minutelyChance38: Int = 0
var minutelyChance39: Int = 0
var minutelyChance40: Int = 0
// 41-60
var minutelyChance41: Int = 0
var minutelyChance42: Int = 0
var minutelyChance43: Int = 0
var minutelyChance44: Int = 0
var minutelyChance45: Int = 0
var minutelyChance46: Int = 0
var minutelyChance47: Int = 0
var minutelyChance48: Int = 0
var minutelyChance49: Int = 0
var minutelyChance50: Int = 0
var minutelyChance51: Int = 0
var minutelyChance52: Int = 0
var minutelyChance53: Int = 0
var minutelyChance54: Int = 0
var minutelyChance55: Int = 0
var minutelyChance56: Int = 0
var minutelyChance57: Int = 0
var minutelyChance58: Int = 0
var minutelyChance59: Int = 0
var minutelyChance60: Int = 0

// MARK: - Minutely precip type values
// 1-20
var minutelyType1: String = ""
var minutelyType2: String = ""
var minutelyType3: String = ""
var minutelyType4: String = ""
var minutelyType5: String = ""
var minutelyType6: String = ""
var minutelyType7: String = ""
var minutelyType8: String = ""
var minutelyType9: String = ""
var minutelyType10: String = ""
var minutelyType11: String = ""
var minutelyType12: String = ""
var minutelyType13: String = ""
var minutelyType14: String = ""
var minutelyType15: String = ""
var minutelyType16: String = ""
var minutelyType17: String = ""
var minutelyType18: String = ""
var minutelyType19: String = ""
var minutelyType20: String = ""
// 21-40
var minutelyType21: String = ""
var minutelyType22: String = ""
var minutelyType23: String = ""
var minutelyType24: String = ""
var minutelyType25: String = ""
var minutelyType26: String = ""
var minutelyType27: String = ""
var minutelyType28: String = ""
var minutelyType29: String = ""
var minutelyType30: String = ""
var minutelyType31: String = ""
var minutelyType32: String = ""
var minutelyType33: String = ""
var minutelyType34: String = ""
var minutelyType35: String = ""
var minutelyType36: String = ""
var minutelyType37: String = ""
var minutelyType38: String = ""
var minutelyType39: String = ""
var minutelyType40: String = ""
// 41-60
var minutelyType41: String = ""
var minutelyType42: String = ""
var minutelyType43: String = ""
var minutelyType44: String = ""
var minutelyType45: String = ""
var minutelyType46: String = ""
var minutelyType47: String = ""
var minutelyType48: String = ""
var minutelyType49: String = ""
var minutelyType50: String = ""
var minutelyType51: String = ""
var minutelyType52: String = ""
var minutelyType53: String = ""
var minutelyType54: String = ""
var minutelyType55: String = ""
var minutelyType56: String = ""
var minutelyType57: String = ""
var minutelyType58: String = ""
var minutelyType59: String = ""
var minutelyType60: String = ""

// MARK: - Minutely precip intensity values
// 1-20
var minutelyIntensity1: Double = 0
var minutelyIntensity2: Double = 0
var minutelyIntensity3: Double = 0
var minutelyIntensity4: Double = 0
var minutelyIntensity5: Double = 0
var minutelyIntensity6: Double = 0
var minutelyIntensity7: Double = 0
var minutelyIntensity8: Double = 0
var minutelyIntensity9: Double = 0
var minutelyIntensity10: Double = 0
var minutelyIntensity11: Double = 0
var minutelyIntensity12: Double = 0
var minutelyIntensity13: Double = 0
var minutelyIntensity14: Double = 0
var minutelyIntensity15: Double = 0
var minutelyIntensity16: Double = 0
var minutelyIntensity17: Double = 0
var minutelyIntensity18: Double = 0
var minutelyIntensity19: Double = 0
var minutelyIntensity20: Double = 0
// 21-40
var minutelyIntensity21: Double = 0
var minutelyIntensity22: Double = 0
var minutelyIntensity23: Double = 0
var minutelyIntensity24: Double = 0
var minutelyIntensity25: Double = 0
var minutelyIntensity26: Double = 0
var minutelyIntensity27: Double = 0
var minutelyIntensity28: Double = 0
var minutelyIntensity29: Double = 0
var minutelyIntensity30: Double = 0
var minutelyIntensity31: Double = 0
var minutelyIntensity32: Double = 0
var minutelyIntensity33: Double = 0
var minutelyIntensity34: Double = 0
var minutelyIntensity35: Double = 0
var minutelyIntensity36: Double = 0
var minutelyIntensity37: Double = 0
var minutelyIntensity38: Double = 0
var minutelyIntensity39: Double = 0
var minutelyIntensity40: Double = 0
// 41-60
var minutelyIntensity41: Double = 0
var minutelyIntensity42: Double = 0
var minutelyIntensity43: Double = 0
var minutelyIntensity44: Double = 0
var minutelyIntensity45: Double = 0
var minutelyIntensity46: Double = 0
var minutelyIntensity47: Double = 0
var minutelyIntensity48: Double = 0
var minutelyIntensity49: Double = 0
var minutelyIntensity50: Double = 0
var minutelyIntensity51: Double = 0
var minutelyIntensity52: Double = 0
var minutelyIntensity53: Double = 0
var minutelyIntensity54: Double = 0
var minutelyIntensity55: Double = 0
var minutelyIntensity56: Double = 0
var minutelyIntensity57: Double = 0
var minutelyIntensity58: Double = 0
var minutelyIntensity59: Double = 0
var minutelyIntensity60: Double = 0

// MARK: - Hourly precip values
var precipHour0: Int = 0
var precipHour1: Int = 0
var precipHour2: Int = 0
var precipHour3: Int = 0
var precipHour4: Int = 0
var precipHour5: Int = 0
var precipHour6: Int = 0
var precipHour7: Int = 0
var precipHour8: Int = 0
var precipHour9: Int = 0
var precipHour10: Int = 0
var precipHour11: Int = 0
var precipHour12: Int = 0
var precipHour13: Int = 0
var precipHour14: Int = 0
var precipHour15: Int = 0

// MARK: - Hourly pressure values
var pressureHour1: Int = 0
var pressureHour2: Int = 0
var pressureHour3: Int = 0
var pressureHour4: Int = 0

// MARK: - Hourly temp values
var tempHour0: Int = 0
var tempHour1: Int = 0
var tempHour2: Int = 0
var tempHour3: Int = 0
var tempHour4: Int = 0
var tempHour5: Int = 0
var tempHour6: Int = 0
var tempHour7: Int = 0
var tempHour8: Int = 0
var tempHour9: Int = 0
var tempHour10: Int = 0
var tempHour11: Int = 0
var tempHour12: Int = 0
var tempHour13: Int = 0
var tempHour14: Int = 0
var tempHour15: Int = 0

// MARK: - Hourly humidity values
var humidityHour0: Int = 0
var humidityHour1: Int = 0
var humidityHour2: Int = 0
var humidityHour3: Int = 0
var humidityHour4: Int = 0
var humidityHour5: Int = 0
var humidityHour6: Int = 0
var humidityHour7: Int = 0
var humidityHour8: Int = 0
var humidityHour9: Int = 0
var humidityHour10: Int = 0
var humidityHour11: Int = 0
var humidityHour12: Int = 0
var humidityHour13: Int = 0
var humidityHour14: Int = 0
var humidityHour15: Int = 0

// MARK: - Hourly uv index values
var uvindexHour0: Int = 0
var uvindexHour1: Int = 0
var uvindexHour2: Int = 0
var uvindexHour3: Int = 0
var uvindexHour4: Int = 0
var uvindexHour5: Int = 0
var uvindexHour6: Int = 0
var uvindexHour7: Int = 0
var uvindexHour8: Int = 0
var uvindexHour9: Int = 0
var uvindexHour10: Int = 0
var uvindexHour11: Int = 0
var uvindexHour12: Int = 0
var uvindexHour13: Int = 0
var uvindexHour14: Int = 0
var uvindexHour15: Int = 0

// MARK: - Hourly wind speed values
var windSpeedHour0: Int = 0
var windSpeedHour1: Int = 0
var windSpeedHour2: Int = 0
var windSpeedHour3: Int = 0
var windSpeedHour4: Int = 0
var windSpeedHour5: Int = 0
var windSpeedHour6: Int = 0
var windSpeedHour7: Int = 0
var windSpeedHour8: Int = 0
var windSpeedHour9: Int = 0
var windSpeedHour10: Int = 0
var windSpeedHour11: Int = 0
var windSpeedHour12: Int = 0
var windSpeedHour13: Int = 0
var windSpeedHour14: Int = 0
var windSpeedHour15: Int = 0

// MARK: - Hourly wind direction values
var windDirectionHour0: String = ""
var windDirectionHour1: String = ""
var windDirectionHour2: String = ""
var windDirectionHour3: String = ""
var windDirectionHour4: String = ""
var windDirectionHour5: String = ""
var windDirectionHour6: String = ""
var windDirectionHour7: String = ""
var windDirectionHour8: String = ""
var windDirectionHour9: String = ""
var windDirectionHour10: String = ""
var windDirectionHour11: String = ""
var windDirectionHour12: String = ""
var windDirectionHour13: String = ""
var windDirectionHour14: String = ""
var windDirectionHour15: String = ""

// MARK: - Hourly cloud cover values
var cloudCoverHour0: Int = 0
var cloudCoverHour1: Int = 0
var cloudCoverHour2: Int = 0
var cloudCoverHour3: Int = 0
var cloudCoverHour4: Int = 0
var cloudCoverHour5: Int = 0
var cloudCoverHour6: Int = 0
var cloudCoverHour7: Int = 0
var cloudCoverHour8: Int = 0
var cloudCoverHour9: Int = 0
var cloudCoverHour10: Int = 0
var cloudCoverHour11: Int = 0
var cloudCoverHour12: Int = 0
var cloudCoverHour13: Int = 0
var cloudCoverHour14: Int = 0
var cloudCoverHour15: Int = 0

// MARK: - Hourly condition values
var conditionHour0: String = ""
var conditionHour1: String = ""
var conditionHour2: String = ""
var conditionHour3: String = ""
var conditionHour4: String = ""
var conditionHour5: String = ""
var conditionHour6: String = ""
var conditionHour7: String = ""
var conditionHour8: String = ""
var conditionHour9: String = ""
var conditionHour10: String = ""
var conditionHour11: String = ""
var conditionHour12: String = ""
var conditionHour13: String = ""
var conditionHour14: String = ""
var conditionHour15: String = ""

// MARK: - Hourly strings
var hour0: String = ""
var hour1: String = ""
var hour2: String = ""
var hour3: String = ""
var hour4: String = ""
var hour5: String = ""
var hour6: String = ""
var hour7: String = ""
var hour8: String = ""
var hour9: String = ""
var hour10: String = ""
var hour11: String = ""
var hour12: String = ""
var hour13: String = ""
var hour14: String = ""
var hour15: String = ""

// MARK: - Other weather values
var uvIndex: Int = 0
var visibility: Int = 0
var pressure: Int = 0
var dewPoint: Int = 0
var cloudCover: Int = 0
var precipIntensity: Double = 0

// MARK: - Daily weather values
var highTemperature: Int = 0
var lowTemperature: Int = 0
var precipitation: Int = 0
var precipitationType: String = ""
var humidity: Int = 0
var wind: Int = 0
var windGust: Int = 0
var sunrise: String = ""
var sunset: String = ""
var moonPhaseString: String = ""

var sunriseDate = Date()
var sunsetDate = Date()

// MARK: - Seven day forecast day values
// Day Zero
var dayZeroDayString: String = ""
var dayZeroDateString: String = ""
var dayZeroHigh: Int = 0
var dayZeroLow: Int = 0
var dayZeroSummaryString: String = ""
var dayZeroConditionValue: Any = 0
var dayZeroPrecip: Int = 0
var dayZeroPrecipAccum: Double = 0
var dayZeroSunrise: String = ""
var dayZeroSunset: String = ""
var dayZeroMoonPhaseString: String = ""
var dayZeroConditionString: String = ""

// Day One
var dayOneDayString: String = ""
var dayOneDateString: String = ""
var dayOneHigh: Int = 0
var dayOneLow: Int = 0
var dayOneSummaryString: String = ""
var dayOneConditionValue: Any = 0
var dayOnePrecip: Int = 0
var dayOnePrecipAccum: Double = 0
var dayOneSunrise: String = ""
var dayOneSunset: String = ""
var dayOneConditionString: String = ""

// Day Two
var dayTwoDayString: String = ""
var dayTwoDateString: String = ""
var dayTwoHigh: Int = 0
var dayTwoLow: Int = 0
var dayTwoSummaryString: String = ""
var dayTwoConditionValue: Any = 0
var dayTwoPrecip: Int = 0
var dayTwoPrecipAccum: Double = 0
var dayTwoSunrise: String = ""
var dayTwoSunset: String = ""
var dayTwoConditionString: String = ""

// Day Three
var dayThreeDayString: String = ""
var dayThreeDateString: String = ""
var dayThreeHigh: Int = 0
var dayThreeLow: Int = 0
var dayThreeSummaryString: String = ""
var dayThreeConditionValue: Any = 0
var dayThreePrecip: Int = 0
var dayThreePrecipAccum: Double = 0
var dayThreeSunrise: String = ""
var dayThreeSunset: String = ""
var dayThreeConditionString: String = ""

// Day Four
var dayFourDayString: String = ""
var dayFourDateString: String = ""
var dayFourHigh: Int = 0
var dayFourLow: Int = 0
var dayFourSummaryString: String = ""
var dayFourConditionValue: Any = 0
var dayFourPrecip: Int = 0
var dayFourPrecipAccum: Double = 0
var dayFourSunrise: String = ""
var dayFourSunset: String = ""
var dayFourConditionString: String = ""

// Day Five
var dayFiveDayString: String = ""
var dayFiveDateString: String = ""
var dayFiveHigh: Int = 0
var dayFiveLow: Int = 0
var dayFiveSummaryString: String = ""
var dayFiveConditionValue: Any = 0
var dayFivePrecip: Int = 0
var dayFivePrecipAccum: Double = 0
var dayFiveSunrise: String = ""
var dayFiveSunset: String = ""
var dayFiveConditionString: String = ""

// Day Six
var daySixDayString: String = ""
var daySixDateString: String = ""
var daySixHigh: Int = 0
var daySixLow: Int = 0
var daySixSummaryString: String = ""
var daySixConditionValue: Any = 0
var daySixPrecip: Int = 0
var daySixPrecipAccum: Double = 0
var daySixSunrise: String = ""
var daySixSunset: String = ""
var daySixConditionString: String = ""

// Day Seven
var daySevenDayString: String = ""
var daySevenDateString: String = ""
var daySevenHigh: Int = 0
var daySevenLow: Int = 0
var daySevenSummaryString: String = ""
var daySevenConditionValue: Any = 0
var daySevenPrecip: Int = 0
var daySevenPrecipAccum: Double = 0
var daySevenSunrise: String = ""
var daySevenSunset: String = ""
var daySevenConditionString: String = ""

// Day Eight
var dayEightDayString: String = ""
var dayEightDateString: String = ""
var dayEightHigh: Int = 0
var dayEightLow: Int = 0
var dayEightSummaryString: String = ""
var dayEightConditionValue: Any = 0
var dayEightPrecip: Int = 0
var dayEightPrecipAccum: Double = 0
var dayEightSunrise: String = ""
var dayEightSunset: String = ""
var dayEightConditionString: String = ""

// Day Nine
var dayNineDayString: String = ""
var dayNineDateString: String = ""
var dayNineHigh: Int = 0
var dayNineLow: Int = 0
var dayNineSummaryString: String = ""
var dayNineConditionValue: Any = 0
var dayNinePrecip: Int = 0
var dayNinePrecipAccum: Double = 0
var dayNineSunrise: String = ""
var dayNineSunset: String = ""
var dayNineConditionString: String = ""

// Day Ten
var dayTenDayString: String = ""
var dayTenDateString: String = ""
var dayTenHigh: Int = 0
var dayTenLow: Int = 0
var dayTenSummaryString: String = ""
var dayTenConditionValue: Any = 0
var dayTenPrecip: Int = 0
var dayTenPrecipAccum: Double = 0
var dayTenSunrise: String = ""
var dayTenSunset: String = ""
var dayTenConditionString: String = ""

// Day Eleven
var dayElevenDayString: String = ""
var dayElevenDateString: String = ""
var dayElevenHigh: Int = 0
var dayElevenLow: Int = 0
var dayElevenSummaryString: String = ""
var dayElevenConditionValue: Any = 0
var dayElevenPrecip: Int = 0
var dayElevenPrecipAccum: Double = 0
var dayElevenSunrise: String = ""
var dayElevenSunset: String = ""
var dayElevenConditionString: String = ""

// Day Twelve
var dayTwelveDayString: String = ""
var dayTwelveDateString: String = ""
var dayTwelveHigh: Int = 0
var dayTwelveLow: Int = 0
var dayTwelveSummaryString: String = ""
var dayTwelveConditionValue: Any = 0
var dayTwelvePrecip: Int = 0
var dayTwelvePrecipAccum: Double = 0
var dayTwelveSunrise: String = ""
var dayTwelveSunset: String = ""
var dayTwelveConditionString: String = ""

// Day Thirteen
var dayThirteenDayString: String = ""
var dayThirteenDateString: String = ""
var dayThirteenHigh: Int = 0
var dayThirteenLow: Int = 0
var dayThirteenSummaryString: String = ""
var dayThirteenConditionValue: Any = 0
var dayThirteenPrecip: Int = 0
var dayThirteenPrecipAccum: Double = 0
var dayThirteenSunrise: String = ""
var dayThirteenSunset: String = ""
var dayThirteenConditionString: String = ""

// MARK: - Seven day forecast hourly values
// Day Zero
// Time
var dayTime0: String = "", dayTime1: String = "", dayTime2: String = "", dayTime3: String = "", dayTime4: String = "", dayTime5: String = "", dayTime6: String = "", dayTime7: String = "", dayTime8: String = "", dayTime9: String = "", dayTime10: String = "", dayTime11: String = "", dayTime12: String = "", dayTime13: String = "", dayTime14: String = "", dayTime15: String = ""
// Condition
var dayZeroCondition0: String = "", dayZeroCondition1: String = "", dayZeroCondition2: String = "", dayZeroCondition3: String = "", dayZeroCondition4: String = "", dayZeroCondition5: String = "", dayZeroCondition6: String = "", dayZeroCondition7: String = "", dayZeroCondition8: String = "", dayZeroCondition9: String = "", dayZeroCondition10: String = "", dayZeroCondition11: String = "", dayZeroCondition12: String = "", dayZeroCondition13: String = "", dayZeroCondition14: String = "", dayZeroCondition15: String = ""
// Precip
var dayZeroPrecip0: Int = 0, dayZeroPrecip1: Int = 0, dayZeroPrecip2: Int = 0, dayZeroPrecip3: Int = 0, dayZeroPrecip4: Int = 0, dayZeroPrecip5: Int = 0, dayZeroPrecip6: Int = 0, dayZeroPrecip7: Int = 0, dayZeroPrecip8: Int = 0, dayZeroPrecip9: Int = 0, dayZeroPrecip10: Int = 0, dayZeroPrecip11: Int = 0, dayZeroPrecip12: Int = 0, dayZeroPrecip13: Int = 0, dayZeroPrecip14: Int = 0, dayZeroPrecip15: Int = 0
// Temp
var dayZeroTemp0: Int = 0, dayZeroTemp1: Int = 0, dayZeroTemp2: Int = 0, dayZeroTemp3: Int = 0, dayZeroTemp4: Int = 0, dayZeroTemp5: Int = 0, dayZeroTemp6: Int = 0, dayZeroTemp7: Int = 0, dayZeroTemp8: Int = 0, dayZeroTemp9: Int = 0, dayZeroTemp10: Int = 0, dayZeroTemp11: Int = 0, dayZeroTemp12: Int = 0, dayZeroTemp13: Int = 0, dayZeroTemp14: Int = 0, dayZeroTemp15: Int = 0
// Humidity
var dayZeroHumidity0: Int = 0, dayZeroHumidity1: Int = 0, dayZeroHumidity2: Int = 0, dayZeroHumidity3: Int = 0, dayZeroHumidity4: Int = 0, dayZeroHumidity5: Int = 0, dayZeroHumidity6: Int = 0, dayZeroHumidity7: Int = 0, dayZeroHumidity8: Int = 0, dayZeroHumidity9: Int = 0, dayZeroHumidity10: Int = 0, dayZeroHumidity11: Int = 0, dayZeroHumidity12: Int = 0, dayZeroHumidity13: Int = 0, dayZeroHumidity14: Int = 0, dayZeroHumidity15: Int = 0
// Icon
var dayZeroIcon0: String = "", dayZeroIcon1: String = "", dayZeroIcon2: String = "", dayZeroIcon3: String = "", dayZeroIcon4: String = "", dayZeroIcon5: String = "", dayZeroIcon6: String = "", dayZeroIcon7: String = "", dayZeroIcon8: String = "", dayZeroIcon9: String = "", dayZeroIcon10: String = "", dayZeroIcon11: String = "", dayZeroIcon12: String = "", dayZeroIcon13: String = "", dayZeroIcon14: String = "", dayZeroIcon15: String = ""
// UV Index
var dayZeroIndex0: Int = 0, dayZeroIndex1: Int = 0, dayZeroIndex2: Int = 0, dayZeroIndex3: Int = 0, dayZeroIndex4: Int = 0, dayZeroIndex5: Int = 0, dayZeroIndex6: Int = 0, dayZeroIndex7: Int = 0, dayZeroIndex8: Int = 0, dayZeroIndex9: Int = 0, dayZeroIndex10: Int = 0, dayZeroIndex11: Int = 0, dayZeroIndex12: Int = 0, dayZeroIndex13: Int = 0, dayZeroIndex14: Int = 0, dayZeroIndex15: Int = 0
// Wind Speed
var dayZeroWindSpeed0: Int = 0, dayZeroWindSpeed1: Int = 0, dayZeroWindSpeed2: Int = 0, dayZeroWindSpeed3: Int = 0, dayZeroWindSpeed4: Int = 0, dayZeroWindSpeed5: Int = 0, dayZeroWindSpeed6: Int = 0, dayZeroWindSpeed7: Int = 0, dayZeroWindSpeed8: Int = 0, dayZeroWindSpeed9: Int = 0, dayZeroWindSpeed10: Int = 0, dayZeroWindSpeed11: Int = 0, dayZeroWindSpeed12: Int = 0, dayZeroWindSpeed13: Int = 0, dayZeroWindSpeed14: Int = 0, dayZeroWindSpeed15: Int = 0
// Cloud Cover
var dayZeroCloudCover0: Int = 0, dayZeroCloudCover1: Int = 0, dayZeroCloudCover2: Int = 0, dayZeroCloudCover3: Int = 0, dayZeroCloudCover4: Int = 0, dayZeroCloudCover5: Int = 0, dayZeroCloudCover6: Int = 0, dayZeroCloudCover7: Int = 0, dayZeroCloudCover8: Int = 0, dayZeroCloudCover9: Int = 0, dayZeroCloudCover10: Int = 0, dayZeroCloudCover11: Int = 0, dayZeroCloudCover12: Int = 0, dayZeroCloudCover13: Int = 0, dayZeroCloudCover14: Int = 0, dayZeroCloudCover15: Int = 0

// Day One
// Condition
var dayOneCondition0: String = "", dayOneCondition1: String = "", dayOneCondition2: String = "", dayOneCondition3: String = "", dayOneCondition4: String = "", dayOneCondition5: String = "", dayOneCondition6: String = "", dayOneCondition7: String = "", dayOneCondition8: String = "", dayOneCondition9: String = "", dayOneCondition10: String = "", dayOneCondition11: String = "", dayOneCondition12: String = "", dayOneCondition13: String = "", dayOneCondition14: String = "", dayOneCondition15: String = ""
// Precip
var dayOnePrecip0: Int = 0, dayOnePrecip1: Int = 0, dayOnePrecip2: Int = 0, dayOnePrecip3: Int = 0, dayOnePrecip4: Int = 0, dayOnePrecip5: Int = 0, dayOnePrecip6: Int = 0, dayOnePrecip7: Int = 0, dayOnePrecip8: Int = 0, dayOnePrecip9: Int = 0, dayOnePrecip10: Int = 0, dayOnePrecip11: Int = 0, dayOnePrecip12: Int = 0, dayOnePrecip13: Int = 0, dayOnePrecip14: Int = 0, dayOnePrecip15: Int = 0
// Temp
var dayOneTemp0: Int = 0, dayOneTemp1: Int = 0, dayOneTemp2: Int = 0, dayOneTemp3: Int = 0, dayOneTemp4: Int = 0, dayOneTemp5: Int = 0, dayOneTemp6: Int = 0, dayOneTemp7: Int = 0, dayOneTemp8: Int = 0, dayOneTemp9: Int = 0, dayOneTemp10: Int = 0, dayOneTemp11: Int = 0, dayOneTemp12: Int = 0, dayOneTemp13: Int = 0, dayOneTemp14: Int = 0, dayOneTemp15: Int = 0
// Humidity
var dayOneHumidity0: Int = 0, dayOneHumidity1: Int = 0, dayOneHumidity2: Int = 0, dayOneHumidity3: Int = 0, dayOneHumidity4: Int = 0, dayOneHumidity5: Int = 0, dayOneHumidity6: Int = 0, dayOneHumidity7: Int = 0, dayOneHumidity8: Int = 0, dayOneHumidity9: Int = 0, dayOneHumidity10: Int = 0, dayOneHumidity11: Int = 0, dayOneHumidity12: Int = 0, dayOneHumidity13: Int = 0, dayOneHumidity14: Int = 0, dayOneHumidity15: Int = 0
// Icon
var dayOneIcon0: String = "", dayOneIcon1: String = "", dayOneIcon2: String = "", dayOneIcon3: String = "", dayOneIcon4: String = "", dayOneIcon5: String = "", dayOneIcon6: String = "", dayOneIcon7: String = "", dayOneIcon8: String = "", dayOneIcon9: String = "", dayOneIcon10: String = "", dayOneIcon11: String = "", dayOneIcon12: String = "", dayOneIcon13: String = "", dayOneIcon14: String = "", dayOneIcon15: String = ""
// UV Index
var dayOneIndex0: Int = 0, dayOneIndex1: Int = 0, dayOneIndex2: Int = 0, dayOneIndex3: Int = 0, dayOneIndex4: Int = 0, dayOneIndex5: Int = 0, dayOneIndex6: Int = 0, dayOneIndex7: Int = 0, dayOneIndex8: Int = 0, dayOneIndex9: Int = 0, dayOneIndex10: Int = 0, dayOneIndex11: Int = 0, dayOneIndex12: Int = 0, dayOneIndex13: Int = 0, dayOneIndex14: Int = 0, dayOneIndex15: Int = 0
// Wind Speed
var dayOneWindSpeed0: Int = 0, dayOneWindSpeed1: Int = 0, dayOneWindSpeed2: Int = 0, dayOneWindSpeed3: Int = 0, dayOneWindSpeed4: Int = 0, dayOneWindSpeed5: Int = 0, dayOneWindSpeed6: Int = 0, dayOneWindSpeed7: Int = 0, dayOneWindSpeed8: Int = 0, dayOneWindSpeed9: Int = 0, dayOneWindSpeed10: Int = 0, dayOneWindSpeed11: Int = 0, dayOneWindSpeed12: Int = 0, dayOneWindSpeed13: Int = 0, dayOneWindSpeed14: Int = 0, dayOneWindSpeed15: Int = 0
// Cloud Cover
var dayOneCloudCover0: Int = 0, dayOneCloudCover1: Int = 0, dayOneCloudCover2: Int = 0, dayOneCloudCover3: Int = 0, dayOneCloudCover4: Int = 0, dayOneCloudCover5: Int = 0, dayOneCloudCover6: Int = 0, dayOneCloudCover7: Int = 0, dayOneCloudCover8: Int = 0, dayOneCloudCover9: Int = 0, dayOneCloudCover10: Int = 0, dayOneCloudCover11: Int = 0, dayOneCloudCover12: Int = 0, dayOneCloudCover13: Int = 0, dayOneCloudCover14: Int = 0, dayOneCloudCover15: Int = 0

// Day Two
// Condition
var dayTwoCondition0: String = "", dayTwoCondition1: String = "", dayTwoCondition2: String = "", dayTwoCondition3: String = "", dayTwoCondition4: String = "", dayTwoCondition5: String = "", dayTwoCondition6: String = "", dayTwoCondition7: String = "", dayTwoCondition8: String = "", dayTwoCondition9: String = "", dayTwoCondition10: String = "", dayTwoCondition11: String = "", dayTwoCondition12: String = "", dayTwoCondition13: String = "", dayTwoCondition14: String = "", dayTwoCondition15: String = ""
// Precip
var dayTwoPrecip0: Int = 0, dayTwoPrecip1: Int = 0, dayTwoPrecip2: Int = 0, dayTwoPrecip3: Int = 0, dayTwoPrecip4: Int = 0, dayTwoPrecip5: Int = 0, dayTwoPrecip6: Int = 0, dayTwoPrecip7: Int = 0, dayTwoPrecip8: Int = 0, dayTwoPrecip9: Int = 0, dayTwoPrecip10: Int = 0, dayTwoPrecip11: Int = 0, dayTwoPrecip12: Int = 0, dayTwoPrecip13: Int = 0, dayTwoPrecip14: Int = 0, dayTwoPrecip15: Int = 0
// Temp
var dayTwoTemp0: Int = 0, dayTwoTemp1: Int = 0, dayTwoTemp2: Int = 0, dayTwoTemp3: Int = 0, dayTwoTemp4: Int = 0, dayTwoTemp5: Int = 0, dayTwoTemp6: Int = 0, dayTwoTemp7: Int = 0, dayTwoTemp8: Int = 0, dayTwoTemp9: Int = 0, dayTwoTemp10: Int = 0, dayTwoTemp11: Int = 0, dayTwoTemp12: Int = 0, dayTwoTemp13: Int = 0, dayTwoTemp14: Int = 0, dayTwoTemp15: Int = 0
// Humidity
var dayTwoHumidity0: Int = 0, dayTwoHumidity1: Int = 0, dayTwoHumidity2: Int = 0, dayTwoHumidity3: Int = 0, dayTwoHumidity4: Int = 0, dayTwoHumidity5: Int = 0, dayTwoHumidity6: Int = 0, dayTwoHumidity7: Int = 0, dayTwoHumidity8: Int = 0, dayTwoHumidity9: Int = 0, dayTwoHumidity10: Int = 0, dayTwoHumidity11: Int = 0, dayTwoHumidity12: Int = 0, dayTwoHumidity13: Int = 0, dayTwoHumidity14: Int = 0, dayTwoHumidity15: Int = 0
// Icon
var dayTwoIcon0: String = "", dayTwoIcon1: String = "", dayTwoIcon2: String = "", dayTwoIcon3: String = "", dayTwoIcon4: String = "", dayTwoIcon5: String = "", dayTwoIcon6: String = "", dayTwoIcon7: String = "", dayTwoIcon8: String = "", dayTwoIcon9: String = "", dayTwoIcon10: String = "", dayTwoIcon11: String = "", dayTwoIcon12: String = "", dayTwoIcon13: String = "", dayTwoIcon14: String = "", dayTwoIcon15: String = ""
// UV Index
var dayTwoIndex0: Int = 0, dayTwoIndex1: Int = 0, dayTwoIndex2: Int = 0, dayTwoIndex3: Int = 0, dayTwoIndex4: Int = 0, dayTwoIndex5: Int = 0, dayTwoIndex6: Int = 0, dayTwoIndex7: Int = 0, dayTwoIndex8: Int = 0, dayTwoIndex9: Int = 0, dayTwoIndex10: Int = 0, dayTwoIndex11: Int = 0, dayTwoIndex12: Int = 0, dayTwoIndex13: Int = 0, dayTwoIndex14: Int = 0, dayTwoIndex15: Int = 0
// Wind Speed
var dayTwoWindSpeed0: Int = 0, dayTwoWindSpeed1: Int = 0, dayTwoWindSpeed2: Int = 0, dayTwoWindSpeed3: Int = 0, dayTwoWindSpeed4: Int = 0, dayTwoWindSpeed5: Int = 0, dayTwoWindSpeed6: Int = 0, dayTwoWindSpeed7: Int = 0, dayTwoWindSpeed8: Int = 0, dayTwoWindSpeed9: Int = 0, dayTwoWindSpeed10: Int = 0, dayTwoWindSpeed11: Int = 0, dayTwoWindSpeed12: Int = 0, dayTwoWindSpeed13: Int = 0, dayTwoWindSpeed14: Int = 0, dayTwoWindSpeed15: Int = 0
// Cloud Cover
var dayTwoCloudCover0: Int = 0, dayTwoCloudCover1: Int = 0, dayTwoCloudCover2: Int = 0, dayTwoCloudCover3: Int = 0, dayTwoCloudCover4: Int = 0, dayTwoCloudCover5: Int = 0, dayTwoCloudCover6: Int = 0, dayTwoCloudCover7: Int = 0, dayTwoCloudCover8: Int = 0, dayTwoCloudCover9: Int = 0, dayTwoCloudCover10: Int = 0, dayTwoCloudCover11: Int = 0, dayTwoCloudCover12: Int = 0, dayTwoCloudCover13: Int = 0, dayTwoCloudCover14: Int = 0, dayTwoCloudCover15: Int = 0

// Day Three
// Condition
var dayThreeCondition0: String = "", dayThreeCondition1: String = "", dayThreeCondition2: String = "", dayThreeCondition3: String = "", dayThreeCondition4: String = "", dayThreeCondition5: String = "", dayThreeCondition6: String = "", dayThreeCondition7: String = "", dayThreeCondition8: String = "", dayThreeCondition9: String = "", dayThreeCondition10: String = "", dayThreeCondition11: String = "", dayThreeCondition12: String = "", dayThreeCondition13: String = "", dayThreeCondition14: String = "", dayThreeCondition15: String = ""
// Precip
var dayThreePrecip0: Int = 0, dayThreePrecip1: Int = 0, dayThreePrecip2: Int = 0, dayThreePrecip3: Int = 0, dayThreePrecip4: Int = 0, dayThreePrecip5: Int = 0, dayThreePrecip6: Int = 0, dayThreePrecip7: Int = 0, dayThreePrecip8: Int = 0, dayThreePrecip9: Int = 0, dayThreePrecip10: Int = 0, dayThreePrecip11: Int = 0, dayThreePrecip12: Int = 0, dayThreePrecip13: Int = 0, dayThreePrecip14: Int = 0, dayThreePrecip15: Int = 0
// Temp
var dayThreeTemp0: Int = 0, dayThreeTemp1: Int = 0, dayThreeTemp2: Int = 0, dayThreeTemp3: Int = 0, dayThreeTemp4: Int = 0, dayThreeTemp5: Int = 0, dayThreeTemp6: Int = 0, dayThreeTemp7: Int = 0, dayThreeTemp8: Int = 0, dayThreeTemp9: Int = 0, dayThreeTemp10: Int = 0, dayThreeTemp11: Int = 0, dayThreeTemp12: Int = 0, dayThreeTemp13: Int = 0, dayThreeTemp14: Int = 0, dayThreeTemp15: Int = 0
// Humidity
var dayThreeHumidity0: Int = 0, dayThreeHumidity1: Int = 0, dayThreeHumidity2: Int = 0, dayThreeHumidity3: Int = 0, dayThreeHumidity4: Int = 0, dayThreeHumidity5: Int = 0, dayThreeHumidity6: Int = 0, dayThreeHumidity7: Int = 0, dayThreeHumidity8: Int = 0, dayThreeHumidity9: Int = 0, dayThreeHumidity10: Int = 0, dayThreeHumidity11: Int = 0, dayThreeHumidity12: Int = 0, dayThreeHumidity13: Int = 0, dayThreeHumidity14: Int = 0, dayThreeHumidity15: Int = 0
// Icon
var dayThreeIcon0: String = "", dayThreeIcon1: String = "", dayThreeIcon2: String = "", dayThreeIcon3: String = "", dayThreeIcon4: String = "", dayThreeIcon5: String = "", dayThreeIcon6: String = "", dayThreeIcon7: String = "", dayThreeIcon8: String = "", dayThreeIcon9: String = "", dayThreeIcon10: String = "", dayThreeIcon11: String = "", dayThreeIcon12: String = "", dayThreeIcon13: String = "", dayThreeIcon14: String = "", dayThreeIcon15: String = ""
// UV Index
var dayThreeIndex0: Int = 0, dayThreeIndex1: Int = 0, dayThreeIndex2: Int = 0, dayThreeIndex3: Int = 0, dayThreeIndex4: Int = 0, dayThreeIndex5: Int = 0, dayThreeIndex6: Int = 0, dayThreeIndex7: Int = 0, dayThreeIndex8: Int = 0, dayThreeIndex9: Int = 0, dayThreeIndex10: Int = 0, dayThreeIndex11: Int = 0, dayThreeIndex12: Int = 0, dayThreeIndex13: Int = 0, dayThreeIndex14: Int = 0, dayThreeIndex15: Int = 0
// Wind Speed
var dayThreeWindSpeed0: Int = 0, dayThreeWindSpeed1: Int = 0, dayThreeWindSpeed2: Int = 0, dayThreeWindSpeed3: Int = 0, dayThreeWindSpeed4: Int = 0, dayThreeWindSpeed5: Int = 0, dayThreeWindSpeed6: Int = 0, dayThreeWindSpeed7: Int = 0, dayThreeWindSpeed8: Int = 0, dayThreeWindSpeed9: Int = 0, dayThreeWindSpeed10: Int = 0, dayThreeWindSpeed11: Int = 0, dayThreeWindSpeed12: Int = 0, dayThreeWindSpeed13: Int = 0, dayThreeWindSpeed14: Int = 0, dayThreeWindSpeed15: Int = 0
// Cloud Cover
var dayThreeCloudCover0: Int = 0, dayThreeCloudCover1: Int = 0, dayThreeCloudCover2: Int = 0, dayThreeCloudCover3: Int = 0, dayThreeCloudCover4: Int = 0, dayThreeCloudCover5: Int = 0, dayThreeCloudCover6: Int = 0, dayThreeCloudCover7: Int = 0, dayThreeCloudCover8: Int = 0, dayThreeCloudCover9: Int = 0, dayThreeCloudCover10: Int = 0, dayThreeCloudCover11: Int = 0, dayThreeCloudCover12: Int = 0, dayThreeCloudCover13: Int = 0, dayThreeCloudCover14: Int = 0, dayThreeCloudCover15: Int = 0

// Day Four
// Condition
var dayFourCondition0: String = "", dayFourCondition1: String = "", dayFourCondition2: String = "", dayFourCondition3: String = "", dayFourCondition4: String = "", dayFourCondition5: String = "", dayFourCondition6: String = "", dayFourCondition7: String = "", dayFourCondition8: String = "", dayFourCondition9: String = "", dayFourCondition10: String = "", dayFourCondition11: String = "", dayFourCondition12: String = "", dayFourCondition13: String = "", dayFourCondition14: String = "", dayFourCondition15: String = ""
// Precip
var dayFourPrecip0: Int = 0, dayFourPrecip1: Int = 0, dayFourPrecip2: Int = 0, dayFourPrecip3: Int = 0, dayFourPrecip4: Int = 0, dayFourPrecip5: Int = 0, dayFourPrecip6: Int = 0, dayFourPrecip7: Int = 0, dayFourPrecip8: Int = 0, dayFourPrecip9: Int = 0, dayFourPrecip10: Int = 0, dayFourPrecip11: Int = 0, dayFourPrecip12: Int = 0, dayFourPrecip13: Int = 0, dayFourPrecip14: Int = 0, dayFourPrecip15: Int = 0
// Temp
var dayFourTemp0: Int = 0, dayFourTemp1: Int = 0, dayFourTemp2: Int = 0, dayFourTemp3: Int = 0, dayFourTemp4: Int = 0, dayFourTemp5: Int = 0, dayFourTemp6: Int = 0, dayFourTemp7: Int = 0, dayFourTemp8: Int = 0, dayFourTemp9: Int = 0, dayFourTemp10: Int = 0, dayFourTemp11: Int = 0, dayFourTemp12: Int = 0, dayFourTemp13: Int = 0, dayFourTemp14: Int = 0, dayFourTemp15: Int = 0
// Humidity
var dayFourHumidity0: Int = 0, dayFourHumidity1: Int = 0, dayFourHumidity2: Int = 0, dayFourHumidity3: Int = 0, dayFourHumidity4: Int = 0, dayFourHumidity5: Int = 0, dayFourHumidity6: Int = 0, dayFourHumidity7: Int = 0, dayFourHumidity8: Int = 0, dayFourHumidity9: Int = 0, dayFourHumidity10: Int = 0, dayFourHumidity11: Int = 0, dayFourHumidity12: Int = 0, dayFourHumidity13: Int = 0, dayFourHumidity14: Int = 0, dayFourHumidity15: Int = 0
// Icon
var dayFourIcon0: String = "", dayFourIcon1: String = "", dayFourIcon2: String = "", dayFourIcon3: String = "", dayFourIcon4: String = "", dayFourIcon5: String = "", dayFourIcon6: String = "", dayFourIcon7: String = "", dayFourIcon8: String = "", dayFourIcon9: String = "", dayFourIcon10: String = "", dayFourIcon11: String = "", dayFourIcon12: String = "", dayFourIcon13: String = "", dayFourIcon14: String = "", dayFourIcon15: String = ""
// UV Index
var dayFourIndex0: Int = 0, dayFourIndex1: Int = 0, dayFourIndex2: Int = 0, dayFourIndex3: Int = 0, dayFourIndex4: Int = 0, dayFourIndex5: Int = 0, dayFourIndex6: Int = 0, dayFourIndex7: Int = 0, dayFourIndex8: Int = 0, dayFourIndex9: Int = 0, dayFourIndex10: Int = 0, dayFourIndex11: Int = 0, dayFourIndex12: Int = 0, dayFourIndex13: Int = 0, dayFourIndex14: Int = 0, dayFourIndex15: Int = 0
// Wind Speed
var dayFourWindSpeed0: Int = 0, dayFourWindSpeed1: Int = 0, dayFourWindSpeed2: Int = 0, dayFourWindSpeed3: Int = 0, dayFourWindSpeed4: Int = 0, dayFourWindSpeed5: Int = 0, dayFourWindSpeed6: Int = 0, dayFourWindSpeed7: Int = 0, dayFourWindSpeed8: Int = 0, dayFourWindSpeed9: Int = 0, dayFourWindSpeed10: Int = 0, dayFourWindSpeed11: Int = 0, dayFourWindSpeed12: Int = 0, dayFourWindSpeed13: Int = 0, dayFourWindSpeed14: Int = 0, dayFourWindSpeed15: Int = 0
// Cloud Cover
var dayFourCloudCover0: Int = 0, dayFourCloudCover1: Int = 0, dayFourCloudCover2: Int = 0, dayFourCloudCover3: Int = 0, dayFourCloudCover4: Int = 0, dayFourCloudCover5: Int = 0, dayFourCloudCover6: Int = 0, dayFourCloudCover7: Int = 0, dayFourCloudCover8: Int = 0, dayFourCloudCover9: Int = 0, dayFourCloudCover10: Int = 0, dayFourCloudCover11: Int = 0, dayFourCloudCover12: Int = 0, dayFourCloudCover13: Int = 0, dayFourCloudCover14: Int = 0, dayFourCloudCover15: Int = 0

// Day Five
// Condition
var dayFiveCondition0: String = "", dayFiveCondition1: String = "", dayFiveCondition2: String = "", dayFiveCondition3: String = "", dayFiveCondition4: String = "", dayFiveCondition5: String = "", dayFiveCondition6: String = "", dayFiveCondition7: String = "", dayFiveCondition8: String = "", dayFiveCondition9: String = "", dayFiveCondition10: String = "", dayFiveCondition11: String = "", dayFiveCondition12: String = "", dayFiveCondition13: String = "", dayFiveCondition14: String = "", dayFiveCondition15: String = ""
// Precip
var dayFivePrecip0: Int = 0, dayFivePrecip1: Int = 0, dayFivePrecip2: Int = 0, dayFivePrecip3: Int = 0, dayFivePrecip4: Int = 0, dayFivePrecip5: Int = 0, dayFivePrecip6: Int = 0, dayFivePrecip7: Int = 0, dayFivePrecip8: Int = 0, dayFivePrecip9: Int = 0, dayFivePrecip10: Int = 0, dayFivePrecip11: Int = 0, dayFivePrecip12: Int = 0, dayFivePrecip13: Int = 0, dayFivePrecip14: Int = 0, dayFivePrecip15: Int = 0
// Temp
var dayFiveTemp0: Int = 0, dayFiveTemp1: Int = 0, dayFiveTemp2: Int = 0, dayFiveTemp3: Int = 0, dayFiveTemp4: Int = 0, dayFiveTemp5: Int = 0, dayFiveTemp6: Int = 0, dayFiveTemp7: Int = 0, dayFiveTemp8: Int = 0, dayFiveTemp9: Int = 0, dayFiveTemp10: Int = 0, dayFiveTemp11: Int = 0, dayFiveTemp12: Int = 0, dayFiveTemp13: Int = 0, dayFiveTemp14: Int = 0, dayFiveTemp15: Int = 0
// Humidity
var dayFiveHumidity0: Int = 0, dayFiveHumidity1: Int = 0, dayFiveHumidity2: Int = 0, dayFiveHumidity3: Int = 0, dayFiveHumidity4: Int = 0, dayFiveHumidity5: Int = 0, dayFiveHumidity6: Int = 0, dayFiveHumidity7: Int = 0, dayFiveHumidity8: Int = 0, dayFiveHumidity9: Int = 0, dayFiveHumidity10: Int = 0, dayFiveHumidity11: Int = 0, dayFiveHumidity12: Int = 0, dayFiveHumidity13: Int = 0, dayFiveHumidity14: Int = 0, dayFiveHumidity15: Int = 0
// Icon
var dayFiveIcon0: String = "", dayFiveIcon1: String = "", dayFiveIcon2: String = "", dayFiveIcon3: String = "", dayFiveIcon4: String = "", dayFiveIcon5: String = "", dayFiveIcon6: String = "", dayFiveIcon7: String = "", dayFiveIcon8: String = "", dayFiveIcon9: String = "", dayFiveIcon10: String = "", dayFiveIcon11: String = "", dayFiveIcon12: String = "", dayFiveIcon13: String = "", dayFiveIcon14: String = "", dayFiveIcon15: String = ""
// UV Index
var dayFiveIndex0: Int = 0, dayFiveIndex1: Int = 0, dayFiveIndex2: Int = 0, dayFiveIndex3: Int = 0, dayFiveIndex4: Int = 0, dayFiveIndex5: Int = 0, dayFiveIndex6: Int = 0, dayFiveIndex7: Int = 0, dayFiveIndex8: Int = 0, dayFiveIndex9: Int = 0, dayFiveIndex10: Int = 0, dayFiveIndex11: Int = 0, dayFiveIndex12: Int = 0, dayFiveIndex13: Int = 0, dayFiveIndex14: Int = 0, dayFiveIndex15: Int = 0
// Wind Speed
var dayFiveWindSpeed0: Int = 0, dayFiveWindSpeed1: Int = 0, dayFiveWindSpeed2: Int = 0, dayFiveWindSpeed3: Int = 0, dayFiveWindSpeed4: Int = 0, dayFiveWindSpeed5: Int = 0, dayFiveWindSpeed6: Int = 0, dayFiveWindSpeed7: Int = 0, dayFiveWindSpeed8: Int = 0, dayFiveWindSpeed9: Int = 0, dayFiveWindSpeed10: Int = 0, dayFiveWindSpeed11: Int = 0, dayFiveWindSpeed12: Int = 0, dayFiveWindSpeed13: Int = 0, dayFiveWindSpeed14: Int = 0, dayFiveWindSpeed15: Int = 0
// Cloud Cover
var dayFiveCloudCover0: Int = 0, dayFiveCloudCover1: Int = 0, dayFiveCloudCover2: Int = 0, dayFiveCloudCover3: Int = 0, dayFiveCloudCover4: Int = 0, dayFiveCloudCover5: Int = 0, dayFiveCloudCover6: Int = 0, dayFiveCloudCover7: Int = 0, dayFiveCloudCover8: Int = 0, dayFiveCloudCover9: Int = 0, dayFiveCloudCover10: Int = 0, dayFiveCloudCover11: Int = 0, dayFiveCloudCover12: Int = 0, dayFiveCloudCover13: Int = 0, dayFiveCloudCover14: Int = 0, dayFiveCloudCover15: Int = 0

// Day Six
// Condition
var daySixCondition0: String = "", daySixCondition1: String = "", daySixCondition2: String = "", daySixCondition3: String = "", daySixCondition4: String = "", daySixCondition5: String = "", daySixCondition6: String = "", daySixCondition7: String = "", daySixCondition8: String = "", daySixCondition9: String = "", daySixCondition10: String = "", daySixCondition11: String = "", daySixCondition12: String = "", daySixCondition13: String = "", daySixCondition14: String = "", daySixCondition15: String = ""
// Precip
var daySixPrecip0: Int = 0, daySixPrecip1: Int = 0, daySixPrecip2: Int = 0, daySixPrecip3: Int = 0, daySixPrecip4: Int = 0, daySixPrecip5: Int = 0, daySixPrecip6: Int = 0, daySixPrecip7: Int = 0, daySixPrecip8: Int = 0, daySixPrecip9: Int = 0, daySixPrecip10: Int = 0, daySixPrecip11: Int = 0, daySixPrecip12: Int = 0, daySixPrecip13: Int = 0, daySixPrecip14: Int = 0, daySixPrecip15: Int = 0
// Temp
var daySixTemp0: Int = 0, daySixTemp1: Int = 0, daySixTemp2: Int = 0, daySixTemp3: Int = 0, daySixTemp4: Int = 0, daySixTemp5: Int = 0, daySixTemp6: Int = 0, daySixTemp7: Int = 0, daySixTemp8: Int = 0, daySixTemp9: Int = 0, daySixTemp10: Int = 0, daySixTemp11: Int = 0, daySixTemp12: Int = 0, daySixTemp13: Int = 0, daySixTemp14: Int = 0, daySixTemp15: Int = 0
// Humidity
var daySixHumidity0: Int = 0, daySixHumidity1: Int = 0, daySixHumidity2: Int = 0, daySixHumidity3: Int = 0, daySixHumidity4: Int = 0, daySixHumidity5: Int = 0, daySixHumidity6: Int = 0, daySixHumidity7: Int = 0, daySixHumidity8: Int = 0, daySixHumidity9: Int = 0, daySixHumidity10: Int = 0, daySixHumidity11: Int = 0, daySixHumidity12: Int = 0, daySixHumidity13: Int = 0, daySixHumidity14: Int = 0, daySixHumidity15: Int = 0
// Icon
var daySixIcon0: String = "", daySixIcon1: String = "", daySixIcon2: String = "", daySixIcon3: String = "", daySixIcon4: String = "", daySixIcon5: String = "", daySixIcon6: String = "", daySixIcon7: String = "", daySixIcon8: String = "", daySixIcon9: String = "", daySixIcon10: String = "", daySixIcon11: String = "", daySixIcon12: String = "", daySixIcon13: String = "", daySixIcon14: String = "", daySixIcon15: String = ""
// UV Index
var daySixIndex0: Int = 0, daySixIndex1: Int = 0, daySixIndex2: Int = 0, daySixIndex3: Int = 0, daySixIndex4: Int = 0, daySixIndex5: Int = 0, daySixIndex6: Int = 0, daySixIndex7: Int = 0, daySixIndex8: Int = 0, daySixIndex9: Int = 0, daySixIndex10: Int = 0, daySixIndex11: Int = 0, daySixIndex12: Int = 0, daySixIndex13: Int = 0, daySixIndex14: Int = 0, daySixIndex15: Int = 0
// Wind Speed
var daySixWindSpeed0: Int = 0, daySixWindSpeed1: Int = 0, daySixWindSpeed2: Int = 0, daySixWindSpeed3: Int = 0, daySixWindSpeed4: Int = 0, daySixWindSpeed5: Int = 0, daySixWindSpeed6: Int = 0, daySixWindSpeed7: Int = 0, daySixWindSpeed8: Int = 0, daySixWindSpeed9: Int = 0, daySixWindSpeed10: Int = 0, daySixWindSpeed11: Int = 0, daySixWindSpeed12: Int = 0, daySixWindSpeed13: Int = 0, daySixWindSpeed14: Int = 0, daySixWindSpeed15: Int = 0
// Cloud Cover
var daySixCloudCover0: Int = 0, daySixCloudCover1: Int = 0, daySixCloudCover2: Int = 0, daySixCloudCover3: Int = 0, daySixCloudCover4: Int = 0, daySixCloudCover5: Int = 0, daySixCloudCover6: Int = 0, daySixCloudCover7: Int = 0, daySixCloudCover8: Int = 0, daySixCloudCover9: Int = 0, daySixCloudCover10: Int = 0, daySixCloudCover11: Int = 0, daySixCloudCover12: Int = 0, daySixCloudCover13: Int = 0, daySixCloudCover14: Int = 0, daySixCloudCover15: Int = 0

// Day Seven
// Condition
var daySevenCondition0: String = "", daySevenCondition1: String = "", daySevenCondition2: String = "", daySevenCondition3: String = "", daySevenCondition4: String = "", daySevenCondition5: String = "", daySevenCondition6: String = "", daySevenCondition7: String = "", daySevenCondition8: String = "", daySevenCondition9: String = "", daySevenCondition10: String = "", daySevenCondition11: String = "", daySevenCondition12: String = "", daySevenCondition13: String = "", daySevenCondition14: String = "", daySevenCondition15: String = ""
// Precip
var daySevenPrecip0: Int = 0, daySevenPrecip1: Int = 0, daySevenPrecip2: Int = 0, daySevenPrecip3: Int = 0, daySevenPrecip4: Int = 0, daySevenPrecip5: Int = 0, daySevenPrecip6: Int = 0, daySevenPrecip7: Int = 0, daySevenPrecip8: Int = 0, daySevenPrecip9: Int = 0, daySevenPrecip10: Int = 0, daySevenPrecip11: Int = 0, daySevenPrecip12: Int = 0, daySevenPrecip13: Int = 0, daySevenPrecip14: Int = 0, daySevenPrecip15: Int = 0
// Temp
var daySevenTemp0: Int = 0, daySevenTemp1: Int = 0, daySevenTemp2: Int = 0, daySevenTemp3: Int = 0, daySevenTemp4: Int = 0, daySevenTemp5: Int = 0, daySevenTemp6: Int = 0, daySevenTemp7: Int = 0, daySevenTemp8: Int = 0, daySevenTemp9: Int = 0, daySevenTemp10: Int = 0, daySevenTemp11: Int = 0, daySevenTemp12: Int = 0, daySevenTemp13: Int = 0, daySevenTemp14: Int = 0, daySevenTemp15: Int = 0
// Humidity
var daySevenHumidity0: Int = 0, daySevenHumidity1: Int = 0, daySevenHumidity2: Int = 0, daySevenHumidity3: Int = 0, daySevenHumidity4: Int = 0, daySevenHumidity5: Int = 0, daySevenHumidity6: Int = 0, daySevenHumidity7: Int = 0, daySevenHumidity8: Int = 0, daySevenHumidity9: Int = 0, daySevenHumidity10: Int = 0, daySevenHumidity11: Int = 0, daySevenHumidity12: Int = 0, daySevenHumidity13: Int = 0, daySevenHumidity14: Int = 0, daySevenHumidity15: Int = 0
// Icon
var daySevenIcon0: String = "", daySevenIcon1: String = "", daySevenIcon2: String = "", daySevenIcon3: String = "", daySevenIcon4: String = "", daySevenIcon5: String = "", daySevenIcon6: String = "", daySevenIcon7: String = "", daySevenIcon8: String = "", daySevenIcon9: String = "", daySevenIcon10: String = "", daySevenIcon11: String = "", daySevenIcon12: String = "", daySevenIcon13: String = "", daySevenIcon14: String = "", daySevenIcon15: String = ""
// UV Index
var daySevenIndex0: Int = 0, daySevenIndex1: Int = 0, daySevenIndex2: Int = 0, daySevenIndex3: Int = 0, daySevenIndex4: Int = 0, daySevenIndex5: Int = 0, daySevenIndex6: Int = 0, daySevenIndex7: Int = 0, daySevenIndex8: Int = 0, daySevenIndex9: Int = 0, daySevenIndex10: Int = 0, daySevenIndex11: Int = 0, daySevenIndex12: Int = 0, daySevenIndex13: Int = 0, daySevenIndex14: Int = 0, daySevenIndex15: Int = 0
// Wind Speed
var daySevenWindSpeed0: Int = 0, daySevenWindSpeed1: Int = 0, daySevenWindSpeed2: Int = 0, daySevenWindSpeed3: Int = 0, daySevenWindSpeed4: Int = 0, daySevenWindSpeed5: Int = 0, daySevenWindSpeed6: Int = 0, daySevenWindSpeed7: Int = 0, daySevenWindSpeed8: Int = 0, daySevenWindSpeed9: Int = 0, daySevenWindSpeed10: Int = 0, daySevenWindSpeed11: Int = 0, daySevenWindSpeed12: Int = 0, daySevenWindSpeed13: Int = 0, daySevenWindSpeed14: Int = 0, daySevenWindSpeed15: Int = 0
// Cloud Cover
var daySevenCloudCover0: Int = 0, daySevenCloudCover1: Int = 0, daySevenCloudCover2: Int = 0, daySevenCloudCover3: Int = 0, daySevenCloudCover4: Int = 0, daySevenCloudCover5: Int = 0, daySevenCloudCover6: Int = 0, daySevenCloudCover7: Int = 0, daySevenCloudCover8: Int = 0, daySevenCloudCover9: Int = 0, daySevenCloudCover10: Int = 0, daySevenCloudCover11: Int = 0, daySevenCloudCover12: Int = 0, daySevenCloudCover13: Int = 0, daySevenCloudCover14: Int = 0, daySevenCloudCover15: Int = 0

// Day Eight
// Condition
var dayEightCondition0: String = "", dayEightCondition1: String = "", dayEightCondition2: String = "", dayEightCondition3: String = "", dayEightCondition4: String = "", dayEightCondition5: String = "", dayEightCondition6: String = "", dayEightCondition7: String = "", dayEightCondition8: String = "", dayEightCondition9: String = "", dayEightCondition10: String = "", dayEightCondition11: String = "", dayEightCondition12: String = "", dayEightCondition13: String = "", dayEightCondition14: String = "", dayEightCondition15: String = ""
// Precip
var dayEightPrecip0: Int = 0, dayEightPrecip1: Int = 0, dayEightPrecip2: Int = 0, dayEightPrecip3: Int = 0, dayEightPrecip4: Int = 0, dayEightPrecip5: Int = 0, dayEightPrecip6: Int = 0, dayEightPrecip7: Int = 0, dayEightPrecip8: Int = 0, dayEightPrecip9: Int = 0, dayEightPrecip10: Int = 0, dayEightPrecip11: Int = 0, dayEightPrecip12: Int = 0, dayEightPrecip13: Int = 0, dayEightPrecip14: Int = 0, dayEightPrecip15: Int = 0
// Temp
var dayEightTemp0: Int = 0, dayEightTemp1: Int = 0, dayEightTemp2: Int = 0, dayEightTemp3: Int = 0, dayEightTemp4: Int = 0, dayEightTemp5: Int = 0, dayEightTemp6: Int = 0, dayEightTemp7: Int = 0, dayEightTemp8: Int = 0, dayEightTemp9: Int = 0, dayEightTemp10: Int = 0, dayEightTemp11: Int = 0, dayEightTemp12: Int = 0, dayEightTemp13: Int = 0, dayEightTemp14: Int = 0, dayEightTemp15: Int = 0
// Humidity
var dayEightHumidity0: Int = 0, dayEightHumidity1: Int = 0, dayEightHumidity2: Int = 0, dayEightHumidity3: Int = 0, dayEightHumidity4: Int = 0, dayEightHumidity5: Int = 0, dayEightHumidity6: Int = 0, dayEightHumidity7: Int = 0, dayEightHumidity8: Int = 0, dayEightHumidity9: Int = 0, dayEightHumidity10: Int = 0, dayEightHumidity11: Int = 0, dayEightHumidity12: Int = 0, dayEightHumidity13: Int = 0, dayEightHumidity14: Int = 0, dayEightHumidity15: Int = 0
// Icon
var dayEightIcon0: String = "", dayEightIcon1: String = "", dayEightIcon2: String = "", dayEightIcon3: String = "", dayEightIcon4: String = "", dayEightIcon5: String = "", dayEightIcon6: String = "", dayEightIcon7: String = "", dayEightIcon8: String = "", dayEightIcon9: String = "", dayEightIcon10: String = "", dayEightIcon11: String = "", dayEightIcon12: String = "", dayEightIcon13: String = "", dayEightIcon14: String = "", dayEightIcon15: String = ""
// UV Index
var dayEightIndex0: Int = 0, dayEightIndex1: Int = 0, dayEightIndex2: Int = 0, dayEightIndex3: Int = 0, dayEightIndex4: Int = 0, dayEightIndex5: Int = 0, dayEightIndex6: Int = 0, dayEightIndex7: Int = 0, dayEightIndex8: Int = 0, dayEightIndex9: Int = 0, dayEightIndex10: Int = 0, dayEightIndex11: Int = 0, dayEightIndex12: Int = 0, dayEightIndex13: Int = 0, dayEightIndex14: Int = 0, dayEightIndex15: Int = 0
// Wind Speed
var dayEightWindSpeed0: Int = 0, dayEightWindSpeed1: Int = 0, dayEightWindSpeed2: Int = 0, dayEightWindSpeed3: Int = 0, dayEightWindSpeed4: Int = 0, dayEightWindSpeed5: Int = 0, dayEightWindSpeed6: Int = 0, dayEightWindSpeed7: Int = 0, dayEightWindSpeed8: Int = 0, dayEightWindSpeed9: Int = 0, dayEightWindSpeed10: Int = 0, dayEightWindSpeed11: Int = 0, dayEightWindSpeed12: Int = 0, dayEightWindSpeed13: Int = 0, dayEightWindSpeed14: Int = 0, dayEightWindSpeed15: Int = 0
// Cloud Cover
var dayEightCloudCover0: Int = 0, dayEightCloudCover1: Int = 0, dayEightCloudCover2: Int = 0, dayEightCloudCover3: Int = 0, dayEightCloudCover4: Int = 0, dayEightCloudCover5: Int = 0, dayEightCloudCover6: Int = 0, dayEightCloudCover7: Int = 0, dayEightCloudCover8: Int = 0, dayEightCloudCover9: Int = 0, dayEightCloudCover10: Int = 0, dayEightCloudCover11: Int = 0, dayEightCloudCover12: Int = 0, dayEightCloudCover13: Int = 0, dayEightCloudCover14: Int = 0, dayEightCloudCover15: Int = 0

// Day Nine
// Condition
var dayNineCondition0: String = "", dayNineCondition1: String = "", dayNineCondition2: String = "", dayNineCondition3: String = "", dayNineCondition4: String = "", dayNineCondition5: String = "", dayNineCondition6: String = "", dayNineCondition7: String = "", dayNineCondition8: String = "", dayNineCondition9: String = "", dayNineCondition10: String = "", dayNineCondition11: String = "", dayNineCondition12: String = "", dayNineCondition13: String = "", dayNineCondition14: String = "", dayNineCondition15: String = ""
// Precip
var dayNinePrecip0: Int = 0, dayNinePrecip1: Int = 0, dayNinePrecip2: Int = 0, dayNinePrecip3: Int = 0, dayNinePrecip4: Int = 0, dayNinePrecip5: Int = 0, dayNinePrecip6: Int = 0, dayNinePrecip7: Int = 0, dayNinePrecip8: Int = 0, dayNinePrecip9: Int = 0, dayNinePrecip10: Int = 0, dayNinePrecip11: Int = 0, dayNinePrecip12: Int = 0, dayNinePrecip13: Int = 0, dayNinePrecip14: Int = 0, dayNinePrecip15: Int = 0
// Temp
var dayNineTemp0: Int = 0, dayNineTemp1: Int = 0, dayNineTemp2: Int = 0, dayNineTemp3: Int = 0, dayNineTemp4: Int = 0, dayNineTemp5: Int = 0, dayNineTemp6: Int = 0, dayNineTemp7: Int = 0, dayNineTemp8: Int = 0, dayNineTemp9: Int = 0, dayNineTemp10: Int = 0, dayNineTemp11: Int = 0, dayNineTemp12: Int = 0, dayNineTemp13: Int = 0, dayNineTemp14: Int = 0, dayNineTemp15: Int = 0
// Humidity
var dayNineHumidity0: Int = 0, dayNineHumidity1: Int = 0, dayNineHumidity2: Int = 0, dayNineHumidity3: Int = 0, dayNineHumidity4: Int = 0, dayNineHumidity5: Int = 0, dayNineHumidity6: Int = 0, dayNineHumidity7: Int = 0, dayNineHumidity8: Int = 0, dayNineHumidity9: Int = 0, dayNineHumidity10: Int = 0, dayNineHumidity11: Int = 0, dayNineHumidity12: Int = 0, dayNineHumidity13: Int = 0, dayNineHumidity14: Int = 0, dayNineHumidity15: Int = 0
// Icon
var dayNineIcon0: String = "", dayNineIcon1: String = "", dayNineIcon2: String = "", dayNineIcon3: String = "", dayNineIcon4: String = "", dayNineIcon5: String = "", dayNineIcon6: String = "", dayNineIcon7: String = "", dayNineIcon8: String = "", dayNineIcon9: String = "", dayNineIcon10: String = "", dayNineIcon11: String = "", dayNineIcon12: String = "", dayNineIcon13: String = "", dayNineIcon14: String = "", dayNineIcon15: String = ""
// UV Index
var dayNineIndex0: Int = 0, dayNineIndex1: Int = 0, dayNineIndex2: Int = 0, dayNineIndex3: Int = 0, dayNineIndex4: Int = 0, dayNineIndex5: Int = 0, dayNineIndex6: Int = 0, dayNineIndex7: Int = 0, dayNineIndex8: Int = 0, dayNineIndex9: Int = 0, dayNineIndex10: Int = 0, dayNineIndex11: Int = 0, dayNineIndex12: Int = 0, dayNineIndex13: Int = 0, dayNineIndex14: Int = 0, dayNineIndex15: Int = 0
// Wind Speed
var dayNineWindSpeed0: Int = 0, dayNineWindSpeed1: Int = 0, dayNineWindSpeed2: Int = 0, dayNineWindSpeed3: Int = 0, dayNineWindSpeed4: Int = 0, dayNineWindSpeed5: Int = 0, dayNineWindSpeed6: Int = 0, dayNineWindSpeed7: Int = 0, dayNineWindSpeed8: Int = 0, dayNineWindSpeed9: Int = 0, dayNineWindSpeed10: Int = 0, dayNineWindSpeed11: Int = 0, dayNineWindSpeed12: Int = 0, dayNineWindSpeed13: Int = 0, dayNineWindSpeed14: Int = 0, dayNineWindSpeed15: Int = 0
// Cloud Cover
var dayNineCloudCover0: Int = 0, dayNineCloudCover1: Int = 0, dayNineCloudCover2: Int = 0, dayNineCloudCover3: Int = 0, dayNineCloudCover4: Int = 0, dayNineCloudCover5: Int = 0, dayNineCloudCover6: Int = 0, dayNineCloudCover7: Int = 0, dayNineCloudCover8: Int = 0, dayNineCloudCover9: Int = 0, dayNineCloudCover10: Int = 0, dayNineCloudCover11: Int = 0, dayNineCloudCover12: Int = 0, dayNineCloudCover13: Int = 0, dayNineCloudCover14: Int = 0, dayNineCloudCover15: Int = 0

// Day Ten
// Condition
var dayTenCondition0: String = "", dayTenCondition1: String = "", dayTenCondition2: String = "", dayTenCondition3: String = "", dayTenCondition4: String = "", dayTenCondition5: String = "", dayTenCondition6: String = "", dayTenCondition7: String = "", dayTenCondition8: String = "", dayTenCondition9: String = "", dayTenCondition10: String = "", dayTenCondition11: String = "", dayTenCondition12: String = "", dayTenCondition13: String = "", dayTenCondition14: String = "", dayTenCondition15: String = ""
// Precip
var dayTenPrecip0: Int = 0, dayTenPrecip1: Int = 0, dayTenPrecip2: Int = 0, dayTenPrecip3: Int = 0, dayTenPrecip4: Int = 0, dayTenPrecip5: Int = 0, dayTenPrecip6: Int = 0, dayTenPrecip7: Int = 0, dayTenPrecip8: Int = 0, dayTenPrecip9: Int = 0, dayTenPrecip10: Int = 0, dayTenPrecip11: Int = 0, dayTenPrecip12: Int = 0, dayTenPrecip13: Int = 0, dayTenPrecip14: Int = 0, dayTenPrecip15: Int = 0
// Temp
var dayTenTemp0: Int = 0, dayTenTemp1: Int = 0, dayTenTemp2: Int = 0, dayTenTemp3: Int = 0, dayTenTemp4: Int = 0, dayTenTemp5: Int = 0, dayTenTemp6: Int = 0, dayTenTemp7: Int = 0, dayTenTemp8: Int = 0, dayTenTemp9: Int = 0, dayTenTemp10: Int = 0, dayTenTemp11: Int = 0, dayTenTemp12: Int = 0, dayTenTemp13: Int = 0, dayTenTemp14: Int = 0, dayTenTemp15: Int = 0
// Humidity
var dayTenHumidity0: Int = 0, dayTenHumidity1: Int = 0, dayTenHumidity2: Int = 0, dayTenHumidity3: Int = 0, dayTenHumidity4: Int = 0, dayTenHumidity5: Int = 0, dayTenHumidity6: Int = 0, dayTenHumidity7: Int = 0, dayTenHumidity8: Int = 0, dayTenHumidity9: Int = 0, dayTenHumidity10: Int = 0, dayTenHumidity11: Int = 0, dayTenHumidity12: Int = 0, dayTenHumidity13: Int = 0, dayTenHumidity14: Int = 0, dayTenHumidity15: Int = 0
// Icon
var dayTenIcon0: String = "", dayTenIcon1: String = "", dayTenIcon2: String = "", dayTenIcon3: String = "", dayTenIcon4: String = "", dayTenIcon5: String = "", dayTenIcon6: String = "", dayTenIcon7: String = "", dayTenIcon8: String = "", dayTenIcon9: String = "", dayTenIcon10: String = "", dayTenIcon11: String = "", dayTenIcon12: String = "", dayTenIcon13: String = "", dayTenIcon14: String = "", dayTenIcon15: String = ""
// UV Index
var dayTenIndex0: Int = 0, dayTenIndex1: Int = 0, dayTenIndex2: Int = 0, dayTenIndex3: Int = 0, dayTenIndex4: Int = 0, dayTenIndex5: Int = 0, dayTenIndex6: Int = 0, dayTenIndex7: Int = 0, dayTenIndex8: Int = 0, dayTenIndex9: Int = 0, dayTenIndex10: Int = 0, dayTenIndex11: Int = 0, dayTenIndex12: Int = 0, dayTenIndex13: Int = 0, dayTenIndex14: Int = 0, dayTenIndex15: Int = 0
// Wind Speed
var dayTenWindSpeed0: Int = 0, dayTenWindSpeed1: Int = 0, dayTenWindSpeed2: Int = 0, dayTenWindSpeed3: Int = 0, dayTenWindSpeed4: Int = 0, dayTenWindSpeed5: Int = 0, dayTenWindSpeed6: Int = 0, dayTenWindSpeed7: Int = 0, dayTenWindSpeed8: Int = 0, dayTenWindSpeed9: Int = 0, dayTenWindSpeed10: Int = 0, dayTenWindSpeed11: Int = 0, dayTenWindSpeed12: Int = 0, dayTenWindSpeed13: Int = 0, dayTenWindSpeed14: Int = 0, dayTenWindSpeed15: Int = 0
// Cloud Cover
var dayTenCloudCover0: Int = 0, dayTenCloudCover1: Int = 0, dayTenCloudCover2: Int = 0, dayTenCloudCover3: Int = 0, dayTenCloudCover4: Int = 0, dayTenCloudCover5: Int = 0, dayTenCloudCover6: Int = 0, dayTenCloudCover7: Int = 0, dayTenCloudCover8: Int = 0, dayTenCloudCover9: Int = 0, dayTenCloudCover10: Int = 0, dayTenCloudCover11: Int = 0, dayTenCloudCover12: Int = 0, dayTenCloudCover13: Int = 0, dayTenCloudCover14: Int = 0, dayTenCloudCover15: Int = 0

// Day Eleven
// Condition
var dayElevenCondition0: String = "", dayElevenCondition1: String = "", dayElevenCondition2: String = "", dayElevenCondition3: String = "", dayElevenCondition4: String = "", dayElevenCondition5: String = "", dayElevenCondition6: String = "", dayElevenCondition7: String = "", dayElevenCondition8: String = "", dayElevenCondition9: String = "", dayElevenCondition10: String = "", dayElevenCondition11: String = "", dayElevenCondition12: String = "", dayElevenCondition13: String = "", dayElevenCondition14: String = "", dayElevenCondition15: String = ""
// Precip
var dayElevenPrecip0: Int = 0, dayElevenPrecip1: Int = 0, dayElevenPrecip2: Int = 0, dayElevenPrecip3: Int = 0, dayElevenPrecip4: Int = 0, dayElevenPrecip5: Int = 0, dayElevenPrecip6: Int = 0, dayElevenPrecip7: Int = 0, dayElevenPrecip8: Int = 0, dayElevenPrecip9: Int = 0, dayElevenPrecip10: Int = 0, dayElevenPrecip11: Int = 0, dayElevenPrecip12: Int = 0, dayElevenPrecip13: Int = 0, dayElevenPrecip14: Int = 0, dayElevenPrecip15: Int = 0
// Temp
var dayElevenTemp0: Int = 0, dayElevenTemp1: Int = 0, dayElevenTemp2: Int = 0, dayElevenTemp3: Int = 0, dayElevenTemp4: Int = 0, dayElevenTemp5: Int = 0, dayElevenTemp6: Int = 0, dayElevenTemp7: Int = 0, dayElevenTemp8: Int = 0, dayElevenTemp9: Int = 0, dayElevenTemp10: Int = 0, dayElevenTemp11: Int = 0, dayElevenTemp12: Int = 0, dayElevenTemp13: Int = 0, dayElevenTemp14: Int = 0, dayElevenTemp15: Int = 0
// Humidity
var dayElevenHumidity0: Int = 0, dayElevenHumidity1: Int = 0, dayElevenHumidity2: Int = 0, dayElevenHumidity3: Int = 0, dayElevenHumidity4: Int = 0, dayElevenHumidity5: Int = 0, dayElevenHumidity6: Int = 0, dayElevenHumidity7: Int = 0, dayElevenHumidity8: Int = 0, dayElevenHumidity9: Int = 0, dayElevenHumidity10: Int = 0, dayElevenHumidity11: Int = 0, dayElevenHumidity12: Int = 0, dayElevenHumidity13: Int = 0, dayElevenHumidity14: Int = 0, dayElevenHumidity15: Int = 0
// Icon
var dayElevenIcon0: String = "", dayElevenIcon1: String = "", dayElevenIcon2: String = "", dayElevenIcon3: String = "", dayElevenIcon4: String = "", dayElevenIcon5: String = "", dayElevenIcon6: String = "", dayElevenIcon7: String = "", dayElevenIcon8: String = "", dayElevenIcon9: String = "", dayElevenIcon10: String = "", dayElevenIcon11: String = "", dayElevenIcon12: String = "", dayElevenIcon13: String = "", dayElevenIcon14: String = "", dayElevenIcon15: String = ""
// UV Index
var dayElevenIndex0: Int = 0, dayElevenIndex1: Int = 0, dayElevenIndex2: Int = 0, dayElevenIndex3: Int = 0, dayElevenIndex4: Int = 0, dayElevenIndex5: Int = 0, dayElevenIndex6: Int = 0, dayElevenIndex7: Int = 0, dayElevenIndex8: Int = 0, dayElevenIndex9: Int = 0, dayElevenIndex10: Int = 0, dayElevenIndex11: Int = 0, dayElevenIndex12: Int = 0, dayElevenIndex13: Int = 0, dayElevenIndex14: Int = 0, dayElevenIndex15: Int = 0
// Wind Speed
var dayElevenWindSpeed0: Int = 0, dayElevenWindSpeed1: Int = 0, dayElevenWindSpeed2: Int = 0, dayElevenWindSpeed3: Int = 0, dayElevenWindSpeed4: Int = 0, dayElevenWindSpeed5: Int = 0, dayElevenWindSpeed6: Int = 0, dayElevenWindSpeed7: Int = 0, dayElevenWindSpeed8: Int = 0, dayElevenWindSpeed9: Int = 0, dayElevenWindSpeed10: Int = 0, dayElevenWindSpeed11: Int = 0, dayElevenWindSpeed12: Int = 0, dayElevenWindSpeed13: Int = 0, dayElevenWindSpeed14: Int = 0, dayElevenWindSpeed15: Int = 0
// Cloud Cover
var dayElevenCloudCover0: Int = 0, dayElevenCloudCover1: Int = 0, dayElevenCloudCover2: Int = 0, dayElevenCloudCover3: Int = 0, dayElevenCloudCover4: Int = 0, dayElevenCloudCover5: Int = 0, dayElevenCloudCover6: Int = 0, dayElevenCloudCover7: Int = 0, dayElevenCloudCover8: Int = 0, dayElevenCloudCover9: Int = 0, dayElevenCloudCover10: Int = 0, dayElevenCloudCover11: Int = 0, dayElevenCloudCover12: Int = 0, dayElevenCloudCover13: Int = 0, dayElevenCloudCover14: Int = 0, dayElevenCloudCover15: Int = 0

// Day Twelve
// Condition
var dayTwelveCondition0: String = "", dayTwelveCondition1: String = "", dayTwelveCondition2: String = "", dayTwelveCondition3: String = "", dayTwelveCondition4: String = "", dayTwelveCondition5: String = "", dayTwelveCondition6: String = "", dayTwelveCondition7: String = "", dayTwelveCondition8: String = "", dayTwelveCondition9: String = "", dayTwelveCondition10: String = "", dayTwelveCondition11: String = "", dayTwelveCondition12: String = "", dayTwelveCondition13: String = "", dayTwelveCondition14: String = "", dayTwelveCondition15: String = ""
// Precip
var dayTwelvePrecip0: Int = 0, dayTwelvePrecip1: Int = 0, dayTwelvePrecip2: Int = 0, dayTwelvePrecip3: Int = 0, dayTwelvePrecip4: Int = 0, dayTwelvePrecip5: Int = 0, dayTwelvePrecip6: Int = 0, dayTwelvePrecip7: Int = 0, dayTwelvePrecip8: Int = 0, dayTwelvePrecip9: Int = 0, dayTwelvePrecip10: Int = 0, dayTwelvePrecip11: Int = 0, dayTwelvePrecip12: Int = 0, dayTwelvePrecip13: Int = 0, dayTwelvePrecip14: Int = 0, dayTwelvePrecip15: Int = 0
// Temp
var dayTwelveTemp0: Int = 0, dayTwelveTemp1: Int = 0, dayTwelveTemp2: Int = 0, dayTwelveTemp3: Int = 0, dayTwelveTemp4: Int = 0, dayTwelveTemp5: Int = 0, dayTwelveTemp6: Int = 0, dayTwelveTemp7: Int = 0, dayTwelveTemp8: Int = 0, dayTwelveTemp9: Int = 0, dayTwelveTemp10: Int = 0, dayTwelveTemp11: Int = 0, dayTwelveTemp12: Int = 0, dayTwelveTemp13: Int = 0, dayTwelveTemp14: Int = 0, dayTwelveTemp15: Int = 0
// Humidity
var dayTwelveHumidity0: Int = 0, dayTwelveHumidity1: Int = 0, dayTwelveHumidity2: Int = 0, dayTwelveHumidity3: Int = 0, dayTwelveHumidity4: Int = 0, dayTwelveHumidity5: Int = 0, dayTwelveHumidity6: Int = 0, dayTwelveHumidity7: Int = 0, dayTwelveHumidity8: Int = 0, dayTwelveHumidity9: Int = 0, dayTwelveHumidity10: Int = 0, dayTwelveHumidity11: Int = 0, dayTwelveHumidity12: Int = 0, dayTwelveHumidity13: Int = 0, dayTwelveHumidity14: Int = 0, dayTwelveHumidity15: Int = 0
// Icon
var dayTwelveIcon0: String = "", dayTwelveIcon1: String = "", dayTwelveIcon2: String = "", dayTwelveIcon3: String = "", dayTwelveIcon4: String = "", dayTwelveIcon5: String = "", dayTwelveIcon6: String = "", dayTwelveIcon7: String = "", dayTwelveIcon8: String = "", dayTwelveIcon9: String = "", dayTwelveIcon10: String = "", dayTwelveIcon11: String = "", dayTwelveIcon12: String = "", dayTwelveIcon13: String = "", dayTwelveIcon14: String = "", dayTwelveIcon15: String = ""
// UV Index
var dayTwelveIndex0: Int = 0, dayTwelveIndex1: Int = 0, dayTwelveIndex2: Int = 0, dayTwelveIndex3: Int = 0, dayTwelveIndex4: Int = 0, dayTwelveIndex5: Int = 0, dayTwelveIndex6: Int = 0, dayTwelveIndex7: Int = 0, dayTwelveIndex8: Int = 0, dayTwelveIndex9: Int = 0, dayTwelveIndex10: Int = 0, dayTwelveIndex11: Int = 0, dayTwelveIndex12: Int = 0, dayTwelveIndex13: Int = 0, dayTwelveIndex14: Int = 0, dayTwelveIndex15: Int = 0
// Wind Speed
var dayTwelveWindSpeed0: Int = 0, dayTwelveWindSpeed1: Int = 0, dayTwelveWindSpeed2: Int = 0, dayTwelveWindSpeed3: Int = 0, dayTwelveWindSpeed4: Int = 0, dayTwelveWindSpeed5: Int = 0, dayTwelveWindSpeed6: Int = 0, dayTwelveWindSpeed7: Int = 0, dayTwelveWindSpeed8: Int = 0, dayTwelveWindSpeed9: Int = 0, dayTwelveWindSpeed10: Int = 0, dayTwelveWindSpeed11: Int = 0, dayTwelveWindSpeed12: Int = 0, dayTwelveWindSpeed13: Int = 0, dayTwelveWindSpeed14: Int = 0, dayTwelveWindSpeed15: Int = 0
// Cloud Cover
var dayTwelveCloudCover0: Int = 0, dayTwelveCloudCover1: Int = 0, dayTwelveCloudCover2: Int = 0, dayTwelveCloudCover3: Int = 0, dayTwelveCloudCover4: Int = 0, dayTwelveCloudCover5: Int = 0, dayTwelveCloudCover6: Int = 0, dayTwelveCloudCover7: Int = 0, dayTwelveCloudCover8: Int = 0, dayTwelveCloudCover9: Int = 0, dayTwelveCloudCover10: Int = 0, dayTwelveCloudCover11: Int = 0, dayTwelveCloudCover12: Int = 0, dayTwelveCloudCover13: Int = 0, dayTwelveCloudCover14: Int = 0, dayTwelveCloudCover15: Int = 0

// Day Thirteen
// Condition
var dayThirteenCondition0: String = "", dayThirteenCondition1: String = "", dayThirteenCondition2: String = "", dayThirteenCondition3: String = "", dayThirteenCondition4: String = "", dayThirteenCondition5: String = "", dayThirteenCondition6: String = "", dayThirteenCondition7: String = "", dayThirteenCondition8: String = "", dayThirteenCondition9: String = "", dayThirteenCondition10: String = "", dayThirteenCondition11: String = "", dayThirteenCondition12: String = "", dayThirteenCondition13: String = "", dayThirteenCondition14: String = "", dayThirteenCondition15: String = ""
// Precip
var dayThirteenPrecip0: Int = 0, dayThirteenPrecip1: Int = 0, dayThirteenPrecip2: Int = 0, dayThirteenPrecip3: Int = 0, dayThirteenPrecip4: Int = 0, dayThirteenPrecip5: Int = 0, dayThirteenPrecip6: Int = 0, dayThirteenPrecip7: Int = 0, dayThirteenPrecip8: Int = 0, dayThirteenPrecip9: Int = 0, dayThirteenPrecip10: Int = 0, dayThirteenPrecip11: Int = 0, dayThirteenPrecip12: Int = 0, dayThirteenPrecip13: Int = 0, dayThirteenPrecip14: Int = 0, dayThirteenPrecip15: Int = 0
// Temp
var dayThirteenTemp0: Int = 0, dayThirteenTemp1: Int = 0, dayThirteenTemp2: Int = 0, dayThirteenTemp3: Int = 0, dayThirteenTemp4: Int = 0, dayThirteenTemp5: Int = 0, dayThirteenTemp6: Int = 0, dayThirteenTemp7: Int = 0, dayThirteenTemp8: Int = 0, dayThirteenTemp9: Int = 0, dayThirteenTemp10: Int = 0, dayThirteenTemp11: Int = 0, dayThirteenTemp12: Int = 0, dayThirteenTemp13: Int = 0, dayThirteenTemp14: Int = 0, dayThirteenTemp15: Int = 0
// Humidity
var dayThirteenHumidity0: Int = 0, dayThirteenHumidity1: Int = 0, dayThirteenHumidity2: Int = 0, dayThirteenHumidity3: Int = 0, dayThirteenHumidity4: Int = 0, dayThirteenHumidity5: Int = 0, dayThirteenHumidity6: Int = 0, dayThirteenHumidity7: Int = 0, dayThirteenHumidity8: Int = 0, dayThirteenHumidity9: Int = 0, dayThirteenHumidity10: Int = 0, dayThirteenHumidity11: Int = 0, dayThirteenHumidity12: Int = 0, dayThirteenHumidity13: Int = 0, dayThirteenHumidity14: Int = 0, dayThirteenHumidity15: Int = 0
// Icon
var dayThirteenIcon0: String = "", dayThirteenIcon1: String = "", dayThirteenIcon2: String = "", dayThirteenIcon3: String = "", dayThirteenIcon4: String = "", dayThirteenIcon5: String = "", dayThirteenIcon6: String = "", dayThirteenIcon7: String = "", dayThirteenIcon8: String = "", dayThirteenIcon9: String = "", dayThirteenIcon10: String = "", dayThirteenIcon11: String = "", dayThirteenIcon12: String = "", dayThirteenIcon13: String = "", dayThirteenIcon14: String = "", dayThirteenIcon15: String = ""
// UV Index
var dayThirteenIndex0: Int = 0, dayThirteenIndex1: Int = 0, dayThirteenIndex2: Int = 0, dayThirteenIndex3: Int = 0, dayThirteenIndex4: Int = 0, dayThirteenIndex5: Int = 0, dayThirteenIndex6: Int = 0, dayThirteenIndex7: Int = 0, dayThirteenIndex8: Int = 0, dayThirteenIndex9: Int = 0, dayThirteenIndex10: Int = 0, dayThirteenIndex11: Int = 0, dayThirteenIndex12: Int = 0, dayThirteenIndex13: Int = 0, dayThirteenIndex14: Int = 0, dayThirteenIndex15: Int = 0
// Wind Speed
var dayThirteenWindSpeed0: Int = 0, dayThirteenWindSpeed1: Int = 0, dayThirteenWindSpeed2: Int = 0, dayThirteenWindSpeed3: Int = 0, dayThirteenWindSpeed4: Int = 0, dayThirteenWindSpeed5: Int = 0, dayThirteenWindSpeed6: Int = 0, dayThirteenWindSpeed7: Int = 0, dayThirteenWindSpeed8: Int = 0, dayThirteenWindSpeed9: Int = 0, dayThirteenWindSpeed10: Int = 0, dayThirteenWindSpeed11: Int = 0, dayThirteenWindSpeed12: Int = 0, dayThirteenWindSpeed13: Int = 0, dayThirteenWindSpeed14: Int = 0, dayThirteenWindSpeed15: Int = 0
// Cloud Cover
var dayThirteenCloudCover0: Int = 0, dayThirteenCloudCover1: Int = 0, dayThirteenCloudCover2: Int = 0, dayThirteenCloudCover3: Int = 0, dayThirteenCloudCover4: Int = 0, dayThirteenCloudCover5: Int = 0, dayThirteenCloudCover6: Int = 0, dayThirteenCloudCover7: Int = 0, dayThirteenCloudCover8: Int = 0, dayThirteenCloudCover9: Int = 0, dayThirteenCloudCover10: Int = 0, dayThirteenCloudCover11: Int = 0, dayThirteenCloudCover12: Int = 0, dayThirteenCloudCover13: Int = 0, dayThirteenCloudCover14: Int = 0, dayThirteenCloudCover15: Int = 0

// MARK: - Get day name
func dayFormat(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE"
    
    return dateFormatter.string(from: date).uppercased()
}

// MARK: - Get date of day
func dateFormat(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    
    return dateFormatter.string(from: date).uppercased()
}

// MARK: - Get hour times from date
func hourFormat(date: Date) -> String {
    var timeString: String = ""
    if defaults.bool(forKey: "twentyFourHourClockEnabled") == true {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h"
        timeString = "\(dateFormatter.string(from: date).lowercased()):00"
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        timeString = dateFormatter.string(from: date).lowercased()
    }
    
    return timeString
}

// MARK: - Get 24-Hour Format
func twentyFourHour(hour: Int, meridiem: String) -> Int {
    var hourTime: Int = 0
    
    if hour == 12 && meridiem == "am" {
        hourTime = 0
    } else if hour == 1 && meridiem == "am" {
        hourTime = 1
    } else if hour == 2 && meridiem == "am" {
        hourTime = 2
    } else if hour == 3 && meridiem == "am" {
        hourTime = 3
    } else if hour == 4 && meridiem == "am" {
        hourTime = 4
    } else if hour == 5 && meridiem == "am" {
        hourTime = 5
    } else if hour == 6 && meridiem == "am" {
        hourTime = 6
    } else if hour == 7 && meridiem == "am" {
        hourTime = 7
    } else if hour == 8 && meridiem == "am" {
        hourTime = 8
    } else if hour == 9 && meridiem == "am" {
        hourTime = 9
    } else if hour == 10 && meridiem == "am" {
        hourTime = 10
    } else if hour == 11 && meridiem == "am" {
        hourTime = 11
    } else if hour == 12 && meridiem == "pm" {
        hourTime = 12
    } else if hour == 1 && meridiem == "pm" {
        hourTime = 13
    } else if hour == 2 && meridiem == "pm" {
        hourTime = 14
    } else if hour == 3 && meridiem == "pm" {
        hourTime = 15
    } else if hour == 4 && meridiem == "pm" {
        hourTime = 16
    } else if hour == 5 && meridiem == "pm" {
        hourTime = 17
    } else if hour == 6 && meridiem == "pm" {
        hourTime = 18
    } else if hour == 7 && meridiem == "pm" {
        hourTime = 19
    } else if hour == 8 && meridiem == "pm" {
        hourTime = 20
    } else if hour == 9 && meridiem == "pm" {
        hourTime = 21
    } else if hour == 10 && meridiem == "pm" {
        hourTime = 22
    } else if hour == 11 && meridiem == "pm" {
        hourTime = 23
    }
    
    return hourTime
}

// MARK: - Get sunrise and sunset times
func sunFormat(date: Date) -> String {
    var timeString: String = ""
    if defaults.bool(forKey: "twentyFourHourClockEnabled") == true {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        timeString = dateFormatter.string(from: date).lowercased()
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mma"
        timeString = dateFormatter.string(from: date).lowercased()
    }
    
    return timeString
}

// MARK: - Get storm direction
func stormDirection(degree: Double) -> String {
    var directionString: String = ""
    
    if degree == 0 && degree <= 22.4 {
        directionString = "north"
    } else if degree >= 22.5 && degree <= 44 {
        directionString = "northeast"
    } else if degree >= 45 && degree <= 67.4 {
        directionString = "northeast"
    } else if degree >= 67.5 && degree <= 89 {
        directionString = "northeast"
    } else if degree >= 90 && degree <= 112.4 {
        directionString = "east"
    } else if degree >= 112.5 && degree <= 134 {
        directionString = "southeast"
    } else if degree >= 135 && degree <= 157.4 {
        directionString = "southeast"
    } else if degree >= 157.5 && degree <= 179 {
        directionString = "southeast"
    } else if degree >= 180 && degree <= 202.4 {
        directionString = "south"
    } else if degree >= 202.5 && degree <= 224 {
        directionString = "southwest"
    } else if degree >= 225 && degree <= 147.4 {
        directionString = "southwest"
    } else if degree >= 147.5 && degree <= 269 {
        directionString = "southwest"
    } else if degree >= 270 && degree <= 292.4 {
        directionString = "west"
    } else if degree >= 292.5 && degree <= 314 {
        directionString = "northwest"
    } else if degree >= 315 && degree <= 337.4 {
        directionString = "northwest"
    } else if degree >= 337.5 && degree <= 360 {
        directionString = "northwest"
    }
    
    return directionString
}

// MARK: - Get wind direction
func windDirection(degree: Double) -> String {
    var directionString: String = ""
    
    if degree == 0 && degree <= 22.4 {
        directionString = "N"
    } else if degree >= 22.5 && degree <= 44 {
        directionString = "NE"
    } else if degree >= 45 && degree <= 67.4 {
        directionString = "NE"
    } else if degree >= 67.5 && degree <= 89 {
        directionString = "NE"
    } else if degree >= 90 && degree <= 112.4 {
        directionString = "E"
    } else if degree >= 112.5 && degree <= 134 {
        directionString = "SE"
    } else if degree >= 135 && degree <= 157.4 {
        directionString = "SE"
    } else if degree >= 157.5 && degree <= 179 {
        directionString = "SE"
    } else if degree >= 180 && degree <= 202.4 {
        directionString = "S"
    } else if degree >= 202.5 && degree <= 224 {
        directionString = "SW"
    } else if degree >= 225 && degree <= 147.4 {
        directionString = "SW"
    } else if degree >= 147.5 && degree <= 269 {
        directionString = "SW"
    } else if degree >= 270 && degree <= 292.4 {
        directionString = "W"
    } else if degree >= 292.5 && degree <= 314 {
        directionString = "NW"
    } else if degree >= 315 && degree <= 337.4 {
        directionString = "NW"
    } else if degree >= 337.5 && degree <= 360 {
        directionString = "NW"
    }
    
    return directionString
}

// MARK: - Get moon phase
func moonPhase(percentage: Double) -> String {
    let value = percentage * 100
    
    if value == 0 {
        moonPhaseString = "New moon"
    } else if value >= 1 && value <= 24 {
        moonPhaseString = "Waxing crescent"
    } else if value == 25 {
        moonPhaseString = "First quarter"
    } else if value >= 26 && value <= 49  {
        moonPhaseString = "Waxing gibbous"
    } else if value == 50 {
        moonPhaseString = "Full moon"
    } else if value >= 51 && value <= 74  {
        moonPhaseString = "Waning gibbous"
    } else if value == 75 {
        moonPhaseString = "Last quarter"
    } else if value >= 76 && value <= 100  {
        moonPhaseString = "Waning crescent"
    }
    
    return moonPhaseString
}

// Convert KMH to MS
func kmhToMS(speed: CGFloat) -> Int {
    return Int(speed / 3.6)
}

// Convert Inches to Millimeters
func inToMM(amount: Double) -> Double {
    return Double(amount * 25.4)
}

func dailyPrecipAccum(day: DataPoint) -> Double {
    var dailyValue: Double = 0
    
    if day.precipitationAccumulation != nil {
        if unitsPrecipitation == "mm" {
            dailyValue = inToMM(amount: Double(day.precipitationAccumulation!))
        } else {
            dailyValue = Double(day.precipitationAccumulation!)
        }
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get daily precip probability
func dailyPrecipProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.precipitationProbability != nil {
        dailyValue = Int(day.precipitationProbability! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get float precip probability
func cgFloatPrecipProb(day: CGFloat) -> Int {
    var dailyValue: Int = 0
    
    if day.isNaN == true {
        dailyValue = 0
    } else {
        dailyValue = Int(day * 100)
    }
    
    return dailyValue
}

// Get default daily condition value
func getDefaultDailyCondition(condition: DataPoint) -> Int {
    var value: Int = 0
    
    if (defaults.string(forKey: "defaultDailyCondition")?.contains("Precip") == true) {
        value = dailyPrecipProb(day: condition)
        defaultDailyConditionValueType = "Precip"
        defaultDailyConditionValueUnit = "%"
    } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Humidity") == true) {
        value = dailyHumidityProb(day: condition)
        defaultDailyConditionValueType = "Humid"
        defaultDailyConditionValueUnit = "%"
    } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("UV Index") == true) {
        value = Int(condition.uvIndex!)
        defaultDailyConditionValueType = "UV"
        defaultDailyConditionValueUnit = ""
    } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Wind") == true) {
        value = Int(condition.windSpeed!)
        defaultDailyConditionValueType = "Wind"
        defaultDailyConditionValueUnit = "\(unitsWindSpeed)"
    } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Cloud Cover") == true) {
        value = dailyCloudCoverProb(day: condition)
        defaultDailyConditionValueType = "Clouds"
        defaultDailyConditionValueUnit = "%"
    } else {
        value = dailyPrecipProb(day: condition)
        defaultDailyConditionValueType = "Precip"
        defaultDailyConditionValueUnit = "%"
    }
    
    return value
}

// Get daily humidity
func dailyHumidityProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.humidity != nil {
        dailyValue = Int(day.humidity! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get daily cloud cover
func dailyCloudCoverProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.cloudCover != nil {
        dailyValue = Int(day.cloudCover! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get minute precip probability
func minutePrecipProb(value: Int, minute: DataBlock?) -> Int {
    var minuteValue: Int = 0
    
    let fetchMinute = minute!.data[value]
    let minuteArray = fetchMinute
    
    if minuteArray.precipitationProbability != nil {
        minuteValue = Int(minuteArray.precipitationProbability! * 100)
    } else {
        minuteValue = 0
    }
    
    return minuteValue
}

// Get minute precip intensity
func minutePrecipIntensity(value: Int, minute: DataBlock?) -> Double {
    var minuteValue: Double = 0
    
    let fetchMinute = minute!.data[value]
    let minuteArray = fetchMinute
    
    if minuteArray.precipitationIntensity != nil {
        minuteValue = Double(minuteArray.precipitationIntensity!).rounded(toPlaces: 2)
    } else {
        minuteValue = 0
    }
    
    return minuteValue
}

// Get minute precip type
func minutePrecipType(value: Int, minute: DataBlock?) -> String {
    var minuteValue: String = ""
    
    let fetchMinute = minute!.data[value]
    let minuteArray = fetchMinute
    
    if minuteArray.precipitationType != nil {
        minuteValue = "\(minuteArray.precipitationType!)"
    } else {
        minuteValue = "none"
    }
    
    return minuteValue
}

// Get hour precipitation
func hourPrecipProb(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.precipitationProbability != nil {
        hourValue = Int(hourArray.precipitationProbability! * 100)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour temperature
func hourTemp(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.temperature != nil {
        hourValue = Int(hourArray.temperature!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour humidity
func hourHumidity(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.humidity != nil {
        hourValue = Int(hourArray.humidity! * 100)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour uv index
func hourUVIndex(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.uvIndex != nil {
        hourValue = Int(hourArray.uvIndex!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour pressure
func hourPressure(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.pressure != nil {
        hourValue = Int(hourArray.pressure!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour wind speed
func hourWindSpeed(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.windSpeed != nil {
        hourValue = Int(hourArray.windSpeed!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour wind direction
func hourWindDirection(value: Int, hour: DataBlock?) -> String {
    var hourValue: Double = 0
    var hourDirectionString: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.windBearing != nil {
        hourValue = hourArray.windBearing!
        hourDirectionString = windDirection(degree: hourValue)
    } else {
        hourValue = 0
    }
    
    return hourDirectionString
}

// Get hour cloud cover
func hourCloudCover(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.cloudCover != nil {
        hourValue = Int(hourArray.cloudCover! * 100)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour icon
func hourIcon(value: Int, hour: DataBlock?) -> String {
    var hourValue: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.icon != nil {
        hourValue = hourArray.icon!.rawValue
    } else {
        hourValue = ""
    }
    
    return hourValue
}

// Get hour time
func hourTime(value: Int, hour: DataBlock?) -> String {
    var hourValue: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    hourValue = hourFormat(date: hourArray.time)
    
    return hourValue
}
