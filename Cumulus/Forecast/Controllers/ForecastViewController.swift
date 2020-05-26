//
//  ViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/20/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import SafariServices
import Intents
import StoreKit
import ForecastIO

class ForecastViewController: UIViewController, UITabBarControllerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let locationManager = CLLocationManager()
    var placesClient: GMSPlacesClient!
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nextHoursLabel: UILabel!
    @IBOutlet weak var nextDaysLabel: UILabel!
    @IBOutlet weak var currentConditionIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var apparentTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditonLabel: UILabel!
    @IBOutlet weak var currentConditionStackView: UIStackView!
    @IBOutlet weak var weatherAlertsButton: UIButton!
    
    // MARK: - Daily 12 hour outlets
    // Day Zero
    @IBOutlet weak var dayZeroTopStackView: UIStackView!
    @IBOutlet weak var dayZeroStackView: UIStackView!
    
    // Day One
    @IBOutlet weak var dayOneTopStackView: UIStackView!
    @IBOutlet weak var dayOneStackView: UIStackView!
    
    // Day Two
    @IBOutlet weak var dayTwoTopStackView: UIStackView!
    @IBOutlet weak var dayTwoStackView: UIStackView!
    
    // Day Three
    @IBOutlet weak var dayThreeTopStackView: UIStackView!
    @IBOutlet weak var dayThreeStackView: UIStackView!
    
    // Day Four
    @IBOutlet weak var dayFourTopStackView: UIStackView!
    @IBOutlet weak var dayFourStackView: UIStackView!
    
    // Day Five
    @IBOutlet weak var dayFiveTopStackView: UIStackView!
    @IBOutlet weak var dayFiveStackView: UIStackView!
    
    // Day Six
    @IBOutlet weak var daySixTopStackView: UIStackView!
    @IBOutlet weak var daySixStackView: UIStackView!
    
    // Day Seven
    @IBOutlet weak var daySevenTopStackView: UIStackView!
    @IBOutlet weak var daySevenStackView: UIStackView!
    
    // Day Eight
    @IBOutlet weak var dayEightTopStackView: UIStackView!
    @IBOutlet weak var dayEightStackView: UIStackView!
    
    // Day Nine
    @IBOutlet weak var dayNineTopStackView: UIStackView!
    @IBOutlet weak var dayNineStackView: UIStackView!
    
    // MARK: - Tap gestures
    @IBOutlet var dayZeroTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayOneTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayTwoTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayThreeTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayFourTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayFiveTapGesture: UITapGestureRecognizer!
    @IBOutlet var daySixTapGesture: UITapGestureRecognizer!
    @IBOutlet var daySevenTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayEightTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayNineTapGesture: UITapGestureRecognizer!
    
    // MARK: - Current conditions outlets
    @IBOutlet weak var currentConditionPrecipButton: UIButton!
    @IBOutlet weak var currentConditionAccumulationButton: UIButton!
    @IBOutlet weak var currentConditionHumidityButton: UIButton!
    @IBOutlet weak var currentConditionUVIndexButton: UIButton!
    @IBOutlet weak var currentConditionTemperatureButton: UIButton!
    @IBOutlet weak var currentConditionWindButton: UIButton!
    @IBOutlet weak var currentConditionVisibilityButton: UIButton!
    @IBOutlet weak var currentConditionCloudCoverButton: UIButton!
    @IBOutlet weak var currentConditionSunriseButton: UIButton!
    @IBOutlet weak var currentConditionMoonPhaseButton: UIButton!
    
    @IBOutlet weak var currentConditionTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditionWindLabel: UILabel!
    @IBOutlet weak var currentConditionVisibilityLabel: UILabel!
    @IBOutlet weak var currentConditionCloudCoverLabel: UILabel!
    @IBOutlet weak var currentConditionSunriseLabel: UILabel!
    @IBOutlet weak var currentConditionMoonPhaseLabel: UILabel!
    
    // MARK: - Hourly Forecast outlets
    @IBOutlet weak var hourlySegmentControl: UISegmentedControl!
    @IBOutlet weak var hourlyPageControl: UIPageControl!
    
    @IBOutlet weak var hour0Condition: UIImageView!
    @IBOutlet weak var hour0ValueText: UILabel!
    @IBOutlet weak var hour0Image: UIImageView!
    @IBOutlet weak var hour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour0Time: UILabel!
    
    @IBOutlet weak var hour1Condition: UIImageView!
    @IBOutlet weak var hour1ValueText: UILabel!
    @IBOutlet weak var hour1Image: UIImageView!
    @IBOutlet weak var hour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour1Time: UILabel!
    
    @IBOutlet weak var hour2Condition: UIImageView!
    @IBOutlet weak var hour2ValueText: UILabel!
    @IBOutlet weak var hour2Image: UIImageView!
    @IBOutlet weak var hour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour2Time: UILabel!
    
    @IBOutlet weak var hour3Condition: UIImageView!
    @IBOutlet weak var hour3ValueText: UILabel!
    @IBOutlet weak var hour3Image: UIImageView!
    @IBOutlet weak var hour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour3Time: UILabel!
    
    @IBOutlet weak var hour4Condition: UIImageView!
    @IBOutlet weak var hour4ValueText: UILabel!
    @IBOutlet weak var hour4Image: UIImageView!
    @IBOutlet weak var hour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour4Time: UILabel!
    
    @IBOutlet weak var hour5Condition: UIImageView!
    @IBOutlet weak var hour5ValueText: UILabel!
    @IBOutlet weak var hour5Image: UIImageView!
    @IBOutlet weak var hour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour5Time: UILabel!
    
    @IBOutlet weak var hour6Condition: UIImageView!
    @IBOutlet weak var hour6ValueText: UILabel!
    @IBOutlet weak var hour6Image: UIImageView!
    @IBOutlet weak var hour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour6Time: UILabel!

    @IBOutlet weak var hour7Condition: UIImageView!
    @IBOutlet weak var hour7ValueText: UILabel!
    @IBOutlet weak var hour7Image: UIImageView!
    @IBOutlet weak var hour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour7Time: UILabel!

    // MARK: - Day Zero outlets
    @IBOutlet weak var dayZeroDay: UILabel!
    @IBOutlet weak var dayZeroHighLow: UILabel!
    @IBOutlet weak var dayZeroPrecipitation: UILabel!
    @IBOutlet weak var dayZeroSummary: UITextView!
    @IBOutlet weak var dayZeroCondition: UIImageView!
    @IBOutlet weak var dayZeroForecastBar: UIImageView!
    
    @IBOutlet weak var dayZeroSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayZeroPageControl: UIPageControl!
    
    @IBOutlet weak var dayZeroHour0Condition: UIImageView!
    @IBOutlet weak var dayZeroHour0ValueText: UILabel!
    @IBOutlet weak var dayZeroHour0Image: UIImageView!
    @IBOutlet weak var dayZeroHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour0Time: UILabel!
    
    @IBOutlet weak var dayZeroHour1Condition: UIImageView!
    @IBOutlet weak var dayZeroHour1ValueText: UILabel!
    @IBOutlet weak var dayZeroHour1Image: UIImageView!
    @IBOutlet weak var dayZeroHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour1Time: UILabel!
    
    @IBOutlet weak var dayZeroHour2Condition: UIImageView!
    @IBOutlet weak var dayZeroHour2ValueText: UILabel!
    @IBOutlet weak var dayZeroHour2Image: UIImageView!
    @IBOutlet weak var dayZeroHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour2Time: UILabel!
    
    @IBOutlet weak var dayZeroHour3Condition: UIImageView!
    @IBOutlet weak var dayZeroHour3ValueText: UILabel!
    @IBOutlet weak var dayZeroHour3Image: UIImageView!
    @IBOutlet weak var dayZeroHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour3Time: UILabel!
    
    @IBOutlet weak var dayZeroHour4Condition: UIImageView!
    @IBOutlet weak var dayZeroHour4ValueText: UILabel!
    @IBOutlet weak var dayZeroHour4Image: UIImageView!
    @IBOutlet weak var dayZeroHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour4Time: UILabel!
    
    @IBOutlet weak var dayZeroHour5Condition: UIImageView!
    @IBOutlet weak var dayZeroHour5ValueText: UILabel!
    @IBOutlet weak var dayZeroHour5Image: UIImageView!
    @IBOutlet weak var dayZeroHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour5Time: UILabel!
    
    @IBOutlet weak var dayZeroHour6Condition: UIImageView!
    @IBOutlet weak var dayZeroHour6ValueText: UILabel!
    @IBOutlet weak var dayZeroHour6Image: UIImageView!
    @IBOutlet weak var dayZeroHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour6Time: UILabel!
    
    @IBOutlet weak var dayZeroHour7Condition: UIImageView!
    @IBOutlet weak var dayZeroHour7ValueText: UILabel!
    @IBOutlet weak var dayZeroHour7Image: UIImageView!
    @IBOutlet weak var dayZeroHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour7Time: UILabel!
    
    // MARK: - Day One outlets
    @IBOutlet weak var dayOneDay: UILabel!
    @IBOutlet weak var dayOneHighLow: UILabel!
    @IBOutlet weak var dayOnePrecipitation: UILabel!
    @IBOutlet weak var dayOneSummary: UITextView!
    @IBOutlet weak var dayOneCondition: UIImageView!
    @IBOutlet weak var dayOneForecastBar: UIImageView!
    
    @IBOutlet weak var dayOneSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayOnePageControl: UIPageControl!
    
    @IBOutlet weak var dayOneHour0Condition: UIImageView!
    @IBOutlet weak var dayOneHour0ValueText: UILabel!
    @IBOutlet weak var dayOneHour0Image: UIImageView!
    @IBOutlet weak var dayOneHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour0Time: UILabel!
    
    @IBOutlet weak var dayOneHour1Condition: UIImageView!
    @IBOutlet weak var dayOneHour1ValueText: UILabel!
    @IBOutlet weak var dayOneHour1Image: UIImageView!
    @IBOutlet weak var dayOneHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour1Time: UILabel!
    
    @IBOutlet weak var dayOneHour2Condition: UIImageView!
    @IBOutlet weak var dayOneHour2ValueText: UILabel!
    @IBOutlet weak var dayOneHour2Image: UIImageView!
    @IBOutlet weak var dayOneHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour2Time: UILabel!
    
    @IBOutlet weak var dayOneHour3Condition: UIImageView!
    @IBOutlet weak var dayOneHour3ValueText: UILabel!
    @IBOutlet weak var dayOneHour3Image: UIImageView!
    @IBOutlet weak var dayOneHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour3Time: UILabel!
    
    @IBOutlet weak var dayOneHour4Condition: UIImageView!
    @IBOutlet weak var dayOneHour4ValueText: UILabel!
    @IBOutlet weak var dayOneHour4Image: UIImageView!
    @IBOutlet weak var dayOneHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour4Time: UILabel!
    
    @IBOutlet weak var dayOneHour5Condition: UIImageView!
    @IBOutlet weak var dayOneHour5ValueText: UILabel!
    @IBOutlet weak var dayOneHour5Image: UIImageView!
    @IBOutlet weak var dayOneHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour5Time: UILabel!
    
    @IBOutlet weak var dayOneHour6Condition: UIImageView!
    @IBOutlet weak var dayOneHour6ValueText: UILabel!
    @IBOutlet weak var dayOneHour6Image: UIImageView!
    @IBOutlet weak var dayOneHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour6Time: UILabel!
    
    @IBOutlet weak var dayOneHour7Condition: UIImageView!
    @IBOutlet weak var dayOneHour7ValueText: UILabel!
    @IBOutlet weak var dayOneHour7Image: UIImageView!
    @IBOutlet weak var dayOneHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour7Time: UILabel!
    
    // MARK: - Day Two outlets
    @IBOutlet weak var dayTwoDay: UILabel!
    @IBOutlet weak var dayTwoHighLow: UILabel!
    @IBOutlet weak var dayTwoPrecipitation: UILabel!
    @IBOutlet weak var dayTwoSummary: UITextView!
    @IBOutlet weak var dayTwoCondition: UIImageView!
    @IBOutlet weak var dayTwoForecastBar: UIImageView!
    
    @IBOutlet weak var dayTwoSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayTwoPageControl: UIPageControl!
    
    @IBOutlet weak var dayTwoHour0Condition: UIImageView!
    @IBOutlet weak var dayTwoHour0ValueText: UILabel!
    @IBOutlet weak var dayTwoHour0Image: UIImageView!
    @IBOutlet weak var dayTwoHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour0Time: UILabel!
    
    @IBOutlet weak var dayTwoHour1Condition: UIImageView!
    @IBOutlet weak var dayTwoHour1ValueText: UILabel!
    @IBOutlet weak var dayTwoHour1Image: UIImageView!
    @IBOutlet weak var dayTwoHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour1Time: UILabel!
    
    @IBOutlet weak var dayTwoHour2Condition: UIImageView!
    @IBOutlet weak var dayTwoHour2ValueText: UILabel!
    @IBOutlet weak var dayTwoHour2Image: UIImageView!
    @IBOutlet weak var dayTwoHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour2Time: UILabel!
    
    @IBOutlet weak var dayTwoHour3Condition: UIImageView!
    @IBOutlet weak var dayTwoHour3ValueText: UILabel!
    @IBOutlet weak var dayTwoHour3Image: UIImageView!
    @IBOutlet weak var dayTwoHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour3Time: UILabel!
    
    @IBOutlet weak var dayTwoHour4Condition: UIImageView!
    @IBOutlet weak var dayTwoHour4ValueText: UILabel!
    @IBOutlet weak var dayTwoHour4Image: UIImageView!
    @IBOutlet weak var dayTwoHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour4Time: UILabel!
    
    @IBOutlet weak var dayTwoHour5Condition: UIImageView!
    @IBOutlet weak var dayTwoHour5ValueText: UILabel!
    @IBOutlet weak var dayTwoHour5Image: UIImageView!
    @IBOutlet weak var dayTwoHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour5Time: UILabel!
    
    @IBOutlet weak var dayTwoHour6Condition: UIImageView!
    @IBOutlet weak var dayTwoHour6ValueText: UILabel!
    @IBOutlet weak var dayTwoHour6Image: UIImageView!
    @IBOutlet weak var dayTwoHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour6Time: UILabel!
    
    @IBOutlet weak var dayTwoHour7Condition: UIImageView!
    @IBOutlet weak var dayTwoHour7ValueText: UILabel!
    @IBOutlet weak var dayTwoHour7Image: UIImageView!
    @IBOutlet weak var dayTwoHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour7Time: UILabel!
    
    // MARK: - Day Three outlets
    @IBOutlet weak var dayThreeDay: UILabel!
    @IBOutlet weak var dayThreeHighLow: UILabel!
    @IBOutlet weak var dayThreePrecipitation: UILabel!
    @IBOutlet weak var dayThreeSummary: UITextView!
    @IBOutlet weak var dayThreeCondition: UIImageView!
    @IBOutlet weak var dayThreeForecastBar: UIImageView!
    
    @IBOutlet weak var dayThreeSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayThreePageControl: UIPageControl!
    
    @IBOutlet weak var dayThreeHour0Condition: UIImageView!
    @IBOutlet weak var dayThreeHour0ValueText: UILabel!
    @IBOutlet weak var dayThreeHour0Image: UIImageView!
    @IBOutlet weak var dayThreeHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour0Time: UILabel!
    
    @IBOutlet weak var dayThreeHour1Condition: UIImageView!
    @IBOutlet weak var dayThreeHour1ValueText: UILabel!
    @IBOutlet weak var dayThreeHour1Image: UIImageView!
    @IBOutlet weak var dayThreeHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour1Time: UILabel!
    
    @IBOutlet weak var dayThreeHour2Condition: UIImageView!
    @IBOutlet weak var dayThreeHour2ValueText: UILabel!
    @IBOutlet weak var dayThreeHour2Image: UIImageView!
    @IBOutlet weak var dayThreeHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour2Time: UILabel!
    
    @IBOutlet weak var dayThreeHour3Condition: UIImageView!
    @IBOutlet weak var dayThreeHour3ValueText: UILabel!
    @IBOutlet weak var dayThreeHour3Image: UIImageView!
    @IBOutlet weak var dayThreeHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour3Time: UILabel!
    
    @IBOutlet weak var dayThreeHour4Condition: UIImageView!
    @IBOutlet weak var dayThreeHour4ValueText: UILabel!
    @IBOutlet weak var dayThreeHour4Image: UIImageView!
    @IBOutlet weak var dayThreeHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour4Time: UILabel!
    
    @IBOutlet weak var dayThreeHour5Condition: UIImageView!
    @IBOutlet weak var dayThreeHour5ValueText: UILabel!
    @IBOutlet weak var dayThreeHour5Image: UIImageView!
    @IBOutlet weak var dayThreeHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour5Time: UILabel!
    
    @IBOutlet weak var dayThreeHour6Condition: UIImageView!
    @IBOutlet weak var dayThreeHour6ValueText: UILabel!
    @IBOutlet weak var dayThreeHour6Image: UIImageView!
    @IBOutlet weak var dayThreeHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour6Time: UILabel!
    
    @IBOutlet weak var dayThreeHour7Condition: UIImageView!
    @IBOutlet weak var dayThreeHour7ValueText: UILabel!
    @IBOutlet weak var dayThreeHour7Image: UIImageView!
    @IBOutlet weak var dayThreeHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour7Time: UILabel!
    
    // MARK: - Day Four outlets
    @IBOutlet weak var dayFourDay: UILabel!
    @IBOutlet weak var dayFourHighLow: UILabel!
    @IBOutlet weak var dayFourPrecipitation: UILabel!
    @IBOutlet weak var dayFourSummary: UITextView!
    @IBOutlet weak var dayFourCondition: UIImageView!
    @IBOutlet weak var dayFourForecastBar: UIImageView!
    
    @IBOutlet weak var dayFourSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayFourPageControl: UIPageControl!
    
    @IBOutlet weak var dayFourHour0Condition: UIImageView!
    @IBOutlet weak var dayFourHour0ValueText: UILabel!
    @IBOutlet weak var dayFourHour0Image: UIImageView!
    @IBOutlet weak var dayFourHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour0Time: UILabel!
    
    @IBOutlet weak var dayFourHour1Condition: UIImageView!
    @IBOutlet weak var dayFourHour1ValueText: UILabel!
    @IBOutlet weak var dayFourHour1Image: UIImageView!
    @IBOutlet weak var dayFourHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour1Time: UILabel!
    
    @IBOutlet weak var dayFourHour2Condition: UIImageView!
    @IBOutlet weak var dayFourHour2ValueText: UILabel!
    @IBOutlet weak var dayFourHour2Image: UIImageView!
    @IBOutlet weak var dayFourHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour2Time: UILabel!
    
    @IBOutlet weak var dayFourHour3Condition: UIImageView!
    @IBOutlet weak var dayFourHour3ValueText: UILabel!
    @IBOutlet weak var dayFourHour3Image: UIImageView!
    @IBOutlet weak var dayFourHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour3Time: UILabel!
    
    @IBOutlet weak var dayFourHour4Condition: UIImageView!
    @IBOutlet weak var dayFourHour4ValueText: UILabel!
    @IBOutlet weak var dayFourHour4Image: UIImageView!
    @IBOutlet weak var dayFourHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour4Time: UILabel!
    
    @IBOutlet weak var dayFourHour5Condition: UIImageView!
    @IBOutlet weak var dayFourHour5ValueText: UILabel!
    @IBOutlet weak var dayFourHour5Image: UIImageView!
    @IBOutlet weak var dayFourHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour5Time: UILabel!
    
    @IBOutlet weak var dayFourHour6Condition: UIImageView!
    @IBOutlet weak var dayFourHour6ValueText: UILabel!
    @IBOutlet weak var dayFourHour6Image: UIImageView!
    @IBOutlet weak var dayFourHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour6Time: UILabel!
    
    @IBOutlet weak var dayFourHour7Condition: UIImageView!
    @IBOutlet weak var dayFourHour7ValueText: UILabel!
    @IBOutlet weak var dayFourHour7Image: UIImageView!
    @IBOutlet weak var dayFourHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour7Time: UILabel!
    
    // MARK: - Day Five outlets
    @IBOutlet weak var dayFiveDay: UILabel!
    @IBOutlet weak var dayFiveHighLow: UILabel!
    @IBOutlet weak var dayFivePrecipitation: UILabel!
    @IBOutlet weak var dayFiveSummary: UITextView!
    @IBOutlet weak var dayFiveCondition: UIImageView!
    @IBOutlet weak var dayFiveForecastBar: UIImageView!
    
    @IBOutlet weak var dayFiveSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayFivePageControl: UIPageControl!
    
    @IBOutlet weak var dayFiveHour0Condition: UIImageView!
    @IBOutlet weak var dayFiveHour0ValueText: UILabel!
    @IBOutlet weak var dayFiveHour0Image: UIImageView!
    @IBOutlet weak var dayFiveHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour0Time: UILabel!
    
    @IBOutlet weak var dayFiveHour1Condition: UIImageView!
    @IBOutlet weak var dayFiveHour1ValueText: UILabel!
    @IBOutlet weak var dayFiveHour1Image: UIImageView!
    @IBOutlet weak var dayFiveHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour1Time: UILabel!
    
    @IBOutlet weak var dayFiveHour2Condition: UIImageView!
    @IBOutlet weak var dayFiveHour2ValueText: UILabel!
    @IBOutlet weak var dayFiveHour2Image: UIImageView!
    @IBOutlet weak var dayFiveHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour2Time: UILabel!
    
    @IBOutlet weak var dayFiveHour3Condition: UIImageView!
    @IBOutlet weak var dayFiveHour3ValueText: UILabel!
    @IBOutlet weak var dayFiveHour3Image: UIImageView!
    @IBOutlet weak var dayFiveHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour3Time: UILabel!
    
    @IBOutlet weak var dayFiveHour4Condition: UIImageView!
    @IBOutlet weak var dayFiveHour4ValueText: UILabel!
    @IBOutlet weak var dayFiveHour4Image: UIImageView!
    @IBOutlet weak var dayFiveHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour4Time: UILabel!
    
    @IBOutlet weak var dayFiveHour5Condition: UIImageView!
    @IBOutlet weak var dayFiveHour5ValueText: UILabel!
    @IBOutlet weak var dayFiveHour5Image: UIImageView!
    @IBOutlet weak var dayFiveHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour5Time: UILabel!
    
    @IBOutlet weak var dayFiveHour6Condition: UIImageView!
    @IBOutlet weak var dayFiveHour6ValueText: UILabel!
    @IBOutlet weak var dayFiveHour6Image: UIImageView!
    @IBOutlet weak var dayFiveHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour6Time: UILabel!
    
    @IBOutlet weak var dayFiveHour7Condition: UIImageView!
    @IBOutlet weak var dayFiveHour7ValueText: UILabel!
    @IBOutlet weak var dayFiveHour7Image: UIImageView!
    @IBOutlet weak var dayFiveHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour7Time: UILabel!
    
    // MARK: - Day Six outlets
    @IBOutlet weak var daySixDay: UILabel!
    @IBOutlet weak var daySixHighLow: UILabel!
    @IBOutlet weak var daySixPrecipitation: UILabel!
    @IBOutlet weak var daySixSummary: UITextView!
    @IBOutlet weak var daySixCondition: UIImageView!
    @IBOutlet weak var daySixForecastBar: UIImageView!
    
    @IBOutlet weak var daySixSegmentControl: UISegmentedControl!
    @IBOutlet weak var daySixPageControl: UIPageControl!
    
    @IBOutlet weak var daySixHour0Condition: UIImageView!
    @IBOutlet weak var daySixHour0ValueText: UILabel!
    @IBOutlet weak var daySixHour0Image: UIImageView!
    @IBOutlet weak var daySixHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour0Time: UILabel!
    
    @IBOutlet weak var daySixHour1Condition: UIImageView!
    @IBOutlet weak var daySixHour1ValueText: UILabel!
    @IBOutlet weak var daySixHour1Image: UIImageView!
    @IBOutlet weak var daySixHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour1Time: UILabel!
    
    @IBOutlet weak var daySixHour2Condition: UIImageView!
    @IBOutlet weak var daySixHour2ValueText: UILabel!
    @IBOutlet weak var daySixHour2Image: UIImageView!
    @IBOutlet weak var daySixHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour2Time: UILabel!
    
    @IBOutlet weak var daySixHour3Condition: UIImageView!
    @IBOutlet weak var daySixHour3ValueText: UILabel!
    @IBOutlet weak var daySixHour3Image: UIImageView!
    @IBOutlet weak var daySixHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour3Time: UILabel!
    
    @IBOutlet weak var daySixHour4Condition: UIImageView!
    @IBOutlet weak var daySixHour4ValueText: UILabel!
    @IBOutlet weak var daySixHour4Image: UIImageView!
    @IBOutlet weak var daySixHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour4Time: UILabel!
    
    @IBOutlet weak var daySixHour5Condition: UIImageView!
    @IBOutlet weak var daySixHour5ValueText: UILabel!
    @IBOutlet weak var daySixHour5Image: UIImageView!
    @IBOutlet weak var daySixHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour5Time: UILabel!
    
    @IBOutlet weak var daySixHour6Condition: UIImageView!
    @IBOutlet weak var daySixHour6ValueText: UILabel!
    @IBOutlet weak var daySixHour6Image: UIImageView!
    @IBOutlet weak var daySixHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour6Time: UILabel!
    
    @IBOutlet weak var daySixHour7Condition: UIImageView!
    @IBOutlet weak var daySixHour7ValueText: UILabel!
    @IBOutlet weak var daySixHour7Image: UIImageView!
    @IBOutlet weak var daySixHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour7Time: UILabel!
    
    // MARK: - Day Seven outlets
    @IBOutlet weak var daySevenDay: UILabel!
    @IBOutlet weak var daySevenHighLow: UILabel!
    @IBOutlet weak var daySevenPrecipitation: UILabel!
    @IBOutlet weak var daySevenSummary: UITextView!
    @IBOutlet weak var daySevenCondition: UIImageView!
    @IBOutlet weak var daySevenForecastBar: UIImageView!
    
    @IBOutlet weak var daySevenSegmentControl: UISegmentedControl!
    @IBOutlet weak var daySevenPageControl: UIPageControl!
    
    @IBOutlet weak var daySevenHour0Condition: UIImageView!
    @IBOutlet weak var daySevenHour0ValueText: UILabel!
    @IBOutlet weak var daySevenHour0Image: UIImageView!
    @IBOutlet weak var daySevenHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour0Time: UILabel!
    
    @IBOutlet weak var daySevenHour1Condition: UIImageView!
    @IBOutlet weak var daySevenHour1ValueText: UILabel!
    @IBOutlet weak var daySevenHour1Image: UIImageView!
    @IBOutlet weak var daySevenHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour1Time: UILabel!
    
    @IBOutlet weak var daySevenHour2Condition: UIImageView!
    @IBOutlet weak var daySevenHour2ValueText: UILabel!
    @IBOutlet weak var daySevenHour2Image: UIImageView!
    @IBOutlet weak var daySevenHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour2Time: UILabel!
    
    @IBOutlet weak var daySevenHour3Condition: UIImageView!
    @IBOutlet weak var daySevenHour3ValueText: UILabel!
    @IBOutlet weak var daySevenHour3Image: UIImageView!
    @IBOutlet weak var daySevenHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour3Time: UILabel!
    
    @IBOutlet weak var daySevenHour4Condition: UIImageView!
    @IBOutlet weak var daySevenHour4ValueText: UILabel!
    @IBOutlet weak var daySevenHour4Image: UIImageView!
    @IBOutlet weak var daySevenHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour4Time: UILabel!
    
    @IBOutlet weak var daySevenHour5Condition: UIImageView!
    @IBOutlet weak var daySevenHour5ValueText: UILabel!
    @IBOutlet weak var daySevenHour5Image: UIImageView!
    @IBOutlet weak var daySevenHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour5Time: UILabel!
    
    @IBOutlet weak var daySevenHour6Condition: UIImageView!
    @IBOutlet weak var daySevenHour6ValueText: UILabel!
    @IBOutlet weak var daySevenHour6Image: UIImageView!
    @IBOutlet weak var daySevenHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour6Time: UILabel!
    
    @IBOutlet weak var daySevenHour7Condition: UIImageView!
    @IBOutlet weak var daySevenHour7ValueText: UILabel!
    @IBOutlet weak var daySevenHour7Image: UIImageView!
    @IBOutlet weak var daySevenHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour7Time: UILabel!
    
    // MARK: - Day Eight outlets
    @IBOutlet weak var dayEightDay: UILabel!
    @IBOutlet weak var dayEightHighLow: UILabel!
    @IBOutlet weak var dayEightPrecipitation: UILabel!
    @IBOutlet weak var dayEightSummary: UITextView!
    @IBOutlet weak var dayEightCondition: UIImageView!
    @IBOutlet weak var dayEightForecastBar: UIImageView!
    
    @IBOutlet weak var dayEightSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayEightPageControl: UIPageControl!
    
    @IBOutlet weak var dayEightHour0Condition: UIImageView!
    @IBOutlet weak var dayEightHour0ValueText: UILabel!
    @IBOutlet weak var dayEightHour0Image: UIImageView!
    @IBOutlet weak var dayEightHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour0Time: UILabel!
    
    @IBOutlet weak var dayEightHour1Condition: UIImageView!
    @IBOutlet weak var dayEightHour1ValueText: UILabel!
    @IBOutlet weak var dayEightHour1Image: UIImageView!
    @IBOutlet weak var dayEightHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour1Time: UILabel!
    
    @IBOutlet weak var dayEightHour2Condition: UIImageView!
    @IBOutlet weak var dayEightHour2ValueText: UILabel!
    @IBOutlet weak var dayEightHour2Image: UIImageView!
    @IBOutlet weak var dayEightHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour2Time: UILabel!
    
    @IBOutlet weak var dayEightHour3Condition: UIImageView!
    @IBOutlet weak var dayEightHour3ValueText: UILabel!
    @IBOutlet weak var dayEightHour3Image: UIImageView!
    @IBOutlet weak var dayEightHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour3Time: UILabel!
    
    @IBOutlet weak var dayEightHour4Condition: UIImageView!
    @IBOutlet weak var dayEightHour4ValueText: UILabel!
    @IBOutlet weak var dayEightHour4Image: UIImageView!
    @IBOutlet weak var dayEightHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour4Time: UILabel!
    
    @IBOutlet weak var dayEightHour5Condition: UIImageView!
    @IBOutlet weak var dayEightHour5ValueText: UILabel!
    @IBOutlet weak var dayEightHour5Image: UIImageView!
    @IBOutlet weak var dayEightHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour5Time: UILabel!
    
    @IBOutlet weak var dayEightHour6Condition: UIImageView!
    @IBOutlet weak var dayEightHour6ValueText: UILabel!
    @IBOutlet weak var dayEightHour6Image: UIImageView!
    @IBOutlet weak var dayEightHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour6Time: UILabel!
    
    @IBOutlet weak var dayEightHour7Condition: UIImageView!
    @IBOutlet weak var dayEightHour7ValueText: UILabel!
    @IBOutlet weak var dayEightHour7Image: UIImageView!
    @IBOutlet weak var dayEightHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayEightHour7Time: UILabel!
    
    // MARK: - Day Nine outlets
    @IBOutlet weak var dayNineDay: UILabel!
    @IBOutlet weak var dayNineHighLow: UILabel!
    @IBOutlet weak var dayNinePrecipitation: UILabel!
    @IBOutlet weak var dayNineSummary: UITextView!
    @IBOutlet weak var dayNineCondition: UIImageView!
    @IBOutlet weak var dayNineForecastBar: UIImageView!
    
    @IBOutlet weak var dayNineSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayNinePageControl: UIPageControl!
    
    @IBOutlet weak var dayNineHour0Condition: UIImageView!
    @IBOutlet weak var dayNineHour0ValueText: UILabel!
    @IBOutlet weak var dayNineHour0Image: UIImageView!
    @IBOutlet weak var dayNineHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour0Time: UILabel!
    
    @IBOutlet weak var dayNineHour1Condition: UIImageView!
    @IBOutlet weak var dayNineHour1ValueText: UILabel!
    @IBOutlet weak var dayNineHour1Image: UIImageView!
    @IBOutlet weak var dayNineHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour1Time: UILabel!
    
    @IBOutlet weak var dayNineHour2Condition: UIImageView!
    @IBOutlet weak var dayNineHour2ValueText: UILabel!
    @IBOutlet weak var dayNineHour2Image: UIImageView!
    @IBOutlet weak var dayNineHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour2Time: UILabel!
    
    @IBOutlet weak var dayNineHour3Condition: UIImageView!
    @IBOutlet weak var dayNineHour3ValueText: UILabel!
    @IBOutlet weak var dayNineHour3Image: UIImageView!
    @IBOutlet weak var dayNineHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour3Time: UILabel!
    
    @IBOutlet weak var dayNineHour4Condition: UIImageView!
    @IBOutlet weak var dayNineHour4ValueText: UILabel!
    @IBOutlet weak var dayNineHour4Image: UIImageView!
    @IBOutlet weak var dayNineHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour4Time: UILabel!
    
    @IBOutlet weak var dayNineHour5Condition: UIImageView!
    @IBOutlet weak var dayNineHour5ValueText: UILabel!
    @IBOutlet weak var dayNineHour5Image: UIImageView!
    @IBOutlet weak var dayNineHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour5Time: UILabel!
    
    @IBOutlet weak var dayNineHour6Condition: UIImageView!
    @IBOutlet weak var dayNineHour6ValueText: UILabel!
    @IBOutlet weak var dayNineHour6Image: UIImageView!
    @IBOutlet weak var dayNineHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour6Time: UILabel!
    
    @IBOutlet weak var dayNineHour7Condition: UIImageView!
    @IBOutlet weak var dayNineHour7ValueText: UILabel!
    @IBOutlet weak var dayNineHour7Image: UIImageView!
    @IBOutlet weak var dayNineHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayNineHour7Time: UILabel!
    
    // MARK: - General constraints
    @IBOutlet weak var daysStackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var nextDaysLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var weatherAlertWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayZeroHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayZeroPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayZeroSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayZeroBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayOneHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayOnePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayOneSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayOneBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayTwoHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwoPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwoSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwoBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayThreeHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThreePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThreeSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThreeBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayFourHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFourPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFourSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFourBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayFiveHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFivePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFiveSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFiveBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var daySixHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var daySixPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var daySixSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var daySixBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var daySevenHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var daySevenPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var daySevenSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var daySevenBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayEightHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayEightPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayEightSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayEightBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayNineHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayNinePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayNineSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayNineBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var detailsLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var nextHoursLabelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var currentConditionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentConditionStackViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        self.tabBarController?.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Precip") == true {
            hourlySegmentControl.selectedSegmentIndex = 0
        } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Temp") == true {
            hourlySegmentControl.selectedSegmentIndex = 1
        } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Humidity") == true {
            hourlySegmentControl.selectedSegmentIndex = 2
        } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Index") == true {
            hourlySegmentControl.selectedSegmentIndex = 3
        } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Wind") == true {
            hourlySegmentControl.selectedSegmentIndex = 4
        } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Cloud") == true {
            hourlySegmentControl.selectedSegmentIndex = 5
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            if userSelectedSavedLocation == false {
                locationManager.distanceFilter = 100
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        DispatchQueue.main.async() {
            self.setupInitialLoad()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            if currentSummary.isEmpty == false {
                self.locationManager.stopUpdatingLocation()
            }
        }
        
        // If user has viewed 10 times request review
        defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
        if defaults.integer(forKey: "userViewedCounter") == 10 {
            SKStoreReviewController.requestReview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Check for loaded weather, distance change, or color theme change
        if weatherLoaded == false || distanceChange == true || dataSourceChanged == true || userChangedColorTheme == true {
            loadingScreen()
        }
        
        // Check for units or clock change
        if unitsChanged == true || clockChanged == true {
            loadingScreen()
            unitsChanged = false
            clockChanged = false
        }
        
        // Setup for pull to refresh
        scrollView.alwaysBounceVertical = true
        scrollView.bounces  = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
    }
    
    // MARK: - Get location and weather data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defaults.set(false, forKey: "userDeniedLocation")
        if userSelectedSavedLocation == true {
            let address = "\(selectedLocation)"
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        // handle no location found
                        return
                }
                selectedLatitudeValue = location.coordinate.latitude
                selectedLongitudeValue = location.coordinate.longitude
                latitudeValue = location.coordinate.latitude
                longitudeValue = location.coordinate.longitude

                self.navigationController?.navigationBar.topItem?.title = "\(selectedLocation)"
                self.setupInitialData()
            }
        } else {
            geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
                guard let placemark = placemark, error == nil else { return }
                
                latitudeValue = (manager.location?.coordinate.latitude)!
                longitudeValue = (manager.location?.coordinate.longitude)!
                
                if defaults.bool(forKey: "weatherUnitsUSA") == false && defaults.bool(forKey: "weatherUnitsUK") == false && defaults.bool(forKey: "weatherUnitsCanada") == false && defaults.bool(forKey: "weatherUnitsInternational") == false {
                    if placemark.country! == "United States" {
                        defaults.set(true, forKey: "weatherUnitsUSA")
                    } else if placemark.country! == "Canada" {
                        defaults.set(true, forKey: "weatherUnitsCanada")
                    } else if placemark.country! == "United Kingdom" {
                        defaults.set(true, forKey: "weatherUnitsUK")
                    } else {
                        defaults.set(true, forKey: "weatherUnitsInternational")
                    }
                }
                
                // Set state for locations in the US
                if String(placemark.country!) == "United States" {
                    self.navigationController?.navigationBar.topItem?.title = "\(placemark.locality!), \(placemark.administrativeArea!)"
                    userCurrentLocation = "\(placemark.locality!), \(placemark.administrativeArea!)"
                } else {
                    self.navigationController?.navigationBar.topItem?.title = "\(placemark.locality!), \(placemark.country!)"
                    userCurrentLocation = "\(placemark.locality!), \(placemark.country!)"
                }
                self.setupInitialData()
            }
        }
    }
    
    // MARK: - Show error when location cannot be found
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        defaults.set(true, forKey: "userDeniedLocation")
        setupDeniedLocation()
    }
    
    // MARK: - Fetch user location if denied location access
    func setupDeniedLocation() {
        placesClient = GMSPlacesClient.shared()
        
        if (defaults.bool(forKey: "userDeniedLocation") == true) && (defaults.string(forKey: "savedSelectedLocation")?.isEmpty == false) {
            let address = defaults.string(forKey: "savedSelectedLocation")
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address!) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        // handle no location found
                        return
                }
                selectedLatitudeValue = location.coordinate.latitude
                selectedLongitudeValue = location.coordinate.longitude
                latitudeValue = location.coordinate.latitude
                longitudeValue = location.coordinate.longitude
                defaults.set(selectedLatitudeValue, forKey: "savedSelectedLatitudeValue")
                defaults.set(selectedLongitudeValue, forKey: "savedSelectedLongitudeValue")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(selectedLatitudeValue, forKey: "setWidgetLatitude")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(selectedLongitudeValue, forKey: "setWidgetLongitude")
                
                self.navigationController?.navigationBar.topItem?.title = "\(defaults.string(forKey: "savedSelectedLocation") ?? "New York, NY")"
                self.setupInitialData()
            }
            setWeatherDataLabels()
        } else {
            showLocationDisabledPopUp()
        }
    }
    
    // MARK: - Setup loading screen view
    func loadingScreen() {
        var loadFrame : CGRect = CGRect(x: 0, y: 0, width: 815, height: 815)
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight >= 812 {
            loadFrame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        } else {
            loadFrame = CGRect(x: 0, y: 0, width: 815, height: 815)
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
        
        let backgroundColor = UIColor(named: "customControlColor")
        let loadView : UIView = UIView(frame: loadFrame)
        loadView.backgroundColor = backgroundColor
        loadView.alpha = 1.0
        loadView.addSubview(activityIndicator)
        self.navigationController?.view.addSubview(loadView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            loadView.removeFromSuperview()
            self.setupInitialLoad()
            self.setWeatherDataLabels()
        }
    }

    func showLocationDisabledPopUp() {
        defaults.set(true, forKey: "userDeniedLocation")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Locations")
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Refresh data and labels
    @objc func didPullToRefresh() {
        setupInitialData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setWeatherDataLabels()
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Initial load of all values for images and labels
    func setupInitialLoad() {
        setWeatherDataLabels()
        setupObjectColors()
        setupConstraints()
    }
    
    // MARK: Intial load of weather data
    func setupInitialData() {
        fetchDarkSkyWeatherData()
        setWeatherDataLabels()
    }
    
    // MARK: - Setup constraints & stack views
    func setSpacing(width: CGFloat, spacing: CGFloat) {
        daysStackViewWidth.constant = width
        weatherAlertWidth.constant = width
        
        dayZeroTopStackView.spacing = spacing
        dayOneTopStackView.spacing = spacing
        dayTwoTopStackView.spacing = spacing
        dayThreeTopStackView.spacing = spacing
        dayFourTopStackView.spacing = spacing
        dayFiveTopStackView.spacing = spacing
        daySixTopStackView.spacing = spacing
        daySevenTopStackView.spacing = spacing
        dayEightTopStackView.spacing = spacing
        dayNineTopStackView.spacing = spacing
    }
    
    func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            setSpacing(width: 300, spacing: 2)
            
            currentConditionStackViewWidth.constant = 300
            detailsLabelWidth.constant = 300
            nextHoursLabelWidth.constant = 300
            nextDaysLabelWidth.constant = 300
            
            dayZeroHighLowWidth.constant = 101
            dayZeroPrecipitationWidth.constant = 100
            dayZeroSummaryWidth.constant = 300
            dayZeroBarWidth.constant = 300
            
            dayOneHighLowWidth.constant = 101
            dayOnePrecipitationWidth.constant = 100
            dayOneSummaryWidth.constant = 300
            dayOneBarWidth.constant = 300
            
            dayTwoHighLowWidth.constant = 101
            dayTwoPrecipitationWidth.constant = 100
            dayTwoSummaryWidth.constant = 300
            dayTwoBarWidth.constant = 300
            
            dayThreeHighLowWidth.constant = 101
            dayThreePrecipitationWidth.constant = 100
            dayThreeSummaryWidth.constant = 300
            dayThreeBarWidth.constant = 300
            
            dayFourHighLowWidth.constant = 101
            dayFourPrecipitationWidth.constant = 100
            dayFourSummaryWidth.constant = 300
            dayFourBarWidth.constant = 300
            
            dayFiveHighLowWidth.constant = 101
            dayFivePrecipitationWidth.constant = 100
            dayFiveSummaryWidth.constant = 300
            dayFiveBarWidth.constant = 300
            
            daySixHighLowWidth.constant = 101
            daySixPrecipitationWidth.constant = 100
            daySixSummaryWidth.constant = 300
            daySixBarWidth.constant = 300
            
            daySevenHighLowWidth.constant = 101
            daySevenPrecipitationWidth.constant = 100
            daySevenSummaryWidth.constant = 300
            daySevenBarWidth.constant = 300
            
            dayEightHighLowWidth.constant = 101
            dayEightPrecipitationWidth.constant = 100
            dayEightSummaryWidth.constant = 300
            dayEightBarWidth.constant = 300
            
            dayNineHighLowWidth.constant = 101
            dayNinePrecipitationWidth.constant = 100
            dayNineSummaryWidth.constant = 300
            dayNineBarWidth.constant = 300
        }
        
        dayZeroStackView.isHidden = true
        dayOneStackView.isHidden = true
        dayTwoStackView.isHidden = true
        dayThreeStackView.isHidden = true
        dayFourStackView.isHidden = true
        dayFiveStackView.isHidden = true
        daySixStackView.isHidden = true
        daySevenStackView.isHidden = true
        dayEightStackView.isHidden = true
        dayNineStackView.isHidden = true
    }
    
    // MARK: - Set colors for all objects
    func setupObjectColors() {
        checkColorTheme(color: defaults.string(forKey: "userSavedColorString")!)
        setTabBarColor(tabBar: tabBarController!)
        
        if traitCollection.userInterfaceStyle == .light {
            hourlyPageControl.currentPageIndicatorTintColor = .label
            dayZeroPageControl.currentPageIndicatorTintColor = .label
            dayOnePageControl.currentPageIndicatorTintColor = .label
            dayTwoPageControl.currentPageIndicatorTintColor = .label
            dayThreePageControl.currentPageIndicatorTintColor = .label
            dayFourPageControl.currentPageIndicatorTintColor = .label
            dayFivePageControl.currentPageIndicatorTintColor = .label
            daySixPageControl.currentPageIndicatorTintColor = .label
            daySevenPageControl.currentPageIndicatorTintColor = .label
            dayEightPageControl.currentPageIndicatorTintColor = .label
            dayNinePageControl.currentPageIndicatorTintColor = .label
            
            hourlyPageControl.pageIndicatorTintColor = .secondaryLabel
            dayZeroPageControl.pageIndicatorTintColor = .secondaryLabel
            dayOnePageControl.pageIndicatorTintColor = .secondaryLabel
            dayTwoPageControl.pageIndicatorTintColor = .secondaryLabel
            dayThreePageControl.pageIndicatorTintColor = .secondaryLabel
            dayFourPageControl.pageIndicatorTintColor = .secondaryLabel
            dayFivePageControl.pageIndicatorTintColor = .secondaryLabel
            daySixPageControl.pageIndicatorTintColor = .secondaryLabel
            daySevenPageControl.pageIndicatorTintColor = .secondaryLabel
            dayEightPageControl.pageIndicatorTintColor = .secondaryLabel
            dayNinePageControl.pageIndicatorTintColor = .secondaryLabel
        }
    }
    
    // MARK: - Check Color Theme and set forecast bar images
    func checkColorTheme(color: String) {
        // Forecast Bars
        dayZeroForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayOneForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayTwoForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayThreeForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayFourForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayFiveForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        daySixForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        daySevenForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayEightForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayNineForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
    }
    
    // MARK: - Set daily condition images
    // Days 0-7
    func setDailyConditionImages() {
        dayZeroCondition.image = UIImage(named: weatherCondition(condition: weatherCondition0, type: "daily"))
        dayOneCondition.image = UIImage(named: weatherCondition(condition: weatherCondition1, type: "daily"))
        dayTwoCondition.image = UIImage(named: weatherCondition(condition: weatherCondition2, type: "daily"))
        dayThreeCondition.image = UIImage(named: weatherCondition(condition: weatherCondition3, type: "daily"))
        dayFourCondition.image = UIImage(named: weatherCondition(condition: weatherCondition4, type: "daily"))
        dayFiveCondition.image = UIImage(named: weatherCondition(condition: weatherCondition5, type: "daily"))
        daySixCondition.image = UIImage(named: weatherCondition(condition: weatherCondition6, type: "daily"))
        daySevenCondition.image = UIImage(named: weatherCondition(condition: weatherCondition7, type: "daily"))
        dayEightCondition.image = UIImage(named: weatherCondition(condition: weatherCondition8, type: "daily"))
        dayNineCondition.image = UIImage(named: weatherCondition(condition: weatherCondition9, type: "daily"))
    }
    
    // Set hourly condition values for each page or segment control tap
    func setHourlyConditionOutlets(day: Int, segmentControl: UISegmentedControl, pageControl: UIPageControl!) {
        if day == 0 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayZeroUISetup(condition0: dayZeroCondition0, condition1: dayZeroCondition1, condition2: dayZeroCondition2, condition3: dayZeroCondition3, condition4: dayZeroCondition4, condition5: dayZeroCondition5, condition6: dayZeroCondition6, condition7: dayZeroCondition7, int0: dayZeroPrecip0, int1: dayZeroPrecip1, int2: dayZeroPrecip2, int3: dayZeroPrecip3, int4: dayZeroPrecip4, int5: dayZeroPrecip5, int6: dayZeroPrecip6, int7: dayZeroPrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayZeroUISetup(condition0: dayZeroCondition8, condition1: dayZeroCondition9, condition2: dayZeroCondition10, condition3: dayZeroCondition11, condition4: dayZeroCondition12, condition5: dayZeroCondition13, condition6: dayZeroCondition14, condition7: dayZeroCondition15, int0: dayZeroPrecip8, int1: dayZeroPrecip9, int2: dayZeroPrecip10, int3: dayZeroPrecip11, int4: dayZeroPrecip12, int5: dayZeroPrecip13, int6: dayZeroPrecip14, int7: dayZeroPrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayZeroUISetup(condition0: dayZeroCondition0, condition1: dayZeroCondition1, condition2: dayZeroCondition2, condition3: dayZeroCondition3, condition4: dayZeroCondition4, condition5: dayZeroCondition5, condition6: dayZeroCondition6, condition7: dayZeroCondition7, int0: dayZeroTemp0, int1: dayZeroTemp1, int2: dayZeroTemp2, int3: dayZeroTemp3, int4: dayZeroTemp4, int5: dayZeroTemp5, int6: dayZeroTemp6, int7: dayZeroTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayZeroUISetup(condition0: dayZeroCondition8, condition1: dayZeroCondition9, condition2: dayZeroCondition10, condition3: dayZeroCondition11, condition4: dayZeroCondition12, condition5: dayZeroCondition13, condition6: dayZeroCondition14, condition7: dayZeroCondition15, int0: dayZeroTemp8, int1: dayZeroTemp9, int2: dayZeroTemp10, int3: dayZeroTemp11, int4: dayZeroTemp12, int5: dayZeroTemp13, int6: dayZeroTemp14, int7: dayZeroTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDayZeroUISetup(condition0: dayZeroCondition0, condition1: dayZeroCondition1, condition2: dayZeroCondition2, condition3: dayZeroCondition3, condition4: dayZeroCondition4, condition5: dayZeroCondition5, condition6: dayZeroCondition6, condition7: dayZeroCondition7, int0: dayZeroHumidity0, int1: dayZeroHumidity1, int2: dayZeroHumidity2, int3: dayZeroHumidity3, int4: dayZeroHumidity4, int5: dayZeroHumidity5, int6: dayZeroHumidity6, int7: dayZeroHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayZeroUISetup(condition0: dayZeroCondition8, condition1: dayZeroCondition9, condition2: dayZeroCondition10, condition3: dayZeroCondition11, condition4: dayZeroCondition12, condition5: dayZeroCondition13, condition6: dayZeroCondition14, condition7: dayZeroCondition15, int0: dayZeroHumidity8, int1: dayZeroHumidity9, int2: dayZeroHumidity10, int3: dayZeroHumidity11, int4: dayZeroHumidity12, int5: dayZeroHumidity13, int6: dayZeroHumidity14, int7: dayZeroHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayZeroUISetup(condition0: dayZeroCondition0, condition1: dayZeroCondition1, condition2: dayZeroCondition2, condition3: dayZeroCondition3, condition4: dayZeroCondition4, condition5: dayZeroCondition5, condition6: dayZeroCondition6, condition7: dayZeroCondition7, int0: dayZeroIndex0, int1: dayZeroIndex1, int2: dayZeroIndex2, int3: dayZeroIndex3, int4: dayZeroIndex4, int5: dayZeroIndex5, int6: dayZeroIndex6, int7: dayZeroIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayZeroUISetup(condition0: dayZeroCondition8, condition1: dayZeroCondition9, condition2: dayZeroCondition10, condition3: dayZeroCondition11, condition4: dayZeroCondition12, condition5: dayZeroCondition13, condition6: dayZeroCondition14, condition7: dayZeroCondition15, int0: dayZeroIndex8, int1: dayZeroIndex9, int2: dayZeroIndex10, int3: dayZeroIndex11, int4: dayZeroIndex12, int5: dayZeroIndex13, int6: dayZeroIndex14, int7: dayZeroIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayZeroUISetup(condition0: dayZeroCondition0, condition1: dayZeroCondition1, condition2: dayZeroCondition2, condition3: dayZeroCondition3, condition4: dayZeroCondition4, condition5: dayZeroCondition5, condition6: dayZeroCondition6, condition7: dayZeroCondition7, int0: dayZeroWindSpeed0, int1: dayZeroWindSpeed1, int2: dayZeroWindSpeed2, int3: dayZeroWindSpeed3, int4: dayZeroWindSpeed4, int5: dayZeroWindSpeed5, int6: dayZeroWindSpeed6, int7: dayZeroWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayZeroUISetup(condition0: dayZeroCondition8, condition1: dayZeroCondition9, condition2: dayZeroCondition10, condition3: dayZeroCondition11, condition4: dayZeroCondition12, condition5: dayZeroCondition13, condition6: dayZeroCondition14, condition7: dayZeroCondition15, int0: dayZeroWindSpeed8, int1: dayZeroWindSpeed9, int2: dayZeroWindSpeed10, int3: dayZeroWindSpeed11, int4: dayZeroWindSpeed12, int5: dayZeroWindSpeed13, int6: dayZeroWindSpeed14, int7: dayZeroWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayZeroUISetup(condition0: dayZeroCondition0, condition1: dayZeroCondition1, condition2: dayZeroCondition2, condition3: dayZeroCondition3, condition4: dayZeroCondition4, condition5: dayZeroCondition5, condition6: dayZeroCondition6, condition7: dayZeroCondition7, int0: dayZeroCloudCover0, int1: dayZeroCloudCover1, int2: dayZeroCloudCover2, int3: dayZeroCloudCover3, int4: dayZeroCloudCover4, int5: dayZeroCloudCover5, int6: dayZeroCloudCover6, int7: dayZeroCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayZeroUISetup(condition0: dayZeroCondition8, condition1: dayZeroCondition9, condition2: dayZeroCondition10, condition3: dayZeroCondition11, condition4: dayZeroCondition12, condition5: dayZeroCondition13, condition6: dayZeroCondition14, condition7: dayZeroCondition15, int0: dayZeroCloudCover8, int1: dayZeroCloudCover9, int2: dayZeroCloudCover10, int3: dayZeroCloudCover11, int4: dayZeroCloudCover12, int5: dayZeroCloudCover13, int6: dayZeroCloudCover14, int7: dayZeroCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 1 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayOneUISetup(condition0: dayOneCondition0, condition1: dayOneCondition1, condition2: dayOneCondition2, condition3: dayOneCondition3, condition4: dayOneCondition4, condition5: dayOneCondition5, condition6: dayOneCondition6, condition7: dayOneCondition7, int0: dayOnePrecip0, int1: dayOnePrecip1, int2: dayOnePrecip2, int3: dayOnePrecip3, int4: dayOnePrecip4, int5: dayOnePrecip5, int6: dayOnePrecip6, int7: dayOnePrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayOneUISetup(condition0: dayOneCondition8, condition1: dayOneCondition9, condition2: dayOneCondition10, condition3: dayOneCondition11, condition4: dayOneCondition12, condition5: dayOneCondition13, condition6: dayOneCondition14, condition7: dayOneCondition15, int0: dayOnePrecip8, int1: dayOnePrecip9, int2: dayOnePrecip10, int3: dayOnePrecip11, int4: dayOnePrecip12, int5: dayOnePrecip13, int6: dayOnePrecip14, int7: dayOnePrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayOneUISetup(condition0: dayOneCondition0, condition1: dayOneCondition1, condition2: dayOneCondition2, condition3: dayOneCondition3, condition4: dayOneCondition4, condition5: dayOneCondition5, condition6: dayOneCondition6, condition7: dayOneCondition7, int0: dayOneTemp0, int1: dayOneTemp1, int2: dayOneTemp2, int3: dayOneTemp3, int4: dayOneTemp4, int5: dayOneTemp5, int6: dayOneTemp6, int7: dayOneTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayOneUISetup(condition0: dayOneCondition8, condition1: dayOneCondition9, condition2: dayOneCondition10, condition3: dayOneCondition11, condition4: dayOneCondition12, condition5: dayOneCondition13, condition6: dayOneCondition14, condition7: dayOneCondition15, int0: dayOneTemp8, int1: dayOneTemp9, int2: dayOneTemp10, int3: dayOneTemp11, int4: dayOneTemp12, int5: dayOneTemp13, int6: dayOneTemp14, int7: dayOneTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2  {
                if pageControl.currentPage == 0 {
                    completeDayOneUISetup(condition0: dayOneCondition0, condition1: dayOneCondition1, condition2: dayOneCondition2, condition3: dayOneCondition3, condition4: dayOneCondition4, condition5: dayOneCondition5, condition6: dayOneCondition6, condition7: dayOneCondition7, int0: dayOneHumidity0, int1: dayOneHumidity1, int2: dayOneHumidity2, int3: dayOneHumidity3, int4: dayOneHumidity4, int5: dayOneHumidity5, int6: dayOneHumidity6, int7: dayOneHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayOneUISetup(condition0: dayOneCondition8, condition1: dayOneCondition9, condition2: dayOneCondition10, condition3: dayOneCondition11, condition4: dayOneCondition12, condition5: dayOneCondition13, condition6: dayOneCondition14, condition7: dayOneCondition15, int0: dayOneHumidity8, int1: dayOneHumidity9, int2: dayOneHumidity10, int3: dayOneHumidity11, int4: dayOneHumidity12, int5: dayOneHumidity13, int6: dayOneHumidity14, int7: dayOneHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayOneUISetup(condition0: dayOneCondition0, condition1: dayOneCondition1, condition2: dayOneCondition2, condition3: dayOneCondition3, condition4: dayOneCondition4, condition5: dayOneCondition5, condition6: dayOneCondition6, condition7: dayOneCondition7, int0: dayOneIndex0, int1: dayOneIndex1, int2: dayOneIndex2, int3: dayOneIndex3, int4: dayOneIndex4, int5: dayOneIndex5, int6: dayOneIndex6, int7: dayOneIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayOneUISetup(condition0: dayOneCondition8, condition1: dayOneCondition9, condition2: dayOneCondition10, condition3: dayOneCondition11, condition4: dayOneCondition12, condition5: dayOneCondition13, condition6: dayOneCondition14, condition7: dayOneCondition15, int0: dayOneIndex8, int1: dayOneIndex9, int2: dayOneIndex10, int3: dayOneIndex11, int4: dayOneIndex12, int5: dayOneIndex13, int6: dayOneIndex14, int7: dayOneIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayOneUISetup(condition0: dayOneCondition0, condition1: dayOneCondition1, condition2: dayOneCondition2, condition3: dayOneCondition3, condition4: dayOneCondition4, condition5: dayOneCondition5, condition6: dayOneCondition6, condition7: dayOneCondition7, int0: dayOneWindSpeed0, int1: dayOneWindSpeed1, int2: dayOneWindSpeed2, int3: dayOneWindSpeed3, int4: dayOneWindSpeed4, int5: dayOneWindSpeed5, int6: dayOneWindSpeed6, int7: dayOneWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayOneUISetup(condition0: dayOneCondition8, condition1: dayOneCondition9, condition2: dayOneCondition10, condition3: dayOneCondition11, condition4: dayOneCondition12, condition5: dayOneCondition13, condition6: dayOneCondition14, condition7: dayOneCondition15, int0: dayOneWindSpeed8, int1: dayOneWindSpeed9, int2: dayOneWindSpeed10, int3: dayOneWindSpeed11, int4: dayOneWindSpeed12, int5: dayOneWindSpeed13, int6: dayOneWindSpeed14, int7: dayOneWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayOneUISetup(condition0: dayOneCondition0, condition1: dayOneCondition1, condition2: dayOneCondition2, condition3: dayOneCondition3, condition4: dayOneCondition4, condition5: dayOneCondition5, condition6: dayOneCondition6, condition7: dayOneCondition7, int0: dayOneCloudCover0, int1: dayOneCloudCover1, int2: dayOneCloudCover2, int3: dayOneCloudCover3, int4: dayOneCloudCover4, int5: dayOneCloudCover5, int6: dayOneCloudCover6, int7: dayOneCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayOneUISetup(condition0: dayOneCondition8, condition1: dayOneCondition9, condition2: dayOneCondition10, condition3: dayOneCondition11, condition4: dayOneCondition12, condition5: dayOneCondition13, condition6: dayOneCondition14, condition7: dayOneCondition15, int0: dayOneCloudCover8, int1: dayOneCloudCover9, int2: dayOneCloudCover10, int3: dayOneCloudCover11, int4: dayOneCloudCover12, int5: dayOneCloudCover13, int6: dayOneCloudCover14, int7: dayOneCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 2 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayTwoUISetup(condition0: dayTwoCondition0, condition1: dayTwoCondition1, condition2: dayTwoCondition2, condition3: dayTwoCondition3, condition4: dayTwoCondition4, condition5: dayTwoCondition5, condition6: dayTwoCondition6, condition7: dayTwoCondition7, int0: dayTwoPrecip0, int1: dayTwoPrecip1, int2: dayTwoPrecip2, int3: dayTwoPrecip3, int4: dayTwoPrecip4, int5: dayTwoPrecip5, int6: dayTwoPrecip6, int7: dayTwoPrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayTwoUISetup(condition0: dayTwoCondition8, condition1: dayTwoCondition9, condition2: dayTwoCondition10, condition3: dayTwoCondition11, condition4: dayTwoCondition12, condition5: dayTwoCondition13, condition6: dayTwoCondition14, condition7: dayTwoCondition15, int0: dayTwoPrecip8, int1: dayTwoPrecip9, int2: dayTwoPrecip10, int3: dayTwoPrecip11, int4: dayTwoPrecip12, int5: dayTwoPrecip13, int6: dayTwoPrecip14, int7: dayTwoPrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayTwoUISetup(condition0: dayTwoCondition0, condition1: dayTwoCondition1, condition2: dayTwoCondition2, condition3: dayTwoCondition3, condition4: dayTwoCondition4, condition5: dayTwoCondition5, condition6: dayTwoCondition6, condition7: dayTwoCondition7, int0: dayTwoTemp0, int1: dayTwoTemp1, int2: dayTwoTemp2, int3: dayTwoTemp3, int4: dayTwoTemp4, int5: dayTwoTemp5, int6: dayTwoTemp6, int7: dayTwoTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayTwoUISetup(condition0: dayTwoCondition8, condition1: dayTwoCondition9, condition2: dayTwoCondition10, condition3: dayTwoCondition11, condition4: dayTwoCondition12, condition5: dayTwoCondition13, condition6: dayTwoCondition14, condition7: dayTwoCondition15, int0: dayTwoTemp8, int1: dayTwoTemp9, int2: dayTwoTemp10, int3: dayTwoTemp11, int4: dayTwoTemp12, int5: dayTwoTemp13, int6: dayTwoTemp14, int7: dayTwoTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDayTwoUISetup(condition0: dayTwoCondition0, condition1: dayTwoCondition1, condition2: dayTwoCondition2, condition3: dayTwoCondition3, condition4: dayTwoCondition4, condition5: dayTwoCondition5, condition6: dayTwoCondition6, condition7: dayTwoCondition7, int0: dayTwoHumidity0, int1: dayTwoHumidity1, int2: dayTwoHumidity2, int3: dayTwoHumidity3, int4: dayTwoHumidity4, int5: dayTwoHumidity5, int6: dayTwoHumidity6, int7: dayTwoHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayTwoUISetup(condition0: dayTwoCondition8, condition1: dayTwoCondition9, condition2: dayTwoCondition10, condition3: dayTwoCondition11, condition4: dayTwoCondition12, condition5: dayTwoCondition13, condition6: dayTwoCondition14, condition7: dayTwoCondition15, int0: dayTwoHumidity8, int1: dayTwoHumidity9, int2: dayTwoHumidity10, int3: dayTwoHumidity11, int4: dayTwoHumidity12, int5: dayTwoHumidity13, int6: dayTwoHumidity14, int7: dayTwoHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayTwoUISetup(condition0: dayTwoCondition0, condition1: dayTwoCondition1, condition2: dayTwoCondition2, condition3: dayTwoCondition3, condition4: dayTwoCondition4, condition5: dayTwoCondition5, condition6: dayTwoCondition6, condition7: dayTwoCondition7, int0: dayTwoIndex0, int1: dayTwoIndex1, int2: dayTwoIndex2, int3: dayTwoIndex3, int4: dayTwoIndex4, int5: dayTwoIndex5, int6: dayTwoIndex6, int7: dayTwoIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayTwoUISetup(condition0: dayTwoCondition8, condition1: dayTwoCondition9, condition2: dayTwoCondition10, condition3: dayTwoCondition11, condition4: dayTwoCondition12, condition5: dayTwoCondition13, condition6: dayTwoCondition14, condition7: dayTwoCondition15, int0: dayTwoIndex8, int1: dayTwoIndex9, int2: dayTwoIndex10, int3: dayTwoIndex11, int4: dayTwoIndex12, int5: dayTwoIndex13, int6: dayTwoIndex14, int7: dayTwoIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayTwoUISetup(condition0: dayTwoCondition0, condition1: dayTwoCondition1, condition2: dayTwoCondition2, condition3: dayTwoCondition3, condition4: dayTwoCondition4, condition5: dayTwoCondition5, condition6: dayTwoCondition6, condition7: dayTwoCondition7, int0: dayTwoWindSpeed0, int1: dayTwoWindSpeed1, int2: dayTwoWindSpeed2, int3: dayTwoWindSpeed3, int4: dayTwoWindSpeed4, int5: dayTwoWindSpeed5, int6: dayTwoWindSpeed6, int7: dayTwoWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayTwoUISetup(condition0: dayTwoCondition8, condition1: dayTwoCondition9, condition2: dayTwoCondition10, condition3: dayTwoCondition11, condition4: dayTwoCondition12, condition5: dayTwoCondition13, condition6: dayTwoCondition14, condition7: dayTwoCondition15, int0: dayTwoWindSpeed8, int1: dayTwoWindSpeed9, int2: dayTwoWindSpeed10, int3: dayTwoWindSpeed11, int4: dayTwoWindSpeed12, int5: dayTwoWindSpeed13, int6: dayTwoWindSpeed14, int7: dayTwoWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayTwoUISetup(condition0: dayTwoCondition0, condition1: dayTwoCondition1, condition2: dayTwoCondition2, condition3: dayTwoCondition3, condition4: dayTwoCondition4, condition5: dayTwoCondition5, condition6: dayTwoCondition6, condition7: dayTwoCondition7, int0: dayTwoCloudCover0, int1: dayTwoCloudCover1, int2: dayTwoCloudCover2, int3: dayTwoCloudCover3, int4: dayTwoCloudCover4, int5: dayTwoCloudCover5, int6: dayTwoCloudCover6, int7: dayTwoCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayTwoUISetup(condition0: dayTwoCondition8, condition1: dayTwoCondition9, condition2: dayTwoCondition10, condition3: dayTwoCondition11, condition4: dayTwoCondition12, condition5: dayTwoCondition13, condition6: dayTwoCondition14, condition7: dayTwoCondition15, int0: dayTwoCloudCover8, int1: dayTwoCloudCover9, int2: dayTwoCloudCover10, int3: dayTwoCloudCover11, int4: dayTwoCloudCover12, int5: dayTwoCloudCover13, int6: dayTwoCloudCover14, int7: dayTwoCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 3 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayThreeUISetup(condition0: dayThreeCondition0, condition1: dayThreeCondition1, condition2: dayThreeCondition2, condition3: dayThreeCondition3, condition4: dayThreeCondition4, condition5: dayThreeCondition5, condition6: dayThreeCondition6, condition7: dayThreeCondition7, int0: dayThreePrecip0, int1: dayThreePrecip1, int2: dayThreePrecip2, int3: dayThreePrecip3, int4: dayThreePrecip4, int5: dayThreePrecip5, int6: dayThreePrecip6, int7: dayThreePrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayThreeUISetup(condition0: dayThreeCondition8, condition1: dayThreeCondition9, condition2: dayThreeCondition10, condition3: dayThreeCondition11, condition4: dayThreeCondition12, condition5: dayThreeCondition13, condition6: dayThreeCondition14, condition7: dayThreeCondition15, int0: dayThreePrecip8, int1: dayThreePrecip9, int2: dayThreePrecip10, int3: dayThreePrecip11, int4: dayThreePrecip12, int5: dayThreePrecip13, int6: dayThreePrecip14, int7: dayThreePrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayThreeUISetup(condition0: dayThreeCondition0, condition1: dayThreeCondition1, condition2: dayThreeCondition2, condition3: dayThreeCondition3, condition4: dayThreeCondition4, condition5: dayThreeCondition5, condition6: dayThreeCondition6, condition7: dayThreeCondition7, int0: dayThreeTemp0, int1: dayThreeTemp1, int2: dayThreeTemp2, int3: dayThreeTemp3, int4: dayThreeTemp4, int5: dayThreeTemp5, int6: dayThreeTemp6, int7: dayThreeTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayThreeUISetup(condition0: dayThreeCondition8, condition1: dayThreeCondition9, condition2: dayThreeCondition10, condition3: dayThreeCondition11, condition4: dayThreeCondition12, condition5: dayThreeCondition13, condition6: dayThreeCondition14, condition7: dayThreeCondition15, int0: dayThreeTemp8, int1: dayThreeTemp9, int2: dayThreeTemp10, int3: dayThreeTemp11, int4: dayThreeTemp12, int5: dayThreeTemp13, int6: dayThreeTemp14, int7: dayThreeTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2  {
                if pageControl.currentPage == 0 {
                    completeDayThreeUISetup(condition0: dayThreeCondition0, condition1: dayThreeCondition1, condition2: dayThreeCondition2, condition3: dayThreeCondition3, condition4: dayThreeCondition4, condition5: dayThreeCondition5, condition6: dayThreeCondition6, condition7: dayThreeCondition7, int0: dayThreeHumidity0, int1: dayThreeHumidity1, int2: dayThreeHumidity2, int3: dayThreeHumidity3, int4: dayThreeHumidity4, int5: dayThreeHumidity5, int6: dayThreeHumidity6, int7: dayThreeHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayThreeUISetup(condition0: dayThreeCondition8, condition1: dayThreeCondition9, condition2: dayThreeCondition10, condition3: dayThreeCondition11, condition4: dayThreeCondition12, condition5: dayThreeCondition13, condition6: dayThreeCondition14, condition7: dayThreeCondition15, int0: dayThreeHumidity8, int1: dayThreeHumidity9, int2: dayThreeHumidity10, int3: dayThreeHumidity11, int4: dayThreeHumidity12, int5: dayThreeHumidity13, int6: dayThreeHumidity14, int7: dayThreeHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayThreeUISetup(condition0: dayThreeCondition0, condition1: dayThreeCondition1, condition2: dayThreeCondition2, condition3: dayThreeCondition3, condition4: dayThreeCondition4, condition5: dayThreeCondition5, condition6: dayThreeCondition6, condition7: dayThreeCondition7, int0: dayThreeIndex0, int1: dayThreeIndex1, int2: dayThreeIndex2, int3: dayThreeIndex3, int4: dayThreeIndex4, int5: dayThreeIndex5, int6: dayThreeIndex6, int7: dayThreeIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayThreeUISetup(condition0: dayThreeCondition8, condition1: dayThreeCondition9, condition2: dayThreeCondition10, condition3: dayThreeCondition11, condition4: dayThreeCondition12, condition5: dayThreeCondition13, condition6: dayThreeCondition14, condition7: dayThreeCondition15, int0: dayThreeIndex8, int1: dayThreeIndex9, int2: dayThreeIndex10, int3: dayThreeIndex11, int4: dayThreeIndex12, int5: dayThreeIndex13, int6: dayThreeIndex14, int7: dayThreeIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayThreeUISetup(condition0: dayThreeCondition0, condition1: dayThreeCondition1, condition2: dayThreeCondition2, condition3: dayThreeCondition3, condition4: dayThreeCondition4, condition5: dayThreeCondition5, condition6: dayThreeCondition6, condition7: dayThreeCondition7, int0: dayThreeWindSpeed0, int1: dayThreeWindSpeed1, int2: dayThreeWindSpeed2, int3: dayThreeWindSpeed3, int4: dayThreeWindSpeed4, int5: dayThreeWindSpeed5, int6: dayThreeWindSpeed6, int7: dayThreeWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayThreeUISetup(condition0: dayThreeCondition8, condition1: dayThreeCondition9, condition2: dayThreeCondition10, condition3: dayThreeCondition11, condition4: dayThreeCondition12, condition5: dayThreeCondition13, condition6: dayThreeCondition14, condition7: dayThreeCondition15, int0: dayThreeWindSpeed8, int1: dayThreeWindSpeed9, int2: dayThreeWindSpeed10, int3: dayThreeWindSpeed11, int4: dayThreeWindSpeed12, int5: dayThreeWindSpeed13, int6: dayThreeWindSpeed14, int7: dayThreeWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayThreeUISetup(condition0: dayThreeCondition0, condition1: dayThreeCondition1, condition2: dayThreeCondition2, condition3: dayThreeCondition3, condition4: dayThreeCondition4, condition5: dayThreeCondition5, condition6: dayThreeCondition6, condition7: dayThreeCondition7, int0: dayThreeCloudCover0, int1: dayThreeCloudCover1, int2: dayThreeCloudCover2, int3: dayThreeCloudCover3, int4: dayThreeCloudCover4, int5: dayThreeCloudCover5, int6: dayThreeCloudCover6, int7: dayThreeCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayThreeUISetup(condition0: dayThreeCondition8, condition1: dayThreeCondition9, condition2: dayThreeCondition10, condition3: dayThreeCondition11, condition4: dayThreeCondition12, condition5: dayThreeCondition13, condition6: dayThreeCondition14, condition7: dayThreeCondition15, int0: dayThreeCloudCover8, int1: dayThreeCloudCover9, int2: dayThreeCloudCover10, int3: dayThreeCloudCover11, int4: dayThreeCloudCover12, int5: dayThreeCloudCover13, int6: dayThreeCloudCover14, int7: dayThreeCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 4 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayFourUISetup(condition0: dayFourCondition0, condition1: dayFourCondition1, condition2: dayFourCondition2, condition3: dayFourCondition3, condition4: dayFourCondition4, condition5: dayFourCondition5, condition6: dayFourCondition6, condition7: dayFourCondition7, int0: dayFourPrecip0, int1: dayFourPrecip1, int2: dayFourPrecip2, int3: dayFourPrecip3, int4: dayFourPrecip4, int5: dayFourPrecip5, int6: dayFourPrecip6, int7: dayFourPrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFourUISetup(condition0: dayFourCondition8, condition1: dayFourCondition9, condition2: dayFourCondition10, condition3: dayFourCondition11, condition4: dayFourCondition12, condition5: dayFourCondition13, condition6: dayFourCondition14, condition7: dayFourCondition15, int0: dayFourPrecip8, int1: dayFourPrecip9, int2: dayFourPrecip10, int3: dayFourPrecip11, int4: dayFourPrecip12, int5: dayFourPrecip13, int6: dayFourPrecip14, int7: dayFourPrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayFourUISetup(condition0: dayFourCondition0, condition1: dayFourCondition1, condition2: dayFourCondition2, condition3: dayFourCondition3, condition4: dayFourCondition4, condition5: dayFourCondition5, condition6: dayFourCondition6, condition7: dayFourCondition7, int0: dayFourTemp0, int1: dayFourTemp1, int2: dayFourTemp2, int3: dayFourTemp3, int4: dayFourTemp4, int5: dayFourTemp5, int6: dayFourTemp6, int7: dayFourTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFourUISetup(condition0: dayFourCondition8, condition1: dayFourCondition9, condition2: dayFourCondition10, condition3: dayFourCondition11, condition4: dayFourCondition12, condition5: dayFourCondition13, condition6: dayFourCondition14, condition7: dayFourCondition15, int0: dayFourTemp8, int1: dayFourTemp9, int2: dayFourTemp10, int3: dayFourTemp11, int4: dayFourTemp12, int5: dayFourTemp13, int6: dayFourTemp14, int7: dayFourTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDayFourUISetup(condition0: dayFourCondition0, condition1: dayFourCondition1, condition2: dayFourCondition2, condition3: dayFourCondition3, condition4: dayFourCondition4, condition5: dayFourCondition5, condition6: dayFourCondition6, condition7: dayFourCondition7, int0: dayFourHumidity0, int1: dayFourHumidity1, int2: dayFourHumidity2, int3: dayFourHumidity3, int4: dayFourHumidity4, int5: dayFourHumidity5, int6: dayFourHumidity6, int7: dayFourHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFourUISetup(condition0: dayFourCondition8, condition1: dayFourCondition9, condition2: dayFourCondition10, condition3: dayFourCondition11, condition4: dayFourCondition12, condition5: dayFourCondition13, condition6: dayFourCondition14, condition7: dayFourCondition15, int0: dayFourHumidity8, int1: dayFourHumidity9, int2: dayFourHumidity10, int3: dayFourHumidity11, int4: dayFourHumidity12, int5: dayFourHumidity13, int6: dayFourHumidity14, int7: dayFourHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayFourUISetup(condition0: dayFourCondition0, condition1: dayFourCondition1, condition2: dayFourCondition2, condition3: dayFourCondition3, condition4: dayFourCondition4, condition5: dayFourCondition5, condition6: dayFourCondition6, condition7: dayFourCondition7, int0: dayFourIndex0, int1: dayFourIndex1, int2: dayFourIndex2, int3: dayFourIndex3, int4: dayFourIndex4, int5: dayFourIndex5, int6: dayFourIndex6, int7: dayFourIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFourUISetup(condition0: dayFourCondition8, condition1: dayFourCondition9, condition2: dayFourCondition10, condition3: dayFourCondition11, condition4: dayFourCondition12, condition5: dayFourCondition13, condition6: dayFourCondition14, condition7: dayFourCondition15, int0: dayFourIndex8, int1: dayFourIndex9, int2: dayFourIndex10, int3: dayFourIndex11, int4: dayFourIndex12, int5: dayFourIndex13, int6: dayFourIndex14, int7: dayFourIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayFourUISetup(condition0: dayFourCondition0, condition1: dayFourCondition1, condition2: dayFourCondition2, condition3: dayFourCondition3, condition4: dayFourCondition4, condition5: dayFourCondition5, condition6: dayFourCondition6, condition7: dayFourCondition7, int0: dayFourWindSpeed0, int1: dayFourWindSpeed1, int2: dayFourWindSpeed2, int3: dayFourWindSpeed3, int4: dayFourWindSpeed4, int5: dayFourWindSpeed5, int6: dayFourWindSpeed6, int7: dayFourWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFourUISetup(condition0: dayFourCondition8, condition1: dayFourCondition9, condition2: dayFourCondition10, condition3: dayFourCondition11, condition4: dayFourCondition12, condition5: dayFourCondition13, condition6: dayFourCondition14, condition7: dayFourCondition15, int0: dayFourWindSpeed8, int1: dayFourWindSpeed9, int2: dayFourWindSpeed10, int3: dayFourWindSpeed11, int4: dayFourWindSpeed12, int5: dayFourWindSpeed13, int6: dayFourWindSpeed14, int7: dayFourWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayFourUISetup(condition0: dayFourCondition0, condition1: dayFourCondition1, condition2: dayFourCondition2, condition3: dayFourCondition3, condition4: dayFourCondition4, condition5: dayFourCondition5, condition6: dayFourCondition6, condition7: dayFourCondition7, int0: dayFourCloudCover0, int1: dayFourCloudCover1, int2: dayFourCloudCover2, int3: dayFourCloudCover3, int4: dayFourCloudCover4, int5: dayFourCloudCover5, int6: dayFourCloudCover6, int7: dayFourCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFourUISetup(condition0: dayFourCondition8, condition1: dayFourCondition9, condition2: dayFourCondition10, condition3: dayFourCondition11, condition4: dayFourCondition12, condition5: dayFourCondition13, condition6: dayFourCondition14, condition7: dayFourCondition15, int0: dayFourCloudCover8, int1: dayFourCloudCover9, int2: dayFourCloudCover10, int3: dayFourCloudCover11, int4: dayFourCloudCover12, int5: dayFourCloudCover13, int6: dayFourCloudCover14, int7: dayFourCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 5 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayFiveUISetup(condition0: dayFiveCondition0, condition1: dayFiveCondition1, condition2: dayFiveCondition2, condition3: dayFiveCondition3, condition4: dayFiveCondition4, condition5: dayFiveCondition5, condition6: dayFiveCondition6, condition7: dayFiveCondition7, int0: dayFivePrecip0, int1: dayFivePrecip1, int2: dayFivePrecip2, int3: dayFivePrecip3, int4: dayFivePrecip4, int5: dayFivePrecip5, int6: dayFivePrecip6, int7: dayFivePrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFiveUISetup(condition0: dayFiveCondition8, condition1: dayFiveCondition9, condition2: dayFiveCondition10, condition3: dayFiveCondition11, condition4: dayFiveCondition12, condition5: dayFiveCondition13, condition6: dayFiveCondition14, condition7: dayFiveCondition15, int0: dayFivePrecip8, int1: dayFivePrecip9, int2: dayFivePrecip10, int3: dayFivePrecip11, int4: dayFivePrecip12, int5: dayFivePrecip13, int6: dayFivePrecip14, int7: dayFivePrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayFiveUISetup(condition0: dayFiveCondition0, condition1: dayFiveCondition1, condition2: dayFiveCondition2, condition3: dayFiveCondition3, condition4: dayFiveCondition4, condition5: dayFiveCondition5, condition6: dayFiveCondition6, condition7: dayFiveCondition7, int0: dayFiveTemp0, int1: dayFiveTemp1, int2: dayFiveTemp2, int3: dayFiveTemp3, int4: dayFiveTemp4, int5: dayFiveTemp5, int6: dayFiveTemp6, int7: dayFiveTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFiveUISetup(condition0: dayFiveCondition8, condition1: dayFiveCondition9, condition2: dayFiveCondition10, condition3: dayFiveCondition11, condition4: dayFiveCondition12, condition5: dayFiveCondition13, condition6: dayFiveCondition14, condition7: dayFiveCondition15, int0: dayFiveTemp8, int1: dayFiveTemp9, int2: dayFiveTemp10, int3: dayFiveTemp11, int4: dayFiveTemp12, int5: dayFiveTemp13, int6: dayFiveTemp14, int7: dayFiveTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDayFiveUISetup(condition0: dayFiveCondition0, condition1: dayFiveCondition1, condition2: dayFiveCondition2, condition3: dayFiveCondition3, condition4: dayFiveCondition4, condition5: dayFiveCondition5, condition6: dayFiveCondition6, condition7: dayFiveCondition7, int0: dayFiveHumidity0, int1: dayFiveHumidity1, int2: dayFiveHumidity2, int3: dayFiveHumidity3, int4: dayFiveHumidity4, int5: dayFiveHumidity5, int6: dayFiveHumidity6, int7: dayFiveHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFiveUISetup(condition0: dayFiveCondition8, condition1: dayFiveCondition9, condition2: dayFiveCondition10, condition3: dayFiveCondition11, condition4: dayFiveCondition12, condition5: dayFiveCondition13, condition6: dayFiveCondition14, condition7: dayFiveCondition15, int0: dayFiveHumidity8, int1: dayFiveHumidity9, int2: dayFiveHumidity10, int3: dayFiveHumidity11, int4: dayFiveHumidity12, int5: dayFiveHumidity13, int6: dayFiveHumidity14, int7: dayFiveHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayFiveUISetup(condition0: dayFiveCondition0, condition1: dayFiveCondition1, condition2: dayFiveCondition2, condition3: dayFiveCondition3, condition4: dayFiveCondition4, condition5: dayFiveCondition5, condition6: dayFiveCondition6, condition7: dayFiveCondition7, int0: dayFiveIndex0, int1: dayFiveIndex1, int2: dayFiveIndex2, int3: dayFiveIndex3, int4: dayFiveIndex4, int5: dayFiveIndex5, int6: dayFiveIndex6, int7: dayFiveIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFiveUISetup(condition0: dayFiveCondition8, condition1: dayFiveCondition9, condition2: dayFiveCondition10, condition3: dayFiveCondition11, condition4: dayFiveCondition12, condition5: dayFiveCondition13, condition6: dayFiveCondition14, condition7: dayFiveCondition15, int0: dayFiveIndex8, int1: dayFiveIndex9, int2: dayFiveIndex10, int3: dayFiveIndex11, int4: dayFiveIndex12, int5: dayFiveIndex13, int6: dayFiveIndex14, int7: dayFiveIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayFiveUISetup(condition0: dayFiveCondition0, condition1: dayFiveCondition1, condition2: dayFiveCondition2, condition3: dayFiveCondition3, condition4: dayFiveCondition4, condition5: dayFiveCondition5, condition6: dayFiveCondition6, condition7: dayFiveCondition7, int0: dayFiveWindSpeed0, int1: dayFiveWindSpeed1, int2: dayFiveWindSpeed2, int3: dayFiveWindSpeed3, int4: dayFiveWindSpeed4, int5: dayFiveWindSpeed5, int6: dayFiveWindSpeed6, int7: dayFiveWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFiveUISetup(condition0: dayFiveCondition8, condition1: dayFiveCondition9, condition2: dayFiveCondition10, condition3: dayFiveCondition11, condition4: dayFiveCondition12, condition5: dayFiveCondition13, condition6: dayFiveCondition14, condition7: dayFiveCondition15, int0: dayFiveWindSpeed8, int1: dayFiveWindSpeed9, int2: dayFiveWindSpeed10, int3: dayFiveWindSpeed11, int4: dayFiveWindSpeed12, int5: dayFiveWindSpeed13, int6: dayFiveWindSpeed14, int7: dayFiveWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayFiveUISetup(condition0: dayFiveCondition0, condition1: dayFiveCondition1, condition2: dayFiveCondition2, condition3: dayFiveCondition3, condition4: dayFiveCondition4, condition5: dayFiveCondition5, condition6: dayFiveCondition6, condition7: dayFiveCondition7, int0: dayFiveCloudCover0, int1: dayFiveCloudCover1, int2: dayFiveCloudCover2, int3: dayFiveCloudCover3, int4: dayFiveCloudCover4, int5: dayFiveCloudCover5, int6: dayFiveCloudCover6, int7: dayFiveCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayFiveUISetup(condition0: dayFiveCondition8, condition1: dayFiveCondition9, condition2: dayFiveCondition10, condition3: dayFiveCondition11, condition4: dayFiveCondition12, condition5: dayFiveCondition13, condition6: dayFiveCondition14, condition7: dayFiveCondition15, int0: dayFiveCloudCover8, int1: dayFiveCloudCover9, int2: dayFiveCloudCover10, int3: dayFiveCloudCover11, int4: dayFiveCloudCover12, int5: dayFiveCloudCover13, int6: dayFiveCloudCover14, int7: dayFiveCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 6 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDaySixUISetup(condition0: daySixCondition0, condition1: daySixCondition1, condition2: daySixCondition2, condition3: daySixCondition3, condition4: daySixCondition4, condition5: daySixCondition5, condition6: daySixCondition6, condition7: daySixCondition7, int0: daySixPrecip0, int1: daySixPrecip1, int2: daySixPrecip2, int3: daySixPrecip3, int4: daySixPrecip4, int5: daySixPrecip5, int6: daySixPrecip6, int7: daySixPrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySixUISetup(condition0: daySixCondition8, condition1: daySixCondition9, condition2: daySixCondition10, condition3: daySixCondition11, condition4: daySixCondition12, condition5: daySixCondition13, condition6: daySixCondition14, condition7: daySixCondition15,  int0: daySixPrecip8, int1: daySixPrecip9, int2: daySixPrecip10, int3: daySixPrecip11, int4: daySixPrecip12, int5: daySixPrecip13, int6: daySixPrecip14, int7: daySixPrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDaySixUISetup(condition0: daySixCondition0, condition1: daySixCondition1, condition2: daySixCondition2, condition3: daySixCondition3, condition4: daySixCondition4, condition5: daySixCondition5, condition6: daySixCondition6, condition7: daySixCondition7, int0: daySixTemp0, int1: daySixTemp1, int2: daySixTemp2, int3: daySixTemp3, int4: daySixTemp4, int5: daySixTemp5, int6: daySixTemp6, int7: daySixTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySixUISetup(condition0: daySixCondition8, condition1: daySixCondition9, condition2: daySixCondition10, condition3: daySixCondition11, condition4: daySixCondition12, condition5: daySixCondition13, condition6: daySixCondition14, condition7: daySixCondition15,  int0: daySixTemp8, int1: daySixTemp9, int2: daySixTemp10, int3: daySixTemp11, int4: daySixTemp12, int5: daySixTemp13, int6: daySixTemp14, int7: daySixTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDaySixUISetup(condition0: daySixCondition0, condition1: daySixCondition1, condition2: daySixCondition2, condition3: daySixCondition3, condition4: daySixCondition4, condition5: daySixCondition5, condition6: daySixCondition6, condition7: daySixCondition7, int0: daySixHumidity0, int1: daySixHumidity1, int2: daySixHumidity2, int3: daySixHumidity3, int4: daySixHumidity4, int5: daySixHumidity5, int6: daySixHumidity6, int7: daySixHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySixUISetup(condition0: daySixCondition8, condition1: daySixCondition9, condition2: daySixCondition10, condition3: daySixCondition11, condition4: daySixCondition12, condition5: daySixCondition13, condition6: daySixCondition14, condition7: daySixCondition15,  int0: daySixHumidity8, int1: daySixHumidity9, int2: daySixHumidity10, int3: daySixHumidity11, int4: daySixHumidity12, int5: daySixHumidity13, int6: daySixHumidity14, int7: daySixHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDaySixUISetup(condition0: daySixCondition0, condition1: daySixCondition1, condition2: daySixCondition2, condition3: daySixCondition3, condition4: daySixCondition4, condition5: daySixCondition5, condition6: daySixCondition6, condition7: daySixCondition7, int0: daySixIndex0, int1: daySixIndex1, int2: daySixIndex2, int3: daySixIndex3, int4: daySixIndex4, int5: daySixIndex5, int6: daySixIndex6, int7: daySixIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySixUISetup(condition0: daySixCondition8, condition1: daySixCondition9, condition2: daySixCondition10, condition3: daySixCondition11, condition4: daySixCondition12, condition5: daySixCondition13, condition6: daySixCondition14, condition7: daySixCondition15,  int0: daySixIndex8, int1: daySixIndex9, int2: daySixIndex10, int3: daySixIndex11, int4: daySixIndex12, int5: daySixIndex13, int6: daySixIndex14, int7: daySixIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDaySixUISetup(condition0: daySixCondition0, condition1: daySixCondition1, condition2: daySixCondition2, condition3: daySixCondition3, condition4: daySixCondition4, condition5: daySixCondition5, condition6: daySixCondition6, condition7: daySixCondition7, int0: daySixWindSpeed0, int1: daySixWindSpeed1, int2: daySixWindSpeed2, int3: daySixWindSpeed3, int4: daySixWindSpeed4, int5: daySixWindSpeed5, int6: daySixWindSpeed6, int7: daySixWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySixUISetup(condition0: daySixCondition8, condition1: daySixCondition9, condition2: daySixCondition10, condition3: daySixCondition11, condition4: daySixCondition12, condition5: daySixCondition13, condition6: daySixCondition14, condition7: daySixCondition15,  int0: daySixWindSpeed8, int1: daySixWindSpeed9, int2: daySixWindSpeed10, int3: daySixWindSpeed11, int4: daySixWindSpeed12, int5: daySixWindSpeed13, int6: daySixWindSpeed14, int7: daySixWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDaySixUISetup(condition0: daySixCondition0, condition1: daySixCondition1, condition2: daySixCondition2, condition3: daySixCondition3, condition4: daySixCondition4, condition5: daySixCondition5, condition6: daySixCondition6, condition7: daySixCondition7, int0: daySixCloudCover0, int1: daySixCloudCover1, int2: daySixCloudCover2, int3: daySixCloudCover3, int4: daySixCloudCover4, int5: daySixCloudCover5, int6: daySixCloudCover6, int7: daySixCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySixUISetup(condition0: daySixCondition8, condition1: daySixCondition9, condition2: daySixCondition10, condition3: daySixCondition11, condition4: daySixCondition12, condition5: daySixCondition13, condition6: daySixCondition14, condition7: daySixCondition15,  int0: daySixCloudCover8, int1: daySixCloudCover9, int2: daySixCloudCover10, int3: daySixCloudCover11, int4: daySixCloudCover12, int5: daySixCloudCover13, int6: daySixCloudCover14, int7: daySixCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 7 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDaySevenUISetup(condition0: daySevenCondition0, condition1: daySevenCondition1, condition2: daySevenCondition2, condition3: daySevenCondition3, condition4: daySevenCondition4, condition5: daySevenCondition5, condition6: daySevenCondition6, condition7: daySevenCondition7,  int0: daySevenPrecip0, int1: daySevenPrecip1, int2: daySevenPrecip2, int3: daySevenPrecip3, int4: daySevenPrecip4, int5: daySevenPrecip5, int6: daySevenPrecip6, int7: daySevenPrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySevenUISetup(condition0: daySevenCondition8, condition1: daySevenCondition9, condition2: daySevenCondition10, condition3: daySevenCondition11, condition4: daySevenCondition12, condition5: daySevenCondition13, condition6: daySevenCondition14, condition7: daySevenCondition15,  int0: daySevenPrecip8, int1: daySevenPrecip9, int2: daySevenPrecip10, int3: daySevenPrecip11, int4: daySevenPrecip12, int5: daySevenPrecip13, int6: daySevenPrecip14, int7: daySevenPrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDaySevenUISetup(condition0: daySevenCondition0, condition1: daySevenCondition1, condition2: daySevenCondition2, condition3: daySevenCondition3, condition4: daySevenCondition4, condition5: daySevenCondition5, condition6: daySevenCondition6, condition7: daySevenCondition7,  int0: daySevenTemp0, int1: daySevenTemp1, int2: daySevenTemp2, int3: daySevenTemp3, int4: daySevenTemp4, int5: daySevenTemp5, int6: daySevenTemp6, int7: daySevenTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySevenUISetup(condition0: daySevenCondition8, condition1: daySevenCondition9, condition2: daySevenCondition10, condition3: daySevenCondition11, condition4: daySevenCondition12, condition5: daySevenCondition13, condition6: daySevenCondition14, condition7: daySevenCondition15,  int0: daySevenTemp8, int1: daySevenTemp9, int2: daySevenTemp10, int3: daySevenTemp11, int4: daySevenTemp12, int5: daySevenTemp13, int6: daySevenTemp14, int7: daySevenTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDaySevenUISetup(condition0: daySevenCondition0, condition1: daySevenCondition1, condition2: daySevenCondition2, condition3: daySevenCondition3, condition4: daySevenCondition4, condition5: daySevenCondition5, condition6: daySevenCondition6, condition7: daySevenCondition7,  int0: daySevenHumidity0, int1: daySevenHumidity1, int2: daySevenHumidity2, int3: daySevenHumidity3, int4: daySevenHumidity4, int5: daySevenHumidity5, int6: daySevenHumidity6, int7: daySevenHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySevenUISetup(condition0: daySevenCondition8, condition1: daySevenCondition9, condition2: daySevenCondition10, condition3: daySevenCondition11, condition4: daySevenCondition12, condition5: daySevenCondition13, condition6: daySevenCondition14, condition7: daySevenCondition15,  int0: daySevenHumidity8, int1: daySevenHumidity9, int2: daySevenHumidity10, int3: daySevenHumidity11, int4: daySevenHumidity12, int5: daySevenHumidity13, int6: daySevenHumidity14, int7: daySevenHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDaySevenUISetup(condition0: daySevenCondition0, condition1: daySevenCondition1, condition2: daySevenCondition2, condition3: daySevenCondition3, condition4: daySevenCondition4, condition5: daySevenCondition5, condition6: daySevenCondition6, condition7: daySevenCondition7,  int0: daySevenIndex0, int1: daySevenIndex1, int2: daySevenIndex2, int3: daySevenIndex3, int4: daySevenIndex4, int5: daySevenIndex5, int6: daySevenIndex6, int7: daySevenIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySevenUISetup(condition0: daySevenCondition8, condition1: daySevenCondition9, condition2: daySevenCondition10, condition3: daySevenCondition11, condition4: daySevenCondition12, condition5: daySevenCondition13, condition6: daySevenCondition14, condition7: daySevenCondition15,  int0: daySevenIndex8, int1: daySevenIndex9, int2: daySevenIndex10, int3: daySevenIndex11, int4: daySevenIndex12, int5: daySevenIndex13, int6: daySevenIndex14, int7: daySevenIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDaySevenUISetup(condition0: daySevenCondition0, condition1: daySevenCondition1, condition2: daySevenCondition2, condition3: daySevenCondition3, condition4: daySevenCondition4, condition5: daySevenCondition5, condition6: daySevenCondition6, condition7: daySevenCondition7,  int0: daySevenWindSpeed0, int1: daySevenWindSpeed1, int2: daySevenWindSpeed2, int3: daySevenWindSpeed3, int4: daySevenWindSpeed4, int5: daySevenWindSpeed5, int6: daySevenWindSpeed6, int7: daySevenWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySevenUISetup(condition0: daySevenCondition8, condition1: daySevenCondition9, condition2: daySevenCondition10, condition3: daySevenCondition11, condition4: daySevenCondition12, condition5: daySevenCondition13, condition6: daySevenCondition14, condition7: daySevenCondition15,  int0: daySevenWindSpeed8, int1: daySevenWindSpeed9, int2: daySevenWindSpeed10, int3: daySevenWindSpeed11, int4: daySevenWindSpeed12, int5: daySevenWindSpeed13, int6: daySevenWindSpeed14, int7: daySevenWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDaySevenUISetup(condition0: daySevenCondition0, condition1: daySevenCondition1, condition2: daySevenCondition2, condition3: daySevenCondition3, condition4: daySevenCondition4, condition5: daySevenCondition5, condition6: daySevenCondition6, condition7: daySevenCondition7,  int0: daySevenCloudCover0, int1: daySevenCloudCover1, int2: daySevenCloudCover2, int3: daySevenCloudCover3, int4: daySevenCloudCover4, int5: daySevenCloudCover5, int6: daySevenCloudCover6, int7: daySevenCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDaySevenUISetup(condition0: daySevenCondition8, condition1: daySevenCondition9, condition2: daySevenCondition10, condition3: daySevenCondition11, condition4: daySevenCondition12, condition5: daySevenCondition13, condition6: daySevenCondition14, condition7: daySevenCondition15,  int0: daySevenCloudCover8, int1: daySevenCloudCover9, int2: daySevenCloudCover10, int3: daySevenCloudCover11, int4: daySevenCloudCover12, int5: daySevenCloudCover13, int6: daySevenCloudCover14, int7: daySevenCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 8 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayEightUISetup(condition0: dayEightCondition0, condition1: dayEightCondition1, condition2: dayEightCondition2, condition3: dayEightCondition3, condition4: dayEightCondition4, condition5: dayEightCondition5, condition6: dayEightCondition6, condition7: dayEightCondition7, int0: dayEightPrecip0, int1: dayEightPrecip1, int2: dayEightPrecip2, int3: dayEightPrecip3, int4: dayEightPrecip4, int5: dayEightPrecip5, int6: dayEightPrecip6, int7: dayEightPrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayEightUISetup(condition0: dayEightCondition8, condition1: dayEightCondition9, condition2: dayEightCondition10, condition3: dayEightCondition11, condition4: dayEightCondition12, condition5: dayEightCondition13, condition6: dayEightCondition14, condition7: dayEightCondition15, int0: dayEightPrecip8, int1: dayEightPrecip9, int2: dayEightPrecip10, int3: dayEightPrecip11, int4: dayEightPrecip12, int5: dayEightPrecip13, int6: dayEightPrecip14, int7: dayEightPrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayEightUISetup(condition0: dayEightCondition0, condition1: dayEightCondition1, condition2: dayEightCondition2, condition3: dayEightCondition3, condition4: dayEightCondition4, condition5: dayEightCondition5, condition6: dayEightCondition6, condition7: dayEightCondition7, int0: dayEightTemp0, int1: dayEightTemp1, int2: dayEightTemp2, int3: dayEightTemp3, int4: dayEightTemp4, int5: dayEightTemp5, int6: dayEightTemp6, int7: dayEightTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayEightUISetup(condition0: dayEightCondition8, condition1: dayEightCondition9, condition2: dayEightCondition10, condition3: dayEightCondition11, condition4: dayEightCondition12, condition5: dayEightCondition13, condition6: dayEightCondition14, condition7: dayEightCondition15, int0: dayEightTemp8, int1: dayEightTemp9, int2: dayEightTemp10, int3: dayEightTemp11, int4: dayEightTemp12, int5: dayEightTemp13, int6: dayEightTemp14, int7: dayEightTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDayEightUISetup(condition0: dayEightCondition0, condition1: dayEightCondition1, condition2: dayEightCondition2, condition3: dayEightCondition3, condition4: dayEightCondition4, condition5: dayEightCondition5, condition6: dayEightCondition6, condition7: dayEightCondition7, int0: dayEightHumidity0, int1: dayEightHumidity1, int2: dayEightHumidity2, int3: dayEightHumidity3, int4: dayEightHumidity4, int5: dayEightHumidity5, int6: dayEightHumidity6, int7: dayEightHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayEightUISetup(condition0: dayEightCondition8, condition1: dayEightCondition9, condition2: dayEightCondition10, condition3: dayEightCondition11, condition4: dayEightCondition12, condition5: dayEightCondition13, condition6: dayEightCondition14, condition7: dayEightCondition15, int0: dayEightHumidity8, int1: dayEightHumidity9, int2: dayEightHumidity10, int3: dayEightHumidity11, int4: dayEightHumidity12, int5: dayEightHumidity13, int6: dayEightHumidity14, int7: dayEightHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayEightUISetup(condition0: dayEightCondition0, condition1: dayEightCondition1, condition2: dayEightCondition2, condition3: dayEightCondition3, condition4: dayEightCondition4, condition5: dayEightCondition5, condition6: dayEightCondition6, condition7: dayEightCondition7, int0: dayEightIndex0, int1: dayEightIndex1, int2: dayEightIndex2, int3: dayEightIndex3, int4: dayEightIndex4, int5: dayEightIndex5, int6: dayEightIndex6, int7: dayEightIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayEightUISetup(condition0: dayEightCondition8, condition1: dayEightCondition9, condition2: dayEightCondition10, condition3: dayEightCondition11, condition4: dayEightCondition12, condition5: dayEightCondition13, condition6: dayEightCondition14, condition7: dayEightCondition15,  int0: dayEightIndex8, int1: dayEightIndex9, int2: dayEightIndex10, int3: dayEightIndex11, int4: dayEightIndex12, int5: dayEightIndex13, int6: dayEightIndex14, int7: dayEightIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayEightUISetup(condition0: dayEightCondition0, condition1: dayEightCondition1, condition2: dayEightCondition2, condition3: dayEightCondition3, condition4: dayEightCondition4, condition5: dayEightCondition5, condition6: dayEightCondition6, condition7: dayEightCondition7, int0: dayEightWindSpeed0, int1: dayEightWindSpeed1, int2: dayEightWindSpeed2, int3: dayEightWindSpeed3, int4: dayEightWindSpeed4, int5: dayEightWindSpeed5, int6: dayEightWindSpeed6, int7: dayEightWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayEightUISetup(condition0: dayEightCondition8, condition1: dayEightCondition9, condition2: dayEightCondition10, condition3: dayEightCondition11, condition4: dayEightCondition12, condition5: dayEightCondition13, condition6: dayEightCondition14, condition7: dayEightCondition15,  int0: dayEightWindSpeed8, int1: dayEightWindSpeed9, int2: dayEightWindSpeed10, int3: dayEightWindSpeed11, int4: dayEightWindSpeed12, int5: dayEightWindSpeed13, int6: dayEightWindSpeed14, int7: dayEightWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayEightUISetup(condition0: dayEightCondition0, condition1: dayEightCondition1, condition2: dayEightCondition2, condition3: dayEightCondition3, condition4: dayEightCondition4, condition5: dayEightCondition5, condition6: dayEightCondition6, condition7: dayEightCondition7, int0: dayEightCloudCover0, int1: dayEightCloudCover1, int2: dayEightCloudCover2, int3: dayEightCloudCover3, int4: dayEightCloudCover4, int5: dayEightCloudCover5, int6: dayEightCloudCover6, int7: dayEightCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayEightUISetup(condition0: dayEightCondition8, condition1: dayEightCondition9, condition2: dayEightCondition10, condition3: dayEightCondition11, condition4: dayEightCondition12, condition5: dayEightCondition13, condition6: dayEightCondition14, condition7: dayEightCondition15,  int0: dayEightCloudCover8, int1: dayEightCloudCover9, int2: dayEightCloudCover10, int3: dayEightCloudCover11, int4: dayEightCloudCover12, int5: dayEightCloudCover13, int6: dayEightCloudCover14, int7: dayEightCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 9 {
            if segmentControl.selectedSegmentIndex == 0 {
                if pageControl.currentPage == 0 {
                    completeDayNineUISetup(condition0: dayNineCondition0, condition1: dayNineCondition1, condition2: dayNineCondition2, condition3: dayNineCondition3, condition4: dayNineCondition4, condition5: dayNineCondition5, condition6: dayNineCondition6, condition7: dayNineCondition7, int0: dayNinePrecip0, int1: dayNinePrecip1, int2: dayNinePrecip2, int3: dayNinePrecip3, int4: dayNinePrecip4, int5: dayNinePrecip5, int6: dayNinePrecip6, int7: dayNinePrecip7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayNineUISetup(condition0: dayNineCondition8, condition1: dayNineCondition9, condition2: dayNineCondition10, condition3: dayNineCondition11, condition4: dayNineCondition12, condition5: dayNineCondition13, condition6: dayNineCondition14, condition7: dayNineCondition15,  int0: dayNinePrecip8, int1: dayNinePrecip9, int2: dayNinePrecip10, int3: dayNinePrecip11, int4: dayNinePrecip12, int5: dayNinePrecip13, int6: dayNinePrecip14, int7: dayNinePrecip15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 1 {
                if pageControl.currentPage == 0 {
                    completeDayNineUISetup(condition0: dayNineCondition0, condition1: dayNineCondition1, condition2: dayNineCondition2, condition3: dayNineCondition3, condition4: dayNineCondition4, condition5: dayNineCondition5, condition6: dayNineCondition6, condition7: dayNineCondition7, int0: dayNineTemp0, int1: dayNineTemp1, int2: dayNineTemp2, int3: dayNineTemp3, int4: dayNineTemp4, int5: dayNineTemp5, int6: dayNineTemp6, int7: dayNineTemp7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayNineUISetup(condition0: dayNineCondition8, condition1: dayNineCondition9, condition2: dayNineCondition10, condition3: dayNineCondition11, condition4: dayNineCondition12, condition5: dayNineCondition13, condition6: dayNineCondition14, condition7: dayNineCondition15, int0: dayNineTemp8, int1: dayNineTemp9, int2: dayNineTemp10, int3: dayNineTemp11, int4: dayNineTemp12, int5: dayNineTemp13, int6: dayNineTemp14, int7: dayNineTemp15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 2 {
                if pageControl.currentPage == 0 {
                    completeDayNineUISetup(condition0: dayNineCondition0, condition1: dayNineCondition1, condition2: dayNineCondition2, condition3: dayNineCondition3, condition4: dayNineCondition4, condition5: dayNineCondition5, condition6: dayNineCondition6, condition7: dayNineCondition7, int0: dayNineHumidity0, int1: dayNineHumidity1, int2: dayNineHumidity2, int3: dayNineHumidity3, int4: dayNineHumidity4, int5: dayNineHumidity5, int6: dayNineHumidity6, int7: dayNineHumidity7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayNineUISetup(condition0: dayNineCondition8, condition1: dayNineCondition9, condition2: dayNineCondition10, condition3: dayNineCondition11, condition4: dayNineCondition12, condition5: dayNineCondition13, condition6: dayNineCondition14, condition7: dayNineCondition15, int0: dayNineHumidity8, int1: dayNineHumidity9, int2: dayNineHumidity10, int3: dayNineHumidity11, int4: dayNineHumidity12, int5: dayNineHumidity13, int6: dayNineHumidity14, int7: dayNineHumidity15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 3 {
                if pageControl.currentPage == 0 {
                    completeDayNineUISetup(condition0: dayNineCondition0, condition1: dayNineCondition1, condition2: dayNineCondition2, condition3: dayNineCondition3, condition4: dayNineCondition4, condition5: dayNineCondition5, condition6: dayNineCondition6, condition7: dayNineCondition7, int0: dayNineIndex0, int1: dayNineIndex1, int2: dayNineIndex2, int3: dayNineIndex3, int4: dayNineIndex4, int5: dayNineIndex5, int6: dayNineIndex6, int7: dayNineIndex7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayNineUISetup(condition0: dayNineCondition8, condition1: dayNineCondition9, condition2: dayNineCondition10, condition3: dayNineCondition11, condition4: dayNineCondition12, condition5: dayNineCondition13, condition6: dayNineCondition14, condition7: dayNineCondition15, int0: dayNineIndex8, int1: dayNineIndex9, int2: dayNineIndex10, int3: dayNineIndex11, int4: dayNineIndex12, int5: dayNineIndex13, int6: dayNineIndex14, int7: dayNineIndex15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 4 {
                if pageControl.currentPage == 0 {
                    completeDayNineUISetup(condition0: dayNineCondition0, condition1: dayNineCondition1, condition2: dayNineCondition2, condition3: dayNineCondition3, condition4: dayNineCondition4, condition5: dayNineCondition5, condition6: dayNineCondition6, condition7: dayNineCondition7, int0: dayNineWindSpeed0, int1: dayNineWindSpeed1, int2: dayNineWindSpeed2, int3: dayNineWindSpeed3, int4: dayNineWindSpeed4, int5: dayNineWindSpeed5, int6: dayNineWindSpeed6, int7: dayNineWindSpeed7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayNineUISetup(condition0: dayNineCondition8, condition1: dayNineCondition9, condition2: dayNineCondition10, condition3: dayNineCondition11, condition4: dayNineCondition12, condition5: dayNineCondition13, condition6: dayNineCondition14, condition7: dayNineCondition15, int0: dayNineWindSpeed8, int1: dayNineWindSpeed9, int2: dayNineWindSpeed10, int3: dayNineWindSpeed11, int4: dayNineWindSpeed12, int5: dayNineWindSpeed13, int6: dayNineWindSpeed14, int7: dayNineWindSpeed15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            } else if segmentControl.selectedSegmentIndex == 5 {
                if pageControl.currentPage == 0 {
                    completeDayNineUISetup(condition0: dayNineCondition0, condition1: dayNineCondition1, condition2: dayNineCondition2, condition3: dayNineCondition3, condition4: dayNineCondition4, condition5: dayNineCondition5, condition6: dayNineCondition6, condition7: dayNineCondition7, int0: dayNineCloudCover0, int1: dayNineCloudCover1, int2: dayNineCloudCover2, int3: dayNineCloudCover3, int4: dayNineCloudCover4, int5: dayNineCloudCover5, int6: dayNineCloudCover6, int7: dayNineCloudCover7, time0: dayTime0, time1: dayTime1, time2: dayTime2, time3: dayTime3, time4: dayTime4, time5: dayTime5, time6: dayTime6, time7: dayTime7)
                } else {
                    completeDayNineUISetup(condition0: dayNineCondition8, condition1: dayNineCondition9, condition2: dayNineCondition10, condition3: dayNineCondition11, condition4: dayNineCondition12, condition5: dayNineCondition13, condition6: dayNineCondition14, condition7: dayNineCondition15, int0: dayNineCloudCover8, int1: dayNineCloudCover9, int2: dayNineCloudCover10, int3: dayNineCloudCover11, int4: dayNineCloudCover12, int5: dayNineCloudCover13, int6: dayNineCloudCover14, int7: dayNineCloudCover15, time0: dayTime8, time1: dayTime9, time2: dayTime10, time3: dayTime11, time4: dayTime12, time5: dayTime13, time6: dayTime14, time7: dayTime15)
                }
            }
        } else if day == 14 {
               if segmentControl.selectedSegmentIndex == 0 {
                   if pageControl.currentPage == 0 {
                    completeHourlyUISetup(condition0: conditionHour0, condition1: conditionHour1, condition2: conditionHour2, condition3: conditionHour3, condition4: conditionHour4, condition5: conditionHour5, condition6: conditionHour6, condition7: conditionHour7, int1: precipHour0, int2: precipHour1, int3: precipHour2, int4: precipHour3, int5: precipHour4, int6: precipHour5, int7: precipHour6, int8: precipHour7, time0: hour0, time1: hour1, time2: hour2, time3: hour3, time4: hour4, time5: hour5, time6: hour6, time7: hour7)
                   } else {
                    completeHourlyUISetup(condition0: conditionHour8, condition1: conditionHour9, condition2: conditionHour10, condition3: conditionHour11, condition4: conditionHour12, condition5: conditionHour13, condition6: conditionHour14, condition7: conditionHour15, int1: precipHour8, int2: precipHour9, int3: precipHour10, int4: precipHour11, int5: precipHour12, int6: precipHour13, int7: precipHour14, int8: precipHour15, time0: hour8, time1: hour9, time2: hour10, time3: hour11, time4: hour12, time5: hour13, time6: hour14, time7: hour15)
                   }
               } else if segmentControl.selectedSegmentIndex == 1 {
                   if pageControl.currentPage == 0 {
                    completeHourlyUISetup(condition0: conditionHour0, condition1: conditionHour1, condition2: conditionHour2, condition3: conditionHour3, condition4: conditionHour4, condition5: conditionHour5, condition6: conditionHour6, condition7: conditionHour7, int1: tempHour0, int2: tempHour1, int3: tempHour2, int4: tempHour3, int5: tempHour4, int6: tempHour5, int7: tempHour6, int8: tempHour7, time0: hour0, time1: hour1, time2: hour2, time3: hour3, time4: hour4, time5: hour5, time6: hour6, time7: hour7)
                   } else {
                    completeHourlyUISetup(condition0: conditionHour8, condition1: conditionHour9, condition2: conditionHour10, condition3: conditionHour11, condition4: conditionHour12, condition5: conditionHour13, condition6: conditionHour14, condition7: conditionHour15, int1: tempHour8, int2: tempHour9, int3: tempHour10, int4: tempHour11, int5: tempHour12, int6: tempHour13, int7: tempHour14, int8: tempHour15, time0: hour8, time1: hour9, time2: hour10, time3: hour11, time4: hour12, time5: hour13, time6: hour14, time7: hour15)
                   }
               } else if segmentControl.selectedSegmentIndex == 2 {
                   if pageControl.currentPage == 0 {
                    completeHourlyUISetup(condition0: conditionHour0, condition1: conditionHour1, condition2: conditionHour2, condition3: conditionHour3, condition4: conditionHour4, condition5: conditionHour5, condition6: conditionHour6, condition7: conditionHour7, int1: humidityHour0, int2: humidityHour1, int3: humidityHour2, int4: humidityHour3, int5: humidityHour4, int6: humidityHour5, int7: humidityHour6, int8: humidityHour7, time0: hour0, time1: hour1, time2: hour2, time3: hour3, time4: hour4, time5: hour5, time6: hour6, time7: hour7)
                   } else {
                    completeHourlyUISetup(condition0: conditionHour8, condition1: conditionHour9, condition2: conditionHour10, condition3: conditionHour11, condition4: conditionHour12, condition5: conditionHour13, condition6: conditionHour14, condition7: conditionHour15, int1: humidityHour8, int2: humidityHour9, int3: humidityHour10, int4: humidityHour11, int5: humidityHour12, int6: humidityHour13, int7: humidityHour14, int8: humidityHour15, time0: hour8, time1: hour9, time2: hour10, time3: hour11, time4: hour12, time5: hour13, time6: hour14, time7: hour15)
                   }
               } else if segmentControl.selectedSegmentIndex == 3 {
                   if pageControl.currentPage == 0 {
                    completeHourlyUISetup(condition0: conditionHour0, condition1: conditionHour1, condition2: conditionHour2, condition3: conditionHour3, condition4: conditionHour4, condition5: conditionHour5, condition6: conditionHour6, condition7: conditionHour7, int1: uvindexHour0, int2: uvindexHour1, int3: uvindexHour2, int4: uvindexHour3, int5: uvindexHour4, int6: uvindexHour5, int7: uvindexHour6, int8: uvindexHour7, time0: hour0, time1: hour1, time2: hour2, time3: hour3, time4: hour4, time5: hour5, time6: hour6, time7: hour7)
                   } else {
                    completeHourlyUISetup(condition0: conditionHour8, condition1: conditionHour9, condition2: conditionHour10, condition3: conditionHour11, condition4: conditionHour12, condition5: conditionHour13, condition6: conditionHour14, condition7: conditionHour15, int1: uvindexHour8, int2: uvindexHour9, int3: uvindexHour10, int4: uvindexHour11, int5: uvindexHour12, int6: uvindexHour13, int7: uvindexHour14, int8: uvindexHour15, time0: hour8, time1: hour9, time2: hour10, time3: hour11, time4: hour12, time5: hour13, time6: hour14, time7: hour15)
                   }
               } else if segmentControl.selectedSegmentIndex == 4 {
                   if pageControl.currentPage == 0 {
                    completeHourlyUISetup(condition0: conditionHour0, condition1: conditionHour1, condition2: conditionHour2, condition3: conditionHour3, condition4: conditionHour4, condition5: conditionHour5, condition6: conditionHour6, condition7: conditionHour7, int1: windSpeedHour0, int2: windSpeedHour1, int3: windSpeedHour2, int4: windSpeedHour3, int5: windSpeedHour4, int6: windSpeedHour5, int7: windSpeedHour6, int8: windSpeedHour7, time0: hour0, time1: hour1, time2: hour2, time3: hour3, time4: hour4, time5: hour5, time6: hour6, time7: hour7)
                   } else {
                    completeHourlyUISetup(condition0: conditionHour8, condition1: conditionHour9, condition2: conditionHour10, condition3: conditionHour11, condition4: conditionHour12, condition5: conditionHour13, condition6: conditionHour14, condition7: conditionHour15, int1: windSpeedHour8, int2: windSpeedHour9, int3: windSpeedHour10, int4: windSpeedHour11, int5: windSpeedHour12, int6: windSpeedHour13, int7: windSpeedHour14, int8: windSpeedHour15, time0: hour8, time1: hour9, time2: hour10, time3: hour11, time4: hour12, time5: hour13, time6: hour14, time7: hour15)
                   }
               } else if segmentControl.selectedSegmentIndex == 5 {
                   if pageControl.currentPage == 0 {
                    completeHourlyUISetup(condition0: conditionHour0, condition1: conditionHour1, condition2: conditionHour2, condition3: conditionHour3, condition4: conditionHour4, condition5: conditionHour5, condition6: conditionHour6, condition7: conditionHour7, int1: cloudCoverHour0, int2: cloudCoverHour1, int3: cloudCoverHour2, int4: cloudCoverHour3, int5: cloudCoverHour4, int6: cloudCoverHour5, int7: cloudCoverHour6, int8: cloudCoverHour7, time0: hour0, time1: hour1, time2: hour2, time3: hour3, time4: hour4, time5: hour5, time6: hour6, time7: hour7)
                   } else {
                    completeHourlyUISetup(condition0: conditionHour8, condition1: conditionHour9, condition2: conditionHour10, condition3: conditionHour11, condition4: conditionHour12, condition5: conditionHour13, condition6: conditionHour14, condition7: conditionHour15, int1: cloudCoverHour8, int2: cloudCoverHour9, int3: cloudCoverHour10, int4: cloudCoverHour11, int5: cloudCoverHour12, int6: cloudCoverHour13, int7: cloudCoverHour14, int8: cloudCoverHour15, time0: hour8, time1: hour9, time2: hour10, time3: hour11, time4: hour12, time5: hour13, time6: hour14, time7: hour15)
                   }
               }
           }
    }
    
    // MARK: - Set up hourly values for daily and hourly forecasts
    func hourSetup(conditionImage: UIImageView!, conditionImageType: String, conditionValueText: UILabel!, conditionValue: Int, image: UIImageView!, timeText: UILabel!, timeValue: String, height: NSLayoutConstraint!) {
        conditionImage.image = UIImage(named: weatherCondition(condition: conditionImageType, type: "image"))
        conditionValueText.text = "\(conditionValue)"
        timeText.text = "\(timeValue)"
        
        if conditionValue <= 50 {
            image.image = UIImage(named: "Rectangle 50 \(buttonColor).pdf")
            height.constant = CGFloat(hourlyValue(value: conditionValue) + 50)
        } else {
            image.image = UIImage(named: "Rectangle 100 \(buttonColor).pdf")
            height.constant = CGFloat(hourlyValue(value: conditionValue))
        }
    }
    
    func completeHourlyUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: hour0Condition, conditionImageType: condition0, conditionValueText: hour0ValueText, conditionValue: int1, image: hour0Image, timeText: hour0Time, timeValue: time0, height: hour0ValueHeight)
        hourSetup(conditionImage: hour1Condition, conditionImageType: condition1, conditionValueText: hour1ValueText, conditionValue: int2, image: hour1Image, timeText: hour1Time, timeValue: time1, height: hour1ValueHeight)
        hourSetup(conditionImage: hour2Condition, conditionImageType: condition2, conditionValueText: hour2ValueText, conditionValue: int3, image: hour2Image, timeText: hour2Time, timeValue: time2, height: hour2ValueHeight)
        hourSetup(conditionImage: hour3Condition, conditionImageType: condition3, conditionValueText: hour3ValueText, conditionValue: int4, image: hour3Image, timeText: hour3Time, timeValue: time3, height: hour3ValueHeight)
        hourSetup(conditionImage: hour4Condition, conditionImageType: condition4, conditionValueText: hour4ValueText, conditionValue: int5, image: hour4Image, timeText: hour4Time, timeValue: time4, height: hour4ValueHeight)
        hourSetup(conditionImage: hour5Condition, conditionImageType: condition5, conditionValueText: hour5ValueText, conditionValue: int6, image: hour5Image, timeText: hour5Time, timeValue: time5, height: hour5ValueHeight)
        hourSetup(conditionImage: hour6Condition, conditionImageType: condition6, conditionValueText: hour6ValueText, conditionValue: int7, image: hour6Image, timeText: hour6Time, timeValue: time6, height: hour6ValueHeight)
        hourSetup(conditionImage: hour7Condition, conditionImageType: condition7, conditionValueText: hour7ValueText, conditionValue: int8, image: hour7Image, timeText: hour7Time, timeValue: time7, height: hour7ValueHeight)
    }
    
    func completeDayZeroUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: condition0, conditionValueText: dayZeroHour0ValueText, conditionValue: int0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: time0, height: dayZeroHour0ValueHeight)
        hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: condition1, conditionValueText: dayZeroHour1ValueText, conditionValue: int1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: time1, height: dayZeroHour1ValueHeight)
        hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: condition2, conditionValueText: dayZeroHour2ValueText, conditionValue: int2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: time2, height: dayZeroHour2ValueHeight)
        hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: condition3, conditionValueText: dayZeroHour3ValueText, conditionValue: int3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: time3, height: dayZeroHour3ValueHeight)
        hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: condition4, conditionValueText: dayZeroHour4ValueText, conditionValue: int4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: time4, height: dayZeroHour4ValueHeight)
        hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: condition5, conditionValueText: dayZeroHour5ValueText, conditionValue: int5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: time5, height: dayZeroHour5ValueHeight)
        hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: condition6, conditionValueText: dayZeroHour6ValueText, conditionValue: int6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: time6, height: dayZeroHour6ValueHeight)
        hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: condition7, conditionValueText: dayZeroHour7ValueText, conditionValue: int7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: time7, height: dayZeroHour7ValueHeight)
    }

    func completeDayOneUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: condition0, conditionValueText: dayOneHour0ValueText, conditionValue: int0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: time0, height: dayOneHour0ValueHeight)
        hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: condition1, conditionValueText: dayOneHour1ValueText, conditionValue: int1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: time1, height: dayOneHour1ValueHeight)
        hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: condition2, conditionValueText: dayOneHour2ValueText, conditionValue: int2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: time2, height: dayOneHour2ValueHeight)
        hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: condition3, conditionValueText: dayOneHour3ValueText, conditionValue: int3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: time3, height: dayOneHour3ValueHeight)
        hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: condition4, conditionValueText: dayOneHour4ValueText, conditionValue: int4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: time4, height: dayOneHour4ValueHeight)
        hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: condition5, conditionValueText: dayOneHour5ValueText, conditionValue: int5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: time5, height: dayOneHour5ValueHeight)
        hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: condition6, conditionValueText: dayOneHour6ValueText, conditionValue: int6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: time6, height: dayOneHour6ValueHeight)
        hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: condition7, conditionValueText: dayOneHour7ValueText, conditionValue: int7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: time7, height: dayOneHour7ValueHeight)
    }

    func completeDayTwoUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: condition0, conditionValueText: dayTwoHour0ValueText, conditionValue: int0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: time0, height: dayTwoHour0ValueHeight)
        hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: condition1, conditionValueText: dayTwoHour1ValueText, conditionValue: int1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: time1, height: dayTwoHour1ValueHeight)
        hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: condition2, conditionValueText: dayTwoHour2ValueText, conditionValue: int2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: time2, height: dayTwoHour2ValueHeight)
        hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: condition3, conditionValueText: dayTwoHour3ValueText, conditionValue: int3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: time3, height: dayTwoHour3ValueHeight)
        hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: condition4, conditionValueText: dayTwoHour4ValueText, conditionValue: int4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: time4, height: dayTwoHour4ValueHeight)
        hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: condition5, conditionValueText: dayTwoHour5ValueText, conditionValue: int5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: time5, height: dayTwoHour5ValueHeight)
        hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: condition6, conditionValueText: dayTwoHour6ValueText, conditionValue: int6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: time6, height: dayTwoHour6ValueHeight)
        hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: condition7, conditionValueText: dayTwoHour7ValueText, conditionValue: int7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: time7, height: dayTwoHour7ValueHeight)
    }

    func completeDayThreeUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: condition0, conditionValueText: dayThreeHour0ValueText, conditionValue: int0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: time0, height: dayThreeHour0ValueHeight)
        hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: condition1, conditionValueText: dayThreeHour1ValueText, conditionValue: int1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: time1, height: dayThreeHour1ValueHeight)
        hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: condition2, conditionValueText: dayThreeHour2ValueText, conditionValue: int2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: time2, height: dayThreeHour2ValueHeight)
        hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: condition3, conditionValueText: dayThreeHour3ValueText, conditionValue: int3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: time3, height: dayThreeHour3ValueHeight)
        hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: condition4, conditionValueText: dayThreeHour4ValueText, conditionValue: int4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: time4, height: dayThreeHour4ValueHeight)
        hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: condition5, conditionValueText: dayThreeHour5ValueText, conditionValue: int5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: time5, height: dayThreeHour5ValueHeight)
        hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: condition6, conditionValueText: dayThreeHour6ValueText, conditionValue: int6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: time6, height: dayThreeHour6ValueHeight)
        hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: condition7, conditionValueText: dayThreeHour7ValueText, conditionValue: int7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: time7, height: dayThreeHour7ValueHeight)
    }

    func completeDayFourUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: condition0, conditionValueText: dayFourHour0ValueText, conditionValue: int0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: time0, height: dayFourHour0ValueHeight)
        hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: condition1, conditionValueText: dayFourHour1ValueText, conditionValue: int1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: time1, height: dayFourHour1ValueHeight)
        hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: condition2, conditionValueText: dayFourHour2ValueText, conditionValue: int2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: time2, height: dayFourHour2ValueHeight)
        hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: condition3, conditionValueText: dayFourHour3ValueText, conditionValue: int3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: time3, height: dayFourHour3ValueHeight)
        hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: condition4, conditionValueText: dayFourHour4ValueText, conditionValue: int4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: time4, height: dayFourHour4ValueHeight)
        hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: condition5, conditionValueText: dayFourHour5ValueText, conditionValue: int5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: time5, height: dayFourHour5ValueHeight)
        hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: condition6, conditionValueText: dayFourHour6ValueText, conditionValue: int6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: time6, height: dayFourHour6ValueHeight)
        hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: condition7, conditionValueText: dayFourHour7ValueText, conditionValue: int7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: time7, height: dayFourHour7ValueHeight)
    }

    func completeDayFiveUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: condition0, conditionValueText: dayFiveHour0ValueText, conditionValue: int0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: time0, height: dayFiveHour0ValueHeight)
        hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: condition1, conditionValueText: dayFiveHour1ValueText, conditionValue: int1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: time1, height: dayFiveHour1ValueHeight)
        hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: condition2, conditionValueText: dayFiveHour2ValueText, conditionValue: int2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: time2, height: dayFiveHour2ValueHeight)
        hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: condition3, conditionValueText: dayFiveHour3ValueText, conditionValue: int3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: time3, height: dayFiveHour3ValueHeight)
        hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: condition4, conditionValueText: dayFiveHour4ValueText, conditionValue: int4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: time4, height: dayFiveHour4ValueHeight)
        hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: condition5, conditionValueText: dayFiveHour5ValueText, conditionValue: int5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: time5, height: dayFiveHour5ValueHeight)
        hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: condition6, conditionValueText: dayFiveHour6ValueText, conditionValue: int6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: time6, height: dayFiveHour6ValueHeight)
        hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: condition7, conditionValueText: dayFiveHour7ValueText, conditionValue: int7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: time7, height: dayFiveHour7ValueHeight)
    }

    func completeDaySixUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: daySixHour0Condition, conditionImageType: condition0, conditionValueText: daySixHour0ValueText, conditionValue: int0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: time0, height: daySixHour0ValueHeight)
        hourSetup(conditionImage: daySixHour1Condition, conditionImageType: condition1, conditionValueText: daySixHour1ValueText, conditionValue: int1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: time1, height: daySixHour1ValueHeight)
        hourSetup(conditionImage: daySixHour2Condition, conditionImageType: condition2, conditionValueText: daySixHour2ValueText, conditionValue: int2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: time2, height: daySixHour2ValueHeight)
        hourSetup(conditionImage: daySixHour3Condition, conditionImageType: condition3, conditionValueText: daySixHour3ValueText, conditionValue: int3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: time3, height: daySixHour3ValueHeight)
        hourSetup(conditionImage: daySixHour4Condition, conditionImageType: condition4, conditionValueText: daySixHour4ValueText, conditionValue: int4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: time4, height: daySixHour4ValueHeight)
        hourSetup(conditionImage: daySixHour5Condition, conditionImageType: condition5, conditionValueText: daySixHour5ValueText, conditionValue: int5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: time5, height: daySixHour5ValueHeight)
        hourSetup(conditionImage: daySixHour6Condition, conditionImageType: condition6, conditionValueText: daySixHour6ValueText, conditionValue: int6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: time6, height: daySixHour6ValueHeight)
        hourSetup(conditionImage: daySixHour7Condition, conditionImageType: condition7, conditionValueText: daySixHour7ValueText, conditionValue: int7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: time7, height: daySixHour7ValueHeight)
    }

    func completeDaySevenUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: condition0, conditionValueText: daySevenHour0ValueText, conditionValue: int0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: time0, height: daySevenHour0ValueHeight)
        hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: condition1, conditionValueText: daySevenHour1ValueText, conditionValue: int1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: time1, height: daySevenHour1ValueHeight)
        hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: condition2, conditionValueText: daySevenHour2ValueText, conditionValue: int2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: time2, height: daySevenHour2ValueHeight)
        hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: condition3, conditionValueText: daySevenHour3ValueText, conditionValue: int3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: time3, height: daySevenHour3ValueHeight)
        hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: condition4, conditionValueText: daySevenHour4ValueText, conditionValue: int4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: time4, height: daySevenHour4ValueHeight)
        hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: condition5, conditionValueText: daySevenHour5ValueText, conditionValue: int5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: time5, height: daySevenHour5ValueHeight)
        hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: condition6, conditionValueText: daySevenHour6ValueText, conditionValue: int6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: time6, height: daySevenHour6ValueHeight)
        hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: condition7, conditionValueText: daySevenHour7ValueText, conditionValue: int7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: time7, height: daySevenHour7ValueHeight)
    }

    func completeDayEightUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayEightHour0Condition, conditionImageType: condition0, conditionValueText: dayEightHour0ValueText, conditionValue: int0, image: dayEightHour0Image, timeText: dayEightHour0Time, timeValue: time0, height: dayEightHour0ValueHeight)
        hourSetup(conditionImage: dayEightHour1Condition, conditionImageType: condition1, conditionValueText: dayEightHour1ValueText, conditionValue: int1, image: dayEightHour1Image, timeText: dayEightHour1Time, timeValue: time1, height: dayEightHour1ValueHeight)
        hourSetup(conditionImage: dayEightHour2Condition, conditionImageType: condition2, conditionValueText: dayEightHour2ValueText, conditionValue: int2, image: dayEightHour2Image, timeText: dayEightHour2Time, timeValue: time2, height: dayEightHour2ValueHeight)
        hourSetup(conditionImage: dayEightHour3Condition, conditionImageType: condition3, conditionValueText: dayEightHour3ValueText, conditionValue: int3, image: dayEightHour3Image, timeText: dayEightHour3Time, timeValue: time3, height: dayEightHour3ValueHeight)
        hourSetup(conditionImage: dayEightHour4Condition, conditionImageType: condition4, conditionValueText: dayEightHour4ValueText, conditionValue: int4, image: dayEightHour4Image, timeText: dayEightHour4Time, timeValue: time4, height: dayEightHour4ValueHeight)
        hourSetup(conditionImage: dayEightHour5Condition, conditionImageType: condition5, conditionValueText: dayEightHour5ValueText, conditionValue: int5, image: dayEightHour5Image, timeText: dayEightHour5Time, timeValue: time5, height: dayEightHour5ValueHeight)
        hourSetup(conditionImage: dayEightHour6Condition, conditionImageType: condition6, conditionValueText: dayEightHour6ValueText, conditionValue: int6, image: dayEightHour6Image, timeText: dayEightHour6Time, timeValue: time6, height: dayEightHour6ValueHeight)
        hourSetup(conditionImage: dayEightHour7Condition, conditionImageType: condition7, conditionValueText: dayEightHour7ValueText, conditionValue: int7, image: dayEightHour7Image, timeText: dayEightHour7Time, timeValue: time7, height: dayEightHour7ValueHeight)
    }

    func completeDayNineUISetup(condition0: String, condition1: String, condition2: String, condition3: String, condition4: String, condition5: String, condition6: String, condition7: String, int0: Int, int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, time0: String, time1: String, time2: String, time3: String, time4: String, time5: String, time6: String, time7: String) {
        hourSetup(conditionImage: dayNineHour0Condition, conditionImageType: condition0, conditionValueText: dayNineHour0ValueText, conditionValue: int0, image: dayNineHour0Image, timeText: dayNineHour0Time, timeValue: time0, height: dayNineHour0ValueHeight)
        hourSetup(conditionImage: dayNineHour1Condition, conditionImageType: condition1, conditionValueText: dayNineHour1ValueText, conditionValue: int1, image: dayNineHour1Image, timeText: dayNineHour1Time, timeValue: time1, height: dayNineHour1ValueHeight)
        hourSetup(conditionImage: dayNineHour2Condition, conditionImageType: condition2, conditionValueText: dayNineHour2ValueText, conditionValue: int2, image: dayNineHour2Image, timeText: dayNineHour2Time, timeValue: time2, height: dayNineHour2ValueHeight)
        hourSetup(conditionImage: dayNineHour3Condition, conditionImageType: condition3, conditionValueText: dayNineHour3ValueText, conditionValue: int3, image: dayNineHour3Image, timeText: dayNineHour3Time, timeValue: time3, height: dayNineHour3ValueHeight)
        hourSetup(conditionImage: dayNineHour4Condition, conditionImageType: condition4, conditionValueText: dayNineHour4ValueText, conditionValue: int4, image: dayNineHour4Image, timeText: dayNineHour4Time, timeValue: time4, height: dayNineHour4ValueHeight)
        hourSetup(conditionImage: dayNineHour5Condition, conditionImageType: condition5, conditionValueText: dayNineHour5ValueText, conditionValue: int5, image: dayNineHour5Image, timeText: dayNineHour5Time, timeValue: time5, height: dayNineHour5ValueHeight)
        hourSetup(conditionImage: dayNineHour6Condition, conditionImageType: condition6, conditionValueText: dayNineHour6ValueText, conditionValue: int6, image: dayNineHour6Image, timeText: dayNineHour6Time, timeValue: time6, height: dayNineHour6ValueHeight)
        hourSetup(conditionImage: dayNineHour7Condition, conditionImageType: condition7, conditionValueText: dayNineHour7ValueText, conditionValue: int7, image: dayNineHour7Image, timeText: dayNineHour7Time, timeValue: time7, height: dayNineHour7ValueHeight)
    }

    // MARK: - Set day labels 0-7
    func setDayLabelText(dayLabel: UILabel!, highLowLabel: UILabel!, precipLabel: UILabel!, summaryTextView: UITextView!, stackView: UIStackView!, dayString: String, dateString: String, summary: String, sunrise: String, sunset: String, dayHigh: Int, dayLow: Int, dayPrecip: Int, precipAccum: Double, conditionValue: Any) {
        dayLabel.text = "\(dayString)\n\(dateString)"
        if stackView.isHidden == true {
            highLowLabel.text = "\(dayHigh)°/\(dayLow)°"
            precipLabel.text = "\(defaultDailyConditionValueType) \(conditionValue)\(defaultDailyConditionValueUnit)"
            summaryTextView.text = "\(summary)"
        } else {
            highLowLabel.text = ""
            precipLabel.text = "\(dayHigh)°/\(dayLow)°"
            if precipAccum > 0 && precipAccum < 1 {
                summaryTextView.text = "\(summary) Chance of precipitation \(dayPrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(sunrise), Sunset \(sunset)."
            } else if precipAccum > 1 {
                summaryTextView.text = "\(summary) Chance of precipitation \(dayPrecip)%. Snow accumulation \(Int(precipAccum)) \(unitsPrecipitation). Sunrise \(sunrise), Sunset \(sunset)."
            } else {
                summaryTextView.text = "\(summary) Chance of precipitation \(dayPrecip)%. Sunrise \(sunrise), Sunset \(sunset)."
            }
        }
    }
        
    func setDayLabels() {
        setDayLabelText(dayLabel: dayZeroDay, highLowLabel: dayZeroHighLow, precipLabel: dayZeroPrecipitation, summaryTextView: dayZeroSummary, stackView: dayZeroStackView, dayString: dayZeroDayString, dateString: dayZeroDateString, summary: dayZeroSummaryString, sunrise: dayZeroSunrise, sunset: dayZeroSunset, dayHigh: dayZeroHigh, dayLow: dayZeroLow, dayPrecip: dayZeroPrecip, precipAccum: dayZeroPrecipAccum, conditionValue: dayZeroConditionValue)
        setDayLabelText(dayLabel: dayOneDay, highLowLabel: dayOneHighLow, precipLabel: dayOnePrecipitation, summaryTextView: dayOneSummary, stackView: dayOneStackView, dayString: dayOneDayString, dateString: dayOneDateString, summary: dayOneSummaryString, sunrise: dayOneSunrise, sunset: dayOneSunset, dayHigh: dayOneHigh, dayLow: dayOneLow, dayPrecip: dayOnePrecip, precipAccum: dayOnePrecipAccum, conditionValue: dayOneConditionValue)
        setDayLabelText(dayLabel: dayTwoDay, highLowLabel: dayTwoHighLow, precipLabel: dayTwoPrecipitation, summaryTextView: dayTwoSummary, stackView: dayTwoStackView, dayString: dayTwoDayString, dateString: dayTwoDateString, summary: dayTwoSummaryString, sunrise: dayTwoSunrise, sunset: dayTwoSunset, dayHigh: dayTwoHigh, dayLow: dayTwoLow, dayPrecip: dayTwoPrecip, precipAccum: dayTwoPrecipAccum, conditionValue: dayTwoConditionValue)
        setDayLabelText(dayLabel: dayThreeDay, highLowLabel: dayThreeHighLow, precipLabel: dayThreePrecipitation, summaryTextView: dayThreeSummary, stackView: dayThreeStackView, dayString: dayThreeDayString, dateString: dayThreeDateString, summary: dayThreeSummaryString, sunrise: dayThreeSunrise, sunset: dayThreeSunset, dayHigh: dayThreeHigh, dayLow: dayThreeLow, dayPrecip: dayThreePrecip, precipAccum: dayThreePrecipAccum, conditionValue: dayThreeConditionValue)
        setDayLabelText(dayLabel: dayFourDay, highLowLabel: dayFourHighLow, precipLabel: dayFourPrecipitation, summaryTextView: dayFourSummary, stackView: dayFourStackView, dayString: dayFourDayString, dateString: dayFourDateString, summary: dayFourSummaryString, sunrise: dayFourSunrise, sunset: dayFourSunset, dayHigh: dayFourHigh, dayLow: dayFourLow, dayPrecip: dayFourPrecip, precipAccum: dayFourPrecipAccum, conditionValue: dayFourConditionValue)
        setDayLabelText(dayLabel: dayFiveDay, highLowLabel: dayFiveHighLow, precipLabel: dayFivePrecipitation, summaryTextView: dayFiveSummary, stackView: dayFiveStackView, dayString: dayFiveDayString, dateString: dayFiveDateString, summary: dayFiveSummaryString, sunrise: dayFiveSunrise, sunset: dayFiveSunset, dayHigh: dayFiveHigh, dayLow: dayFiveLow, dayPrecip: dayFivePrecip, precipAccum: dayFivePrecipAccum, conditionValue: dayFiveConditionValue)
        setDayLabelText(dayLabel: daySixDay, highLowLabel: daySixHighLow, precipLabel: daySixPrecipitation, summaryTextView: daySixSummary, stackView: daySixStackView, dayString: daySixDayString, dateString: daySixDateString, summary: daySixSummaryString, sunrise: daySixSunrise, sunset: daySixSunset, dayHigh: daySixHigh, dayLow: daySixLow, dayPrecip: daySixPrecip, precipAccum: daySixPrecipAccum, conditionValue: daySixConditionValue)
        setDayLabelText(dayLabel: daySevenDay, highLowLabel: daySevenHighLow, precipLabel: daySevenPrecipitation, summaryTextView: daySevenSummary, stackView: daySevenStackView, dayString: daySevenDayString, dateString: daySevenDateString, summary: daySevenSummaryString, sunrise: daySevenSunrise, sunset: daySevenSunset, dayHigh: daySevenHigh, dayLow: daySevenLow, dayPrecip: daySevenPrecip, precipAccum: daySevenPrecipAccum, conditionValue: daySevenConditionValue)
        setDayLabelText(dayLabel: dayEightDay, highLowLabel: dayEightHighLow, precipLabel: dayEightPrecipitation, summaryTextView: dayEightSummary, stackView: dayEightStackView, dayString: dayEightDayString, dateString: dayEightDateString, summary: dayEightSummaryString, sunrise: dayEightSunrise, sunset: dayEightSunset, dayHigh: dayEightHigh, dayLow: dayEightLow, dayPrecip: dayEightPrecip, precipAccum: dayEightPrecipAccum, conditionValue: dayEightConditionValue)
        setDayLabelText(dayLabel: dayNineDay, highLowLabel: dayNineHighLow, precipLabel: dayNinePrecipitation, summaryTextView: dayNineSummary, stackView: dayNineStackView, dayString: dayNineDayString, dateString: dayNineDateString, summary: dayNineSummaryString, sunrise: dayNineSunrise, sunset: dayNineSunset, dayHigh: dayNineHigh, dayLow: dayNineLow, dayPrecip: dayNinePrecip, precipAccum: dayNinePrecipAccum, conditionValue: dayNineConditionValue)
    }
    
    // MARK: - Action to open weather alerts
    @IBAction func weatherAlertsButtonTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: alertURI)!)
        present(svc, animated: true, completion: nil)
    }
    
    // MARK: - Actions for changing hourly forecast
    @IBAction func hourlySegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 14, segmentControl: hourlySegmentControl, pageControl: hourlyPageControl)
    }
    
    @IBAction func hourlyPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 14, segmentControl: hourlySegmentControl, pageControl: hourlyPageControl)
    }
    @IBAction func hourlyNextPageTapped(_ sender: UITapGestureRecognizer) {
        if hourlyPageControl.currentPage == 0 {
            hourlyPageControl.currentPage = 1
        } else if hourlyPageControl.currentPage == 1 {
            hourlyPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 14, segmentControl: hourlySegmentControl, pageControl: hourlyPageControl)
    }
    
    @IBAction func dayZeroSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 0, segmentControl: dayZeroSegmentControl, pageControl: dayZeroPageControl)
    }
    @IBAction func dayZeroPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 0, segmentControl: dayZeroSegmentControl, pageControl: dayZeroPageControl)
    }
    @IBAction func dayZeroNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayZeroPageControl.currentPage == 0 {
            dayZeroPageControl.currentPage = 1
        } else if dayZeroPageControl.currentPage == 1 {
            dayZeroPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 0, segmentControl: dayZeroSegmentControl, pageControl: dayZeroPageControl)
    }
    
    @IBAction func dayOneSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 1, segmentControl: dayOneSegmentControl, pageControl: dayOnePageControl)
    }
    @IBAction func dayOnePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 1, segmentControl: dayOneSegmentControl, pageControl: dayOnePageControl)
    }
    @IBAction func dayOneNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayOnePageControl.currentPage == 0 {
            dayOnePageControl.currentPage = 1
        } else if dayOnePageControl.currentPage == 1 {
            dayOnePageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 1, segmentControl: dayOneSegmentControl, pageControl: dayOnePageControl)
    }
    
    @IBAction func dayTwoSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 2, segmentControl: dayTwoSegmentControl, pageControl: dayTwoPageControl)
    }
    @IBAction func dayTwoPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 2, segmentControl: dayTwoSegmentControl, pageControl: dayTwoPageControl)
    }
    @IBAction func dayTwoNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayTwoPageControl.currentPage == 0 {
            dayTwoPageControl.currentPage = 1
        } else if dayTwoPageControl.currentPage == 1 {
            dayTwoPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 2, segmentControl: dayTwoSegmentControl, pageControl: dayTwoPageControl)
    }
    
    @IBAction func dayThreeSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 3, segmentControl: dayThreeSegmentControl, pageControl: dayThreePageControl)
    }
    @IBAction func dayThreePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 3, segmentControl: dayThreeSegmentControl, pageControl: dayThreePageControl)
    }
    @IBAction func dayThreeNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayThreePageControl.currentPage == 0 {
            dayThreePageControl.currentPage = 1
        } else if dayThreePageControl.currentPage == 1 {
            dayThreePageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 3, segmentControl: dayThreeSegmentControl, pageControl: dayThreePageControl)
    }
    
    @IBAction func dayFourSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 4, segmentControl: dayFourSegmentControl, pageControl: dayFourPageControl)
    }
    @IBAction func dayFourPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 4, segmentControl: dayFourSegmentControl, pageControl: dayFourPageControl)
    }
    @IBAction func dayFourNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayFourPageControl.currentPage == 0 {
            dayFourPageControl.currentPage = 1
        } else if dayFourPageControl.currentPage == 1 {
            dayFourPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 4, segmentControl: dayFourSegmentControl, pageControl: dayFourPageControl)
    }
    
    @IBAction func dayFiveSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 5, segmentControl: dayFiveSegmentControl, pageControl: dayFivePageControl)
    }
    @IBAction func dayFivePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 5, segmentControl: dayFiveSegmentControl, pageControl: dayFivePageControl)
    }
    @IBAction func dayFiveNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayFivePageControl.currentPage == 0 {
            dayFivePageControl.currentPage = 1
        } else if dayFivePageControl.currentPage == 1 {
            dayFivePageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 5, segmentControl: dayFiveSegmentControl, pageControl: dayFivePageControl)
    }
    
    @IBAction func daySixSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 6, segmentControl: daySixSegmentControl, pageControl: daySixPageControl)
    }
    @IBAction func daySixPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 6, segmentControl: daySixSegmentControl, pageControl: daySixPageControl)
    }
    @IBAction func daySixNextPageTapped(_ sender: UITapGestureRecognizer) {
        if daySixPageControl.currentPage == 0 {
            daySixPageControl.currentPage = 1
        } else if daySixPageControl.currentPage == 1 {
            daySixPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 6, segmentControl: daySixSegmentControl, pageControl: daySixPageControl)
    }
    
    @IBAction func daySevenSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 7, segmentControl: daySevenSegmentControl, pageControl: daySevenPageControl)
    }
    @IBAction func daySevenPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 7, segmentControl: daySevenSegmentControl, pageControl: daySevenPageControl)
    }
    @IBAction func daySevenNextPageTapped(_ sender: UITapGestureRecognizer) {
        if daySevenPageControl.currentPage == 0 {
            daySevenPageControl.currentPage = 1
        } else if daySevenPageControl.currentPage == 1 {
            daySevenPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 7, segmentControl: daySevenSegmentControl, pageControl: daySevenPageControl)
    }
    
    @IBAction func dayEightSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 8, segmentControl: dayEightSegmentControl, pageControl: dayEightPageControl)
    }
    @IBAction func dayEightPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 8, segmentControl: dayEightSegmentControl, pageControl: dayEightPageControl)
    }
    @IBAction func dayEightNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayEightPageControl.currentPage == 0 {
            dayEightPageControl.currentPage = 1
        } else if dayEightPageControl.currentPage == 1 {
            dayEightPageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 8, segmentControl: dayEightSegmentControl, pageControl: dayEightPageControl)
    }
    
    @IBAction func dayNineSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionOutlets(day: 9, segmentControl: dayNineSegmentControl, pageControl: dayNinePageControl)
    }
    @IBAction func dayNinePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionOutlets(day: 9, segmentControl: dayNineSegmentControl, pageControl: dayNinePageControl)
    }
    @IBAction func dayNineNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayNinePageControl.currentPage == 0 {
            dayNinePageControl.currentPage = 1
        } else if dayNinePageControl.currentPage == 1 {
            dayNinePageControl.currentPage = 0
        }
        setHourlyConditionOutlets(day: 9, segmentControl: dayNineSegmentControl, pageControl: dayNinePageControl)
    }
    
    // MARK: - Action to show extended daily forecasts
    func setupDayStackView(stackview: UIStackView, day: Int, segmentControl: UISegmentedControl!, pageControl: UIPageControl!) {
        if stackview.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                stackview.isHidden = false
                if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Precip") == true {
                    segmentControl.selectedSegmentIndex = 0
                } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Temp") == true {
                    segmentControl.selectedSegmentIndex = 1
                } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Humidity") == true {
                    segmentControl.selectedSegmentIndex = 2
                } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Index") == true {
                    segmentControl.selectedSegmentIndex = 3
                } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Wind") == true {
                    segmentControl.selectedSegmentIndex = 4
                } else if (defaults.string(forKey: "defaultHourlyCondition"))?.contains("Cloud") == true {
                    segmentControl.selectedSegmentIndex = 5
                }
                self.setHourlyConditionOutlets(day: day,segmentControl: segmentControl, pageControl: pageControl)
            }
        } else {
            stackview.isHidden = true
        }
        self.setDayLabels()
    }
    
    @IBAction func dayZeroGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayZeroStackView, day: 0, segmentControl: dayZeroSegmentControl, pageControl: dayZeroPageControl)
    }
    @IBAction func dayOneGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayOneStackView, day: 1, segmentControl: dayOneSegmentControl, pageControl: dayOnePageControl)
    }
    @IBAction func dayTwoGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayTwoStackView, day: 2, segmentControl: dayTwoSegmentControl, pageControl: dayTwoPageControl)
    }
    @IBAction func dayThreeGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayThreeStackView, day: 3, segmentControl: dayThreeSegmentControl, pageControl: dayThreePageControl)
    }
    @IBAction func dayFourGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayFourStackView, day: 4, segmentControl: dayFourSegmentControl, pageControl: dayFourPageControl)
    }
    @IBAction func dayFiveGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayFiveStackView, day: 5, segmentControl: dayFiveSegmentControl, pageControl: dayFivePageControl)
    }
    @IBAction func daySixGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: daySixStackView, day: 6, segmentControl: daySixSegmentControl, pageControl: daySixPageControl)
    }
    @IBAction func daySevenGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: daySevenStackView, day: 7, segmentControl: daySevenSegmentControl, pageControl: daySevenPageControl)
    }
    @IBAction func dayEightGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayEightStackView, day: 8, segmentControl: dayEightSegmentControl, pageControl: dayEightPageControl)
    }
    @IBAction func dayNineGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayNineStackView, day: 9, segmentControl: dayNineSegmentControl, pageControl: dayNinePageControl)
    }
    
    // MARK: - Set current condition labels
    func setCurrentConditionLabels() {
        // Set temperature image and label
        currentConditionTemperatureLabel.text = "Temperature \n\(highTemperature)°/\(lowTemperature)°"
        if defaults.bool(forKey: "weatherUnitsUSA") == true {
            if currentTemperature >= 80 {
                currentConditionTemperatureButton.setBackgroundImage(UIImage(named: "Temperature high.pdf"), for: .normal)
            } else if currentTemperature < 80 && currentTemperature >= 50 {
                currentConditionTemperatureButton.setBackgroundImage(UIImage(named: "Temperature moderate.pdf"), for: .normal)
            } else if currentTemperature < 50 {
                currentConditionTemperatureButton.setBackgroundImage(UIImage(named: "Temperature low.pdf"), for: .normal)
            }
        } else {
            if currentTemperature >= 26 {
                currentConditionTemperatureButton.setBackgroundImage(UIImage(named: "Temperature high.pdf"), for: .normal)
            } else if currentTemperature < 26 && currentTemperature >= 10 {
                currentConditionTemperatureButton.setBackgroundImage(UIImage(named: "Temperature moderate.pdf"), for: .normal)
            } else if currentTemperature < 10 {
                currentConditionTemperatureButton.setBackgroundImage(UIImage(named: "Temperature low.pdf"), for: .normal)
            }
        }
        
        // Check for current precipitation
        if minuteSummary.isEmpty == false && minuteSummary != "none" {
            // Check if there is current precipitation
            if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                currentConditonLabel.text = "\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
            }
        }
        
        // Set precipitation
        currentConditionPrecipButton.setTitle("\(precipitation)", for: .normal)
        if precipitation == 0 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "0 Oval.pdf"), for: .normal)
        } else if precipitation > 0 && precipitation <= 10 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "0to10 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation > 10 && precipitation < 25 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "10to25 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation == 25 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "25 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation > 25 && precipitation < 50 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "25to40 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation == 50 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "50 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation > 50 && precipitation < 75 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "50to75 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation == 75 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "75 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation > 75 && precipitation < 90 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "75to90 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation >= 90 && precipitation < 100 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "90to100 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipitation == 100 {
            currentConditionPrecipButton.setBackgroundImage(UIImage(named: "100 Oval \(buttonColor).pdf"), for: .normal)
        }
        
        // Set precipitation accumulation
        currentConditionAccumulationButton.setTitle("\(precipAccumulation)", for: .normal)
        if precipAccumulation == 0 {
            currentConditionAccumulationButton.setTitle("0", for: .normal)
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "0 Oval.pdf"), for: .normal)
        } else if precipAccumulation > 0 && precipAccumulation <= 10 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "0to10 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation > 10 && precipAccumulation < 25 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "10to25 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation == 25 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "25 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation > 25 && precipAccumulation < 50 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "25to40 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation == 50 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "50 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation > 50 && precipAccumulation < 75 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "50to75 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation == 75 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "75 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation > 75 && precipAccumulation < 90 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "75to90 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation >= 90 && precipAccumulation < 100 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "90to100 Oval \(buttonColor).pdf"), for: .normal)
        } else if precipAccumulation == 100 {
            currentConditionAccumulationButton.setBackgroundImage(UIImage(named: "100 Oval \(buttonColor).pdf"), for: .normal)
        }
        
        // Set humidity
        currentConditionHumidityButton.setTitle("\(humidity)", for: .normal)
        if humidity == 0 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "0 Oval.pdf"), for: .normal)
        } else if humidity > 0 && humidity <= 10 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "0to10 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity > 10 && humidity < 25 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "10to25 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity == 25 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "25 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity > 25 && humidity < 50 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "25to40 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity == 50 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "50 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity > 50 && humidity < 75 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "50to75 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity == 75 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "75 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity > 75 && humidity < 90 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "75to90 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity >= 90 && humidity < 100 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "90to100 Oval \(buttonColor).pdf"), for: .normal)
        } else if humidity == 100 {
            currentConditionHumidityButton.setBackgroundImage(UIImage(named: "100 Oval \(buttonColor).pdf"), for: .normal)
        }
        
        // Set wind image and label
        currentConditionWindLabel.text = "Wind \n\(wind)(\(windGust)) \(unitsWindSpeed) \(windDirectionString)"
        if windDirectionString.contains("N") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind N.pdf"), for: .normal)
        }
        if windDirectionString.contains("NE") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind NE.pdf"), for: .normal)
        }
        if windDirectionString.contains("E") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind E.pdf"), for: .normal)
        }
        if windDirectionString.contains("SE") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind NE.pdf"), for: .normal)
        }
        if windDirectionString.contains("S") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind S.pdf"), for: .normal)
        }
        if windDirectionString.contains("SW") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind SW.pdf"), for: .normal)
        }
        if windDirectionString.contains("W") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind W.pdf"), for: .normal)
        }
        if windDirectionString.contains("NW") {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind NW.pdf"), for: .normal)
        } else {
            currentConditionWindButton.setBackgroundImage(UIImage(named: "Wind SW.pdf"), for: .normal)
        }
        
        // Set uv index
        currentConditionUVIndexButton.setTitle("\(uvIndex)", for: .normal)
        if uvIndex <= 2 {
            currentConditionUVIndexButton.setBackgroundImage(UIImage(named: "UV Index low.pdf"), for: .normal)
        } else if uvIndex >= 3 && uvIndex <= 5 {
            currentConditionUVIndexButton.setBackgroundImage(UIImage(named: "UV Index moderate.pdf"), for: .normal)
        } else if uvIndex >= 6 && uvIndex <= 7 {
            currentConditionUVIndexButton.setBackgroundImage(UIImage(named: "UV Index high.pdf"), for: .normal)
        } else if uvIndex >= 8 && uvIndex <= 10 {
            currentConditionUVIndexButton.setBackgroundImage(UIImage(named: "UV Index very high.pdf"), for: .normal)
        } else if uvIndex >= 11 {
            currentConditionUVIndexButton.setBackgroundImage(UIImage(named: "UV Index extreme.pdf"), for: .normal)
        } else {
            currentConditionUVIndexButton.setBackgroundImage(UIImage(named: "UV Index low.pdf"), for: .normal)
        }
        
        // If visibility is within 1 drop last character
        if visibility == 1 {
            unitsDistance = String(unitsDistance.dropLast())
            currentConditionVisibilityLabel.text = "Visibility \n\(visibility) \(unitsDistance)"
        } else {
            currentConditionVisibilityLabel.text = "Visibility \n\(visibility) \(unitsDistance)"
        }
        currentConditionVisibilityButton.setBackgroundImage(UIImage(named: "Visibility.pdf"), for: .normal)

        // Set cloud cover image and label
        currentConditionCloudCoverButton.setBackgroundImage(UIImage(named: "Cloud cover.pdf"), for: .normal)
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            currentConditionCloudCoverLabel.text = "Cloud cover \(cloudCover)% decreasing"
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            currentConditionCloudCoverLabel.text = "Cloud cover \(cloudCover)% increasing"
        } else {
            currentConditionCloudCoverLabel.text = "Cloud cover \n\(cloudCover)%"
        }

        // Set sunrise/sunset image and label
        currentConditionSunriseLabel.text = "Sunrise \(sunrise) \nSunset \(sunset)"
        currentConditionSunriseButton.setBackgroundImage(UIImage(named: "Sunrise&Sunset.pdf"), for: .normal)

        // Set moonphase image and label
        currentConditionMoonPhaseLabel.text = "Moon phase \n\(dayZeroMoonPhaseString.lowercased())"
        if dayZeroMoonPhaseString == "New moon" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "New Moon.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "Waxing crescent" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "Waxing Crescent.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "First quarter" {
        currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "First Quarter.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "Waxing gibbous" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "Waxing Gibbous.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "Full moon" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "Full Moon.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "Waning gibbous" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "Waning Gibbous.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "Last quarter" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "Last Quarter.pdf"), for: .normal)
        } else if dayZeroMoonPhaseString == "Waning crescent" {
            currentConditionMoonPhaseButton.setBackgroundImage(UIImage(named: "Waning Crescent.pdf"), for: .normal)
        }
    }
    
    // MARK: - Set weather data labels
    func setWeatherDataLabels() {
        setCurrentConditionLabels()
        setDayLabels()
        setDailyConditionImages()
        
        // Check for default hourly condition value
        setHourlyConditionOutlets(day: 14, segmentControl: hourlySegmentControl, pageControl: hourlyPageControl)
        
        // Check if summaries are equal for the hour
        if currentSummary == hourSummary {
            currentSummary = "\(hourSummary.capitalizingFirstLetter()) for the hour."
        }
        
        currentTemperatureLabel.text = "\(currentTemperature)°"
        apparentTemperatureLabel.text = "Feels like \(apparentTemperature)°"
        currentConditonLabel.text = "\(currentSummary.capitalizingFirstLetter())"
        currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image"))
        
        // If alert is active show button
        if alertTitle.isEmpty == false {
            weatherAlertsButton.isHidden = false
            currentConditionTopConstraint.constant = 20
            // Check number of active alerts
            if alertCount > 1 {
                weatherAlertsButton.setTitle("\(alertTitle) | +\(alertCount)", for: .normal)
            } else {
                weatherAlertsButton.setTitle("\(alertTitle)!", for: .normal)
            }
            weatherAlertsButton.setTitleColor(alertColor, for: .normal)
        } else {
            weatherAlertsButton.isHidden = true
            currentConditionTopConstraint.constant = -20
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
