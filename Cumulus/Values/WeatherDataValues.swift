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
var dayOneMoonPhaseString: String = ""
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
var dayTwoMoonPhaseString: String = ""
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
var dayThreeMoonPhaseString: String = ""
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
var dayFourMoonPhaseString: String = ""
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
var dayFiveMoonPhaseString: String = ""
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
var daySixMoonPhaseString: String = ""
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
var daySevenMoonPhaseString: String = ""
var daySevenConditionString: String = ""

// MARK: - Seven day forecast hourly values
// Day Zero
var dayZeroDate = Date()
// Time
var dayZeroTime0: String = ""
var dayZeroTime1: String = ""
var dayZeroTime2: String = ""
var dayZeroTime3: String = ""
var dayZeroTime4: String = ""
var dayZeroTime5: String = ""
var dayZeroTime6: String = ""
var dayZeroTime7: String = ""
var dayZeroTime8: String = ""
var dayZeroTime9: String = ""
var dayZeroTime10: String = ""
var dayZeroTime11: String = ""
var dayZeroTime12: String = ""
var dayZeroTime13: String = ""
var dayZeroTime14: String = ""
var dayZeroTime15: String = ""
// Condition
var dayZeroCondition0: String = ""
var dayZeroCondition1: String = ""
var dayZeroCondition2: String = ""
var dayZeroCondition3: String = ""
var dayZeroCondition4: String = ""
var dayZeroCondition5: String = ""
var dayZeroCondition6: String = ""
var dayZeroCondition7: String = ""
var dayZeroCondition8: String = ""
var dayZeroCondition9: String = ""
var dayZeroCondition10: String = ""
var dayZeroCondition11: String = ""
var dayZeroCondition12: String = ""
var dayZeroCondition13: String = ""
var dayZeroCondition14: String = ""
var dayZeroCondition15: String = ""
// Precip
var dayZeroPrecip0: Int = 0
var dayZeroPrecip1: Int = 0
var dayZeroPrecip2: Int = 0
var dayZeroPrecip3: Int = 0
var dayZeroPrecip4: Int = 0
var dayZeroPrecip5: Int = 0
var dayZeroPrecip6: Int = 0
var dayZeroPrecip7: Int = 0
var dayZeroPrecip8: Int = 0
var dayZeroPrecip9: Int = 0
var dayZeroPrecip10: Int = 0
var dayZeroPrecip11: Int = 0
var dayZeroPrecip12: Int = 0
var dayZeroPrecip13: Int = 0
var dayZeroPrecip14: Int = 0
var dayZeroPrecip15: Int = 0
// Temp
var dayZeroTemp0: Int = 0
var dayZeroTemp1: Int = 0
var dayZeroTemp2: Int = 0
var dayZeroTemp3: Int = 0
var dayZeroTemp4: Int = 0
var dayZeroTemp5: Int = 0
var dayZeroTemp6: Int = 0
var dayZeroTemp7: Int = 0
var dayZeroTemp8: Int = 0
var dayZeroTemp9: Int = 0
var dayZeroTemp10: Int = 0
var dayZeroTemp11: Int = 0
var dayZeroTemp12: Int = 0
var dayZeroTemp13: Int = 0
var dayZeroTemp14: Int = 0
var dayZeroTemp15: Int = 0
// Humidity
var dayZeroHumidity0: Int = 0
var dayZeroHumidity1: Int = 0
var dayZeroHumidity2: Int = 0
var dayZeroHumidity3: Int = 0
var dayZeroHumidity4: Int = 0
var dayZeroHumidity5: Int = 0
var dayZeroHumidity6: Int = 0
var dayZeroHumidity7: Int = 0
var dayZeroHumidity8: Int = 0
var dayZeroHumidity9: Int = 0
var dayZeroHumidity10: Int = 0
var dayZeroHumidity11: Int = 0
var dayZeroHumidity12: Int = 0
var dayZeroHumidity13: Int = 0
var dayZeroHumidity14: Int = 0
var dayZeroHumidity15: Int = 0
// Icon
var dayZeroIcon0: String = ""
var dayZeroIcon1: String = ""
var dayZeroIcon2: String = ""
var dayZeroIcon3: String = ""
var dayZeroIcon4: String = ""
var dayZeroIcon5: String = ""
var dayZeroIcon6: String = ""
var dayZeroIcon7: String = ""
var dayZeroIcon8: String = ""
var dayZeroIcon9: String = ""
var dayZeroIcon10: String = ""
var dayZeroIcon11: String = ""
var dayZeroIcon12: String = ""
var dayZeroIcon13: String = ""
var dayZeroIcon14: String = ""
var dayZeroIcon15: String = ""
// UV Index
var dayZeroIndex0: Int = 0
var dayZeroIndex1: Int = 0
var dayZeroIndex2: Int = 0
var dayZeroIndex3: Int = 0
var dayZeroIndex4: Int = 0
var dayZeroIndex5: Int = 0
var dayZeroIndex6: Int = 0
var dayZeroIndex7: Int = 0
var dayZeroIndex8: Int = 0
var dayZeroIndex9: Int = 0
var dayZeroIndex10: Int = 0
var dayZeroIndex11: Int = 0
var dayZeroIndex12: Int = 0
var dayZeroIndex13: Int = 0
var dayZeroIndex14: Int = 0
var dayZeroIndex15: Int = 0
// Wind Speed
var dayZeroWindSpeed0: Int = 0
var dayZeroWindSpeed1: Int = 0
var dayZeroWindSpeed2: Int = 0
var dayZeroWindSpeed3: Int = 0
var dayZeroWindSpeed4: Int = 0
var dayZeroWindSpeed5: Int = 0
var dayZeroWindSpeed6: Int = 0
var dayZeroWindSpeed7: Int = 0
var dayZeroWindSpeed8: Int = 0
var dayZeroWindSpeed9: Int = 0
var dayZeroWindSpeed10: Int = 0
var dayZeroWindSpeed11: Int = 0
var dayZeroWindSpeed12: Int = 0
var dayZeroWindSpeed13: Int = 0
var dayZeroWindSpeed14: Int = 0
var dayZeroWindSpeed15: Int = 0
// Cloud Cover
var dayZeroCloudCover0: Int = 0
var dayZeroCloudCover1: Int = 0
var dayZeroCloudCover2: Int = 0
var dayZeroCloudCover3: Int = 0
var dayZeroCloudCover4: Int = 0
var dayZeroCloudCover5: Int = 0
var dayZeroCloudCover6: Int = 0
var dayZeroCloudCover7: Int = 0
var dayZeroCloudCover8: Int = 0
var dayZeroCloudCover9: Int = 0
var dayZeroCloudCover10: Int = 0
var dayZeroCloudCover11: Int = 0
var dayZeroCloudCover12: Int = 0
var dayZeroCloudCover13: Int = 0
var dayZeroCloudCover14: Int = 0
var dayZeroCloudCover15: Int = 0

// Day One
var dayOneDate = Date()
// Time
var dayOneTime0: String = ""
var dayOneTime1: String = ""
var dayOneTime2: String = ""
var dayOneTime3: String = ""
var dayOneTime4: String = ""
var dayOneTime5: String = ""
var dayOneTime6: String = ""
var dayOneTime7: String = ""
var dayOneTime8: String = ""
var dayOneTime9: String = ""
var dayOneTime10: String = ""
var dayOneTime11: String = ""
var dayOneTime12: String = ""
var dayOneTime13: String = ""
var dayOneTime14: String = ""
var dayOneTime15: String = ""
// Condition
var dayOneCondition0: String = ""
var dayOneCondition1: String = ""
var dayOneCondition2: String = ""
var dayOneCondition3: String = ""
var dayOneCondition4: String = ""
var dayOneCondition5: String = ""
var dayOneCondition6: String = ""
var dayOneCondition7: String = ""
var dayOneCondition8: String = ""
var dayOneCondition9: String = ""
var dayOneCondition10: String = ""
var dayOneCondition11: String = ""
var dayOneCondition12: String = ""
var dayOneCondition13: String = ""
var dayOneCondition14: String = ""
var dayOneCondition15: String = ""
// Precip
var dayOnePrecip0: Int = 0
var dayOnePrecip1: Int = 0
var dayOnePrecip2: Int = 0
var dayOnePrecip3: Int = 0
var dayOnePrecip4: Int = 0
var dayOnePrecip5: Int = 0
var dayOnePrecip6: Int = 0
var dayOnePrecip7: Int = 0
var dayOnePrecip8: Int = 0
var dayOnePrecip9: Int = 0
var dayOnePrecip10: Int = 0
var dayOnePrecip11: Int = 0
var dayOnePrecip12: Int = 0
var dayOnePrecip13: Int = 0
var dayOnePrecip14: Int = 0
var dayOnePrecip15: Int = 0
// Temp
var dayOneTemp0: Int = 0
var dayOneTemp1: Int = 0
var dayOneTemp2: Int = 0
var dayOneTemp3: Int = 0
var dayOneTemp4: Int = 0
var dayOneTemp5: Int = 0
var dayOneTemp6: Int = 0
var dayOneTemp7: Int = 0
var dayOneTemp8: Int = 0
var dayOneTemp9: Int = 0
var dayOneTemp10: Int = 0
var dayOneTemp11: Int = 0
var dayOneTemp12: Int = 0
var dayOneTemp13: Int = 0
var dayOneTemp14: Int = 0
var dayOneTemp15: Int = 0
// Humidity
var dayOneHumidity0: Int = 0
var dayOneHumidity1: Int = 0
var dayOneHumidity2: Int = 0
var dayOneHumidity3: Int = 0
var dayOneHumidity4: Int = 0
var dayOneHumidity5: Int = 0
var dayOneHumidity6: Int = 0
var dayOneHumidity7: Int = 0
var dayOneHumidity8: Int = 0
var dayOneHumidity9: Int = 0
var dayOneHumidity10: Int = 0
var dayOneHumidity11: Int = 0
var dayOneHumidity12: Int = 0
var dayOneHumidity13: Int = 0
var dayOneHumidity14: Int = 0
var dayOneHumidity15: Int = 0
// Icon
var dayOneIcon0: String = ""
var dayOneIcon1: String = ""
var dayOneIcon2: String = ""
var dayOneIcon3: String = ""
var dayOneIcon4: String = ""
var dayOneIcon5: String = ""
var dayOneIcon6: String = ""
var dayOneIcon7: String = ""
var dayOneIcon8: String = ""
var dayOneIcon9: String = ""
var dayOneIcon10: String = ""
var dayOneIcon11: String = ""
var dayOneIcon12: String = ""
var dayOneIcon13: String = ""
var dayOneIcon14: String = ""
var dayOneIcon15: String = ""
// UV Index
var dayOneIndex0: Int = 0
var dayOneIndex1: Int = 0
var dayOneIndex2: Int = 0
var dayOneIndex3: Int = 0
var dayOneIndex4: Int = 0
var dayOneIndex5: Int = 0
var dayOneIndex6: Int = 0
var dayOneIndex7: Int = 0
var dayOneIndex8: Int = 0
var dayOneIndex9: Int = 0
var dayOneIndex10: Int = 0
var dayOneIndex11: Int = 0
var dayOneIndex12: Int = 0
var dayOneIndex13: Int = 0
var dayOneIndex14: Int = 0
var dayOneIndex15: Int = 0
// Wind Speed
var dayOneWindSpeed0: Int = 0
var dayOneWindSpeed1: Int = 0
var dayOneWindSpeed2: Int = 0
var dayOneWindSpeed3: Int = 0
var dayOneWindSpeed4: Int = 0
var dayOneWindSpeed5: Int = 0
var dayOneWindSpeed6: Int = 0
var dayOneWindSpeed7: Int = 0
var dayOneWindSpeed8: Int = 0
var dayOneWindSpeed9: Int = 0
var dayOneWindSpeed10: Int = 0
var dayOneWindSpeed11: Int = 0
var dayOneWindSpeed12: Int = 0
var dayOneWindSpeed13: Int = 0
var dayOneWindSpeed14: Int = 0
var dayOneWindSpeed15: Int = 0
// Cloud Cover
var dayOneCloudCover0: Int = 0
var dayOneCloudCover1: Int = 0
var dayOneCloudCover2: Int = 0
var dayOneCloudCover3: Int = 0
var dayOneCloudCover4: Int = 0
var dayOneCloudCover5: Int = 0
var dayOneCloudCover6: Int = 0
var dayOneCloudCover7: Int = 0
var dayOneCloudCover8: Int = 0
var dayOneCloudCover9: Int = 0
var dayOneCloudCover10: Int = 0
var dayOneCloudCover11: Int = 0
var dayOneCloudCover12: Int = 0
var dayOneCloudCover13: Int = 0
var dayOneCloudCover14: Int = 0
var dayOneCloudCover15: Int = 0

// Day Two
var dayTwoDate = Date()
// Time
var dayTwoTime0: String = ""
var dayTwoTime1: String = ""
var dayTwoTime2: String = ""
var dayTwoTime3: String = ""
var dayTwoTime4: String = ""
var dayTwoTime5: String = ""
var dayTwoTime6: String = ""
var dayTwoTime7: String = ""
var dayTwoTime8: String = ""
var dayTwoTime9: String = ""
var dayTwoTime10: String = ""
var dayTwoTime11: String = ""
var dayTwoTime12: String = ""
var dayTwoTime13: String = ""
var dayTwoTime14: String = ""
var dayTwoTime15: String = ""
// Condition
var dayTwoCondition0: String = ""
var dayTwoCondition1: String = ""
var dayTwoCondition2: String = ""
var dayTwoCondition3: String = ""
var dayTwoCondition4: String = ""
var dayTwoCondition5: String = ""
var dayTwoCondition6: String = ""
var dayTwoCondition7: String = ""
var dayTwoCondition8: String = ""
var dayTwoCondition9: String = ""
var dayTwoCondition10: String = ""
var dayTwoCondition11: String = ""
var dayTwoCondition12: String = ""
var dayTwoCondition13: String = ""
var dayTwoCondition14: String = ""
var dayTwoCondition15: String = ""
// Precip
var dayTwoPrecip0: Int = 0
var dayTwoPrecip1: Int = 0
var dayTwoPrecip2: Int = 0
var dayTwoPrecip3: Int = 0
var dayTwoPrecip4: Int = 0
var dayTwoPrecip5: Int = 0
var dayTwoPrecip6: Int = 0
var dayTwoPrecip7: Int = 0
var dayTwoPrecip8: Int = 0
var dayTwoPrecip9: Int = 0
var dayTwoPrecip10: Int = 0
var dayTwoPrecip11: Int = 0
var dayTwoPrecip12: Int = 0
var dayTwoPrecip13: Int = 0
var dayTwoPrecip14: Int = 0
var dayTwoPrecip15: Int = 0
// Temp
var dayTwoTemp0: Int = 0
var dayTwoTemp1: Int = 0
var dayTwoTemp2: Int = 0
var dayTwoTemp3: Int = 0
var dayTwoTemp4: Int = 0
var dayTwoTemp5: Int = 0
var dayTwoTemp6: Int = 0
var dayTwoTemp7: Int = 0
var dayTwoTemp8: Int = 0
var dayTwoTemp9: Int = 0
var dayTwoTemp10: Int = 0
var dayTwoTemp11: Int = 0
var dayTwoTemp12: Int = 0
var dayTwoTemp13: Int = 0
var dayTwoTemp14: Int = 0
var dayTwoTemp15: Int = 0
// Humidity
var dayTwoHumidity0: Int = 0
var dayTwoHumidity1: Int = 0
var dayTwoHumidity2: Int = 0
var dayTwoHumidity3: Int = 0
var dayTwoHumidity4: Int = 0
var dayTwoHumidity5: Int = 0
var dayTwoHumidity6: Int = 0
var dayTwoHumidity7: Int = 0
var dayTwoHumidity8: Int = 0
var dayTwoHumidity9: Int = 0
var dayTwoHumidity10: Int = 0
var dayTwoHumidity11: Int = 0
var dayTwoHumidity12: Int = 0
var dayTwoHumidity13: Int = 0
var dayTwoHumidity14: Int = 0
var dayTwoHumidity15: Int = 0
// Icon
var dayTwoIcon0: String = ""
var dayTwoIcon1: String = ""
var dayTwoIcon2: String = ""
var dayTwoIcon3: String = ""
var dayTwoIcon4: String = ""
var dayTwoIcon5: String = ""
var dayTwoIcon6: String = ""
var dayTwoIcon7: String = ""
var dayTwoIcon8: String = ""
var dayTwoIcon9: String = ""
var dayTwoIcon10: String = ""
var dayTwoIcon11: String = ""
var dayTwoIcon12: String = ""
var dayTwoIcon13: String = ""
var dayTwoIcon14: String = ""
var dayTwoIcon15: String = ""
// UV Index
var dayTwoIndex0: Int = 0
var dayTwoIndex1: Int = 0
var dayTwoIndex2: Int = 0
var dayTwoIndex3: Int = 0
var dayTwoIndex4: Int = 0
var dayTwoIndex5: Int = 0
var dayTwoIndex6: Int = 0
var dayTwoIndex7: Int = 0
var dayTwoIndex8: Int = 0
var dayTwoIndex9: Int = 0
var dayTwoIndex10: Int = 0
var dayTwoIndex11: Int = 0
var dayTwoIndex12: Int = 0
var dayTwoIndex13: Int = 0
var dayTwoIndex14: Int = 0
var dayTwoIndex15: Int = 0
// Wind Speed
var dayTwoWindSpeed0: Int = 0
var dayTwoWindSpeed1: Int = 0
var dayTwoWindSpeed2: Int = 0
var dayTwoWindSpeed3: Int = 0
var dayTwoWindSpeed4: Int = 0
var dayTwoWindSpeed5: Int = 0
var dayTwoWindSpeed6: Int = 0
var dayTwoWindSpeed7: Int = 0
var dayTwoWindSpeed8: Int = 0
var dayTwoWindSpeed9: Int = 0
var dayTwoWindSpeed10: Int = 0
var dayTwoWindSpeed11: Int = 0
var dayTwoWindSpeed12: Int = 0
var dayTwoWindSpeed13: Int = 0
var dayTwoWindSpeed14: Int = 0
var dayTwoWindSpeed15: Int = 0
// Cloud Cover
var dayTwoCloudCover0: Int = 0
var dayTwoCloudCover1: Int = 0
var dayTwoCloudCover2: Int = 0
var dayTwoCloudCover3: Int = 0
var dayTwoCloudCover4: Int = 0
var dayTwoCloudCover5: Int = 0
var dayTwoCloudCover6: Int = 0
var dayTwoCloudCover7: Int = 0
var dayTwoCloudCover8: Int = 0
var dayTwoCloudCover9: Int = 0
var dayTwoCloudCover10: Int = 0
var dayTwoCloudCover11: Int = 0
var dayTwoCloudCover12: Int = 0
var dayTwoCloudCover13: Int = 0
var dayTwoCloudCover14: Int = 0
var dayTwoCloudCover15: Int = 0

// Day Three
var dayThreeDate = Date()
// Time
var dayThreeTime0: String = ""
var dayThreeTime1: String = ""
var dayThreeTime2: String = ""
var dayThreeTime3: String = ""
var dayThreeTime4: String = ""
var dayThreeTime5: String = ""
var dayThreeTime6: String = ""
var dayThreeTime7: String = ""
var dayThreeTime8: String = ""
var dayThreeTime9: String = ""
var dayThreeTime10: String = ""
var dayThreeTime11: String = ""
var dayThreeTime12: String = ""
var dayThreeTime13: String = ""
var dayThreeTime14: String = ""
var dayThreeTime15: String = ""
// Condition
var dayThreeCondition0: String = ""
var dayThreeCondition1: String = ""
var dayThreeCondition2: String = ""
var dayThreeCondition3: String = ""
var dayThreeCondition4: String = ""
var dayThreeCondition5: String = ""
var dayThreeCondition6: String = ""
var dayThreeCondition7: String = ""
var dayThreeCondition8: String = ""
var dayThreeCondition9: String = ""
var dayThreeCondition10: String = ""
var dayThreeCondition11: String = ""
var dayThreeCondition12: String = ""
var dayThreeCondition13: String = ""
var dayThreeCondition14: String = ""
var dayThreeCondition15: String = ""
// Precip
var dayThreePrecip0: Int = 0
var dayThreePrecip1: Int = 0
var dayThreePrecip2: Int = 0
var dayThreePrecip3: Int = 0
var dayThreePrecip4: Int = 0
var dayThreePrecip5: Int = 0
var dayThreePrecip6: Int = 0
var dayThreePrecip7: Int = 0
var dayThreePrecip8: Int = 0
var dayThreePrecip9: Int = 0
var dayThreePrecip10: Int = 0
var dayThreePrecip11: Int = 0
var dayThreePrecip12: Int = 0
var dayThreePrecip13: Int = 0
var dayThreePrecip14: Int = 0
var dayThreePrecip15: Int = 0
// Temp
var dayThreeTemp0: Int = 0
var dayThreeTemp1: Int = 0
var dayThreeTemp2: Int = 0
var dayThreeTemp3: Int = 0
var dayThreeTemp4: Int = 0
var dayThreeTemp5: Int = 0
var dayThreeTemp6: Int = 0
var dayThreeTemp7: Int = 0
var dayThreeTemp8: Int = 0
var dayThreeTemp9: Int = 0
var dayThreeTemp10: Int = 0
var dayThreeTemp11: Int = 0
var dayThreeTemp12: Int = 0
var dayThreeTemp13: Int = 0
var dayThreeTemp14: Int = 0
var dayThreeTemp15: Int = 0
// Humidity
var dayThreeHumidity0: Int = 0
var dayThreeHumidity1: Int = 0
var dayThreeHumidity2: Int = 0
var dayThreeHumidity3: Int = 0
var dayThreeHumidity4: Int = 0
var dayThreeHumidity5: Int = 0
var dayThreeHumidity6: Int = 0
var dayThreeHumidity7: Int = 0
var dayThreeHumidity8: Int = 0
var dayThreeHumidity9: Int = 0
var dayThreeHumidity10: Int = 0
var dayThreeHumidity11: Int = 0
var dayThreeHumidity12: Int = 0
var dayThreeHumidity13: Int = 0
var dayThreeHumidity14: Int = 0
var dayThreeHumidity15: Int = 0
// Icon
var dayThreeIcon0: String = ""
var dayThreeIcon1: String = ""
var dayThreeIcon2: String = ""
var dayThreeIcon3: String = ""
var dayThreeIcon4: String = ""
var dayThreeIcon5: String = ""
var dayThreeIcon6: String = ""
var dayThreeIcon7: String = ""
var dayThreeIcon8: String = ""
var dayThreeIcon9: String = ""
var dayThreeIcon10: String = ""
var dayThreeIcon11: String = ""
var dayThreeIcon12: String = ""
var dayThreeIcon13: String = ""
var dayThreeIcon14: String = ""
var dayThreeIcon15: String = ""
// UV Index
var dayThreeIndex0: Int = 0
var dayThreeIndex1: Int = 0
var dayThreeIndex2: Int = 0
var dayThreeIndex3: Int = 0
var dayThreeIndex4: Int = 0
var dayThreeIndex5: Int = 0
var dayThreeIndex6: Int = 0
var dayThreeIndex7: Int = 0
var dayThreeIndex8: Int = 0
var dayThreeIndex9: Int = 0
var dayThreeIndex10: Int = 0
var dayThreeIndex11: Int = 0
var dayThreeIndex12: Int = 0
var dayThreeIndex13: Int = 0
var dayThreeIndex14: Int = 0
var dayThreeIndex15: Int = 0
// Wind Speed
var dayThreeWindSpeed0: Int = 0
var dayThreeWindSpeed1: Int = 0
var dayThreeWindSpeed2: Int = 0
var dayThreeWindSpeed3: Int = 0
var dayThreeWindSpeed4: Int = 0
var dayThreeWindSpeed5: Int = 0
var dayThreeWindSpeed6: Int = 0
var dayThreeWindSpeed7: Int = 0
var dayThreeWindSpeed8: Int = 0
var dayThreeWindSpeed9: Int = 0
var dayThreeWindSpeed10: Int = 0
var dayThreeWindSpeed11: Int = 0
var dayThreeWindSpeed12: Int = 0
var dayThreeWindSpeed13: Int = 0
var dayThreeWindSpeed14: Int = 0
var dayThreeWindSpeed15: Int = 0
// Cloud Cover
var dayThreeCloudCover0: Int = 0
var dayThreeCloudCover1: Int = 0
var dayThreeCloudCover2: Int = 0
var dayThreeCloudCover3: Int = 0
var dayThreeCloudCover4: Int = 0
var dayThreeCloudCover5: Int = 0
var dayThreeCloudCover6: Int = 0
var dayThreeCloudCover7: Int = 0
var dayThreeCloudCover8: Int = 0
var dayThreeCloudCover9: Int = 0
var dayThreeCloudCover10: Int = 0
var dayThreeCloudCover11: Int = 0
var dayThreeCloudCover12: Int = 0
var dayThreeCloudCover13: Int = 0
var dayThreeCloudCover14: Int = 0
var dayThreeCloudCover15: Int = 0

// Day Four
var dayFourDate = Date()
// Time
var dayFourTime0: String = ""
var dayFourTime1: String = ""
var dayFourTime2: String = ""
var dayFourTime3: String = ""
var dayFourTime4: String = ""
var dayFourTime5: String = ""
var dayFourTime6: String = ""
var dayFourTime7: String = ""
var dayFourTime8: String = ""
var dayFourTime9: String = ""
var dayFourTime10: String = ""
var dayFourTime11: String = ""
var dayFourTime12: String = ""
var dayFourTime13: String = ""
var dayFourTime14: String = ""
var dayFourTime15: String = ""
// Condition
var dayFourCondition0: String = ""
var dayFourCondition1: String = ""
var dayFourCondition2: String = ""
var dayFourCondition3: String = ""
var dayFourCondition4: String = ""
var dayFourCondition5: String = ""
var dayFourCondition6: String = ""
var dayFourCondition7: String = ""
var dayFourCondition8: String = ""
var dayFourCondition9: String = ""
var dayFourCondition10: String = ""
var dayFourCondition11: String = ""
var dayFourCondition12: String = ""
var dayFourCondition13: String = ""
var dayFourCondition14: String = ""
var dayFourCondition15: String = ""
// Precip
var dayFourPrecip0: Int = 0
var dayFourPrecip1: Int = 0
var dayFourPrecip2: Int = 0
var dayFourPrecip3: Int = 0
var dayFourPrecip4: Int = 0
var dayFourPrecip5: Int = 0
var dayFourPrecip6: Int = 0
var dayFourPrecip7: Int = 0
var dayFourPrecip8: Int = 0
var dayFourPrecip9: Int = 0
var dayFourPrecip10: Int = 0
var dayFourPrecip11: Int = 0
var dayFourPrecip12: Int = 0
var dayFourPrecip13: Int = 0
var dayFourPrecip14: Int = 0
var dayFourPrecip15: Int = 0
// Temp
var dayFourTemp0: Int = 0
var dayFourTemp1: Int = 0
var dayFourTemp2: Int = 0
var dayFourTemp3: Int = 0
var dayFourTemp4: Int = 0
var dayFourTemp5: Int = 0
var dayFourTemp6: Int = 0
var dayFourTemp7: Int = 0
var dayFourTemp8: Int = 0
var dayFourTemp9: Int = 0
var dayFourTemp10: Int = 0
var dayFourTemp11: Int = 0
var dayFourTemp12: Int = 0
var dayFourTemp13: Int = 0
var dayFourTemp14: Int = 0
var dayFourTemp15: Int = 0
// Humidity
var dayFourHumidity0: Int = 0
var dayFourHumidity1: Int = 0
var dayFourHumidity2: Int = 0
var dayFourHumidity3: Int = 0
var dayFourHumidity4: Int = 0
var dayFourHumidity5: Int = 0
var dayFourHumidity6: Int = 0
var dayFourHumidity7: Int = 0
var dayFourHumidity8: Int = 0
var dayFourHumidity9: Int = 0
var dayFourHumidity10: Int = 0
var dayFourHumidity11: Int = 0
var dayFourHumidity12: Int = 0
var dayFourHumidity13: Int = 0
var dayFourHumidity14: Int = 0
var dayFourHumidity15: Int = 0
// Icon
var dayFourIcon0: String = ""
var dayFourIcon1: String = ""
var dayFourIcon2: String = ""
var dayFourIcon3: String = ""
var dayFourIcon4: String = ""
var dayFourIcon5: String = ""
var dayFourIcon6: String = ""
var dayFourIcon7: String = ""
var dayFourIcon8: String = ""
var dayFourIcon9: String = ""
var dayFourIcon10: String = ""
var dayFourIcon11: String = ""
var dayFourIcon12: String = ""
var dayFourIcon13: String = ""
var dayFourIcon14: String = ""
var dayFourIcon15: String = ""
// UV Index
var dayFourIndex0: Int = 0
var dayFourIndex1: Int = 0
var dayFourIndex2: Int = 0
var dayFourIndex3: Int = 0
var dayFourIndex4: Int = 0
var dayFourIndex5: Int = 0
var dayFourIndex6: Int = 0
var dayFourIndex7: Int = 0
var dayFourIndex8: Int = 0
var dayFourIndex9: Int = 0
var dayFourIndex10: Int = 0
var dayFourIndex11: Int = 0
var dayFourIndex12: Int = 0
var dayFourIndex13: Int = 0
var dayFourIndex14: Int = 0
var dayFourIndex15: Int = 0
// Wind Speed
var dayFourWindSpeed0: Int = 0
var dayFourWindSpeed1: Int = 0
var dayFourWindSpeed2: Int = 0
var dayFourWindSpeed3: Int = 0
var dayFourWindSpeed4: Int = 0
var dayFourWindSpeed5: Int = 0
var dayFourWindSpeed6: Int = 0
var dayFourWindSpeed7: Int = 0
var dayFourWindSpeed8: Int = 0
var dayFourWindSpeed9: Int = 0
var dayFourWindSpeed10: Int = 0
var dayFourWindSpeed11: Int = 0
var dayFourWindSpeed12: Int = 0
var dayFourWindSpeed13: Int = 0
var dayFourWindSpeed14: Int = 0
var dayFourWindSpeed15: Int = 0
// Cloud Cover
var dayFourCloudCover0: Int = 0
var dayFourCloudCover1: Int = 0
var dayFourCloudCover2: Int = 0
var dayFourCloudCover3: Int = 0
var dayFourCloudCover4: Int = 0
var dayFourCloudCover5: Int = 0
var dayFourCloudCover6: Int = 0
var dayFourCloudCover7: Int = 0
var dayFourCloudCover8: Int = 0
var dayFourCloudCover9: Int = 0
var dayFourCloudCover10: Int = 0
var dayFourCloudCover11: Int = 0
var dayFourCloudCover12: Int = 0
var dayFourCloudCover13: Int = 0
var dayFourCloudCover14: Int = 0
var dayFourCloudCover15: Int = 0

// Day Five
var dayFiveDate = Date()
// Time
var dayFiveTime0: String = ""
var dayFiveTime1: String = ""
var dayFiveTime2: String = ""
var dayFiveTime3: String = ""
var dayFiveTime4: String = ""
var dayFiveTime5: String = ""
var dayFiveTime6: String = ""
var dayFiveTime7: String = ""
var dayFiveTime8: String = ""
var dayFiveTime9: String = ""
var dayFiveTime10: String = ""
var dayFiveTime11: String = ""
var dayFiveTime12: String = ""
var dayFiveTime13: String = ""
var dayFiveTime14: String = ""
var dayFiveTime15: String = ""
// Condition
var dayFiveCondition0: String = ""
var dayFiveCondition1: String = ""
var dayFiveCondition2: String = ""
var dayFiveCondition3: String = ""
var dayFiveCondition4: String = ""
var dayFiveCondition5: String = ""
var dayFiveCondition6: String = ""
var dayFiveCondition7: String = ""
var dayFiveCondition8: String = ""
var dayFiveCondition9: String = ""
var dayFiveCondition10: String = ""
var dayFiveCondition11: String = ""
var dayFiveCondition12: String = ""
var dayFiveCondition13: String = ""
var dayFiveCondition14: String = ""
var dayFiveCondition15: String = ""
// Precip
var dayFivePrecip0: Int = 0
var dayFivePrecip1: Int = 0
var dayFivePrecip2: Int = 0
var dayFivePrecip3: Int = 0
var dayFivePrecip4: Int = 0
var dayFivePrecip5: Int = 0
var dayFivePrecip6: Int = 0
var dayFivePrecip7: Int = 0
var dayFivePrecip8: Int = 0
var dayFivePrecip9: Int = 0
var dayFivePrecip10: Int = 0
var dayFivePrecip11: Int = 0
var dayFivePrecip12: Int = 0
var dayFivePrecip13: Int = 0
var dayFivePrecip14: Int = 0
var dayFivePrecip15: Int = 0
// Temp
var dayFiveTemp0: Int = 0
var dayFiveTemp1: Int = 0
var dayFiveTemp2: Int = 0
var dayFiveTemp3: Int = 0
var dayFiveTemp4: Int = 0
var dayFiveTemp5: Int = 0
var dayFiveTemp6: Int = 0
var dayFiveTemp7: Int = 0
var dayFiveTemp8: Int = 0
var dayFiveTemp9: Int = 0
var dayFiveTemp10: Int = 0
var dayFiveTemp11: Int = 0
var dayFiveTemp12: Int = 0
var dayFiveTemp13: Int = 0
var dayFiveTemp14: Int = 0
var dayFiveTemp15: Int = 0
// Humidity
var dayFiveHumidity0: Int = 0
var dayFiveHumidity1: Int = 0
var dayFiveHumidity2: Int = 0
var dayFiveHumidity3: Int = 0
var dayFiveHumidity4: Int = 0
var dayFiveHumidity5: Int = 0
var dayFiveHumidity6: Int = 0
var dayFiveHumidity7: Int = 0
var dayFiveHumidity8: Int = 0
var dayFiveHumidity9: Int = 0
var dayFiveHumidity10: Int = 0
var dayFiveHumidity11: Int = 0
var dayFiveHumidity12: Int = 0
var dayFiveHumidity13: Int = 0
var dayFiveHumidity14: Int = 0
var dayFiveHumidity15: Int = 0
// Icon
var dayFiveIcon0: String = ""
var dayFiveIcon1: String = ""
var dayFiveIcon2: String = ""
var dayFiveIcon3: String = ""
var dayFiveIcon4: String = ""
var dayFiveIcon5: String = ""
var dayFiveIcon6: String = ""
var dayFiveIcon7: String = ""
var dayFiveIcon8: String = ""
var dayFiveIcon9: String = ""
var dayFiveIcon10: String = ""
var dayFiveIcon11: String = ""
var dayFiveIcon12: String = ""
var dayFiveIcon13: String = ""
var dayFiveIcon14: String = ""
var dayFiveIcon15: String = ""
// UV Index
var dayFiveIndex0: Int = 0
var dayFiveIndex1: Int = 0
var dayFiveIndex2: Int = 0
var dayFiveIndex3: Int = 0
var dayFiveIndex4: Int = 0
var dayFiveIndex5: Int = 0
var dayFiveIndex6: Int = 0
var dayFiveIndex7: Int = 0
var dayFiveIndex8: Int = 0
var dayFiveIndex9: Int = 0
var dayFiveIndex10: Int = 0
var dayFiveIndex11: Int = 0
var dayFiveIndex12: Int = 0
var dayFiveIndex13: Int = 0
var dayFiveIndex14: Int = 0
var dayFiveIndex15: Int = 0
// Wind Speed
var dayFiveWindSpeed0: Int = 0
var dayFiveWindSpeed1: Int = 0
var dayFiveWindSpeed2: Int = 0
var dayFiveWindSpeed3: Int = 0
var dayFiveWindSpeed4: Int = 0
var dayFiveWindSpeed5: Int = 0
var dayFiveWindSpeed6: Int = 0
var dayFiveWindSpeed7: Int = 0
var dayFiveWindSpeed8: Int = 0
var dayFiveWindSpeed9: Int = 0
var dayFiveWindSpeed10: Int = 0
var dayFiveWindSpeed11: Int = 0
var dayFiveWindSpeed12: Int = 0
var dayFiveWindSpeed13: Int = 0
var dayFiveWindSpeed14: Int = 0
var dayFiveWindSpeed15: Int = 0
// Cloud Cover
var dayFiveCloudCover0: Int = 0
var dayFiveCloudCover1: Int = 0
var dayFiveCloudCover2: Int = 0
var dayFiveCloudCover3: Int = 0
var dayFiveCloudCover4: Int = 0
var dayFiveCloudCover5: Int = 0
var dayFiveCloudCover6: Int = 0
var dayFiveCloudCover7: Int = 0
var dayFiveCloudCover8: Int = 0
var dayFiveCloudCover9: Int = 0
var dayFiveCloudCover10: Int = 0
var dayFiveCloudCover11: Int = 0
var dayFiveCloudCover12: Int = 0
var dayFiveCloudCover13: Int = 0
var dayFiveCloudCover14: Int = 0
var dayFiveCloudCover15: Int = 0

// Day Six
var daySixDate = Date()
// Time
var daySixTime0: String = ""
var daySixTime1: String = ""
var daySixTime2: String = ""
var daySixTime3: String = ""
var daySixTime4: String = ""
var daySixTime5: String = ""
var daySixTime6: String = ""
var daySixTime7: String = ""
var daySixTime8: String = ""
var daySixTime9: String = ""
var daySixTime10: String = ""
var daySixTime11: String = ""
var daySixTime12: String = ""
var daySixTime13: String = ""
var daySixTime14: String = ""
var daySixTime15: String = ""
// Condition
var daySixCondition0: String = ""
var daySixCondition1: String = ""
var daySixCondition2: String = ""
var daySixCondition3: String = ""
var daySixCondition4: String = ""
var daySixCondition5: String = ""
var daySixCondition6: String = ""
var daySixCondition7: String = ""
var daySixCondition8: String = ""
var daySixCondition9: String = ""
var daySixCondition10: String = ""
var daySixCondition11: String = ""
var daySixCondition12: String = ""
var daySixCondition13: String = ""
var daySixCondition14: String = ""
var daySixCondition15: String = ""
// Precip
var daySixPrecip0: Int = 0
var daySixPrecip1: Int = 0
var daySixPrecip2: Int = 0
var daySixPrecip3: Int = 0
var daySixPrecip4: Int = 0
var daySixPrecip5: Int = 0
var daySixPrecip6: Int = 0
var daySixPrecip7: Int = 0
var daySixPrecip8: Int = 0
var daySixPrecip9: Int = 0
var daySixPrecip10: Int = 0
var daySixPrecip11: Int = 0
var daySixPrecip12: Int = 0
var daySixPrecip13: Int = 0
var daySixPrecip14: Int = 0
var daySixPrecip15: Int = 0
// Temp
var daySixTemp0: Int = 0
var daySixTemp1: Int = 0
var daySixTemp2: Int = 0
var daySixTemp3: Int = 0
var daySixTemp4: Int = 0
var daySixTemp5: Int = 0
var daySixTemp6: Int = 0
var daySixTemp7: Int = 0
var daySixTemp8: Int = 0
var daySixTemp9: Int = 0
var daySixTemp10: Int = 0
var daySixTemp11: Int = 0
var daySixTemp12: Int = 0
var daySixTemp13: Int = 0
var daySixTemp14: Int = 0
var daySixTemp15: Int = 0
// Humidity
var daySixHumidity0: Int = 0
var daySixHumidity1: Int = 0
var daySixHumidity2: Int = 0
var daySixHumidity3: Int = 0
var daySixHumidity4: Int = 0
var daySixHumidity5: Int = 0
var daySixHumidity6: Int = 0
var daySixHumidity7: Int = 0
var daySixHumidity8: Int = 0
var daySixHumidity9: Int = 0
var daySixHumidity10: Int = 0
var daySixHumidity11: Int = 0
var daySixHumidity12: Int = 0
var daySixHumidity13: Int = 0
var daySixHumidity14: Int = 0
var daySixHumidity15: Int = 0
// Icon
var daySixIcon0: String = ""
var daySixIcon1: String = ""
var daySixIcon2: String = ""
var daySixIcon3: String = ""
var daySixIcon4: String = ""
var daySixIcon5: String = ""
var daySixIcon6: String = ""
var daySixIcon7: String = ""
var daySixIcon8: String = ""
var daySixIcon9: String = ""
var daySixIcon10: String = ""
var daySixIcon11: String = ""
var daySixIcon12: String = ""
var daySixIcon13: String = ""
var daySixIcon14: String = ""
var daySixIcon15: String = ""
// UV Index
var daySixIndex0: Int = 0
var daySixIndex1: Int = 0
var daySixIndex2: Int = 0
var daySixIndex3: Int = 0
var daySixIndex4: Int = 0
var daySixIndex5: Int = 0
var daySixIndex6: Int = 0
var daySixIndex7: Int = 0
var daySixIndex8: Int = 0
var daySixIndex9: Int = 0
var daySixIndex10: Int = 0
var daySixIndex11: Int = 0
var daySixIndex12: Int = 0
var daySixIndex13: Int = 0
var daySixIndex14: Int = 0
var daySixIndex15: Int = 0
// Wind Speed
var daySixWindSpeed0: Int = 0
var daySixWindSpeed1: Int = 0
var daySixWindSpeed2: Int = 0
var daySixWindSpeed3: Int = 0
var daySixWindSpeed4: Int = 0
var daySixWindSpeed5: Int = 0
var daySixWindSpeed6: Int = 0
var daySixWindSpeed7: Int = 0
var daySixWindSpeed8: Int = 0
var daySixWindSpeed9: Int = 0
var daySixWindSpeed10: Int = 0
var daySixWindSpeed11: Int = 0
var daySixWindSpeed12: Int = 0
var daySixWindSpeed13: Int = 0
var daySixWindSpeed14: Int = 0
var daySixWindSpeed15: Int = 0
// Cloud Cover
var daySixCloudCover0: Int = 0
var daySixCloudCover1: Int = 0
var daySixCloudCover2: Int = 0
var daySixCloudCover3: Int = 0
var daySixCloudCover4: Int = 0
var daySixCloudCover5: Int = 0
var daySixCloudCover6: Int = 0
var daySixCloudCover7: Int = 0
var daySixCloudCover8: Int = 0
var daySixCloudCover9: Int = 0
var daySixCloudCover10: Int = 0
var daySixCloudCover11: Int = 0
var daySixCloudCover12: Int = 0
var daySixCloudCover13: Int = 0
var daySixCloudCover14: Int = 0
var daySixCloudCover15: Int = 0

// Day Seven
var daySevenDate = Date()
// Time
var daySevenTime0: String = ""
var daySevenTime1: String = ""
var daySevenTime2: String = ""
var daySevenTime3: String = ""
var daySevenTime4: String = ""
var daySevenTime5: String = ""
var daySevenTime6: String = ""
var daySevenTime7: String = ""
var daySevenTime8: String = ""
var daySevenTime9: String = ""
var daySevenTime10: String = ""
var daySevenTime11: String = ""
var daySevenTime12: String = ""
var daySevenTime13: String = ""
var daySevenTime14: String = ""
var daySevenTime15: String = ""
// Condition
var daySevenCondition0: String = ""
var daySevenCondition1: String = ""
var daySevenCondition2: String = ""
var daySevenCondition3: String = ""
var daySevenCondition4: String = ""
var daySevenCondition5: String = ""
var daySevenCondition6: String = ""
var daySevenCondition7: String = ""
var daySevenCondition8: String = ""
var daySevenCondition9: String = ""
var daySevenCondition10: String = ""
var daySevenCondition11: String = ""
var daySevenCondition12: String = ""
var daySevenCondition13: String = ""
var daySevenCondition14: String = ""
var daySevenCondition15: String = ""
// Precip
var daySevenPrecip0: Int = 0
var daySevenPrecip1: Int = 0
var daySevenPrecip2: Int = 0
var daySevenPrecip3: Int = 0
var daySevenPrecip4: Int = 0
var daySevenPrecip5: Int = 0
var daySevenPrecip6: Int = 0
var daySevenPrecip7: Int = 0
var daySevenPrecip8: Int = 0
var daySevenPrecip9: Int = 0
var daySevenPrecip10: Int = 0
var daySevenPrecip11: Int = 0
var daySevenPrecip12: Int = 0
var daySevenPrecip13: Int = 0
var daySevenPrecip14: Int = 0
var daySevenPrecip15: Int = 0
// Temp
var daySevenTemp0: Int = 0
var daySevenTemp1: Int = 0
var daySevenTemp2: Int = 0
var daySevenTemp3: Int = 0
var daySevenTemp4: Int = 0
var daySevenTemp5: Int = 0
var daySevenTemp6: Int = 0
var daySevenTemp7: Int = 0
var daySevenTemp8: Int = 0
var daySevenTemp9: Int = 0
var daySevenTemp10: Int = 0
var daySevenTemp11: Int = 0
var daySevenTemp12: Int = 0
var daySevenTemp13: Int = 0
var daySevenTemp14: Int = 0
var daySevenTemp15: Int = 0
// Humidity
var daySevenHumidity0: Int = 0
var daySevenHumidity1: Int = 0
var daySevenHumidity2: Int = 0
var daySevenHumidity3: Int = 0
var daySevenHumidity4: Int = 0
var daySevenHumidity5: Int = 0
var daySevenHumidity6: Int = 0
var daySevenHumidity7: Int = 0
var daySevenHumidity8: Int = 0
var daySevenHumidity9: Int = 0
var daySevenHumidity10: Int = 0
var daySevenHumidity11: Int = 0
var daySevenHumidity12: Int = 0
var daySevenHumidity13: Int = 0
var daySevenHumidity14: Int = 0
var daySevenHumidity15: Int = 0
// Icon
var daySevenIcon0: String = ""
var daySevenIcon1: String = ""
var daySevenIcon2: String = ""
var daySevenIcon3: String = ""
var daySevenIcon4: String = ""
var daySevenIcon5: String = ""
var daySevenIcon6: String = ""
var daySevenIcon7: String = ""
var daySevenIcon8: String = ""
var daySevenIcon9: String = ""
var daySevenIcon10: String = ""
var daySevenIcon11: String = ""
var daySevenIcon12: String = ""
var daySevenIcon13: String = ""
var daySevenIcon14: String = ""
var daySevenIcon15: String = ""
// UV Index
var daySevenIndex0: Int = 0
var daySevenIndex1: Int = 0
var daySevenIndex2: Int = 0
var daySevenIndex3: Int = 0
var daySevenIndex4: Int = 0
var daySevenIndex5: Int = 0
var daySevenIndex6: Int = 0
var daySevenIndex7: Int = 0
var daySevenIndex8: Int = 0
var daySevenIndex9: Int = 0
var daySevenIndex10: Int = 0
var daySevenIndex11: Int = 0
var daySevenIndex12: Int = 0
var daySevenIndex13: Int = 0
var daySevenIndex14: Int = 0
var daySevenIndex15: Int = 0
// Wind Speed
var daySevenWindSpeed0: Int = 0
var daySevenWindSpeed1: Int = 0
var daySevenWindSpeed2: Int = 0
var daySevenWindSpeed3: Int = 0
var daySevenWindSpeed4: Int = 0
var daySevenWindSpeed5: Int = 0
var daySevenWindSpeed6: Int = 0
var daySevenWindSpeed7: Int = 0
var daySevenWindSpeed8: Int = 0
var daySevenWindSpeed9: Int = 0
var daySevenWindSpeed10: Int = 0
var daySevenWindSpeed11: Int = 0
var daySevenWindSpeed12: Int = 0
var daySevenWindSpeed13: Int = 0
var daySevenWindSpeed14: Int = 0
var daySevenWindSpeed15: Int = 0
// Cloud Cover
var daySevenCloudCover0: Int = 0
var daySevenCloudCover1: Int = 0
var daySevenCloudCover2: Int = 0
var daySevenCloudCover3: Int = 0
var daySevenCloudCover4: Int = 0
var daySevenCloudCover5: Int = 0
var daySevenCloudCover6: Int = 0
var daySevenCloudCover7: Int = 0
var daySevenCloudCover8: Int = 0
var daySevenCloudCover9: Int = 0
var daySevenCloudCover10: Int = 0
var daySevenCloudCover11: Int = 0
var daySevenCloudCover12: Int = 0
var daySevenCloudCover13: Int = 0
var daySevenCloudCover14: Int = 0
var daySevenCloudCover15: Int = 0

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
    if percentage == 0 {
        moonPhaseString = "New moon"
    } else if percentage >= 1 && percentage <= 24 {
        moonPhaseString = "Waxing crescent"
    } else if percentage == 25 {
        moonPhaseString = "First quarter"
    } else if percentage >= 26 && percentage <= 49  {
        moonPhaseString = "Waxing gibbous"
    } else if percentage == 50 {
        moonPhaseString = "Full moon"
    } else if percentage >= 51 && percentage <= 74  {
        moonPhaseString = "Waning gibbous"
    } else if percentage == 75 {
        moonPhaseString = "Last quarter"
    } else if percentage >= 76 && percentage <= 100  {
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

// Get wind gust for Aeris API
func aerisWindGust(float: CGFloat) {
    if windGust != 0 {
        windGust = Int(float)
    } else if float.isNaN == true {
        fetchDarkSkyCurrentForecastData()
    } else {
        windGust = 0
    }
}

// Get wind direction for Aeris API
func aerisWindDirection(float: CGFloat) {
    if windDirectionDegree != 0 {
        windDirectionDegree = Double(float)
    } else if float.isNaN == true {
        fetchDarkSkyCurrentForecastData()
    } else {
        windDirectionDegree = 0
    }
    windDirectionString = windDirection(degree: windDirectionDegree)
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
