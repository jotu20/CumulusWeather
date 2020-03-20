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

class WeatherViewController: UIViewController, CLLocationManagerDelegate, UITabBarControllerDelegate {
    
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
    
    // Day Ten
    @IBOutlet weak var dayTenTopStackView: UIStackView!
    @IBOutlet weak var dayTenStackView: UIStackView!
    
    // Day Eleven
    @IBOutlet weak var dayElevenTopStackView: UIStackView!
    @IBOutlet weak var dayElevenStackView: UIStackView!
    
    // Day Twelve
    @IBOutlet weak var dayTwelveTopStackView: UIStackView!
    @IBOutlet weak var dayTwelveStackView: UIStackView!
    
    // Day Thirteen
    @IBOutlet weak var dayThirteenTopStackView: UIStackView!
    @IBOutlet weak var dayThirteenStackView: UIStackView!
    
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
    @IBOutlet var dayTenTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayElevenTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayTwelveTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayThirteenTapGesture: UITapGestureRecognizer!
    
    // MARK: - Current conditions outlets
    @IBOutlet weak var currentCondition1Image: UIImageView!
    @IBOutlet weak var currentCondition2Image: UIImageView!
    @IBOutlet weak var currentCondition3Image: UIImageView!
    @IBOutlet weak var currentCondition4Image: UIImageView!
    @IBOutlet weak var currentCondition5Image: UIImageView!
    @IBOutlet weak var currentCondition6ImageButton: UIButton!
    @IBOutlet weak var currentCondition7Image: UIImageView!
    @IBOutlet weak var currentCondition8Image: UIImageView!
    @IBOutlet weak var currentCondition9Image: UIImageView!
    @IBOutlet weak var currentCondition10Image: UIImageView!
    
    @IBOutlet weak var currentCondition1Label: UILabel!
    @IBOutlet weak var currentCondition2Label: UILabel!
    @IBOutlet weak var currentCondition3Label: UILabel!
    @IBOutlet weak var currentCondition4Label: UILabel!
    @IBOutlet weak var currentCondition5Label: UILabel!
    @IBOutlet weak var currentCondition6Label: UILabel!
    @IBOutlet weak var currentCondition7Label: UILabel!
    @IBOutlet weak var currentCondition8Label: UILabel!
    @IBOutlet weak var currentCondition9Label: UILabel!
    @IBOutlet weak var currentCondition10Label: UILabel!
    
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
    
    // MARK: - Day Ten outlets
    @IBOutlet weak var dayTenDay: UILabel!
    @IBOutlet weak var dayTenHighLow: UILabel!
    @IBOutlet weak var dayTenPrecipitation: UILabel!
    @IBOutlet weak var dayTenSummary: UITextView!
    @IBOutlet weak var dayTenCondition: UIImageView!
    @IBOutlet weak var dayTenForecastBar: UIImageView!
    
    @IBOutlet weak var dayTenSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayTenPageControl: UIPageControl!
    
    @IBOutlet weak var dayTenHour0Condition: UIImageView!
    @IBOutlet weak var dayTenHour0ValueText: UILabel!
    @IBOutlet weak var dayTenHour0Image: UIImageView!
    @IBOutlet weak var dayTenHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour0Time: UILabel!
    
    @IBOutlet weak var dayTenHour1Condition: UIImageView!
    @IBOutlet weak var dayTenHour1ValueText: UILabel!
    @IBOutlet weak var dayTenHour1Image: UIImageView!
    @IBOutlet weak var dayTenHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour1Time: UILabel!
    
    @IBOutlet weak var dayTenHour2Condition: UIImageView!
    @IBOutlet weak var dayTenHour2ValueText: UILabel!
    @IBOutlet weak var dayTenHour2Image: UIImageView!
    @IBOutlet weak var dayTenHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour2Time: UILabel!
    
    @IBOutlet weak var dayTenHour3Condition: UIImageView!
    @IBOutlet weak var dayTenHour3ValueText: UILabel!
    @IBOutlet weak var dayTenHour3Image: UIImageView!
    @IBOutlet weak var dayTenHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour3Time: UILabel!
    
    @IBOutlet weak var dayTenHour4Condition: UIImageView!
    @IBOutlet weak var dayTenHour4ValueText: UILabel!
    @IBOutlet weak var dayTenHour4Image: UIImageView!
    @IBOutlet weak var dayTenHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour4Time: UILabel!
    
    @IBOutlet weak var dayTenHour5Condition: UIImageView!
    @IBOutlet weak var dayTenHour5ValueText: UILabel!
    @IBOutlet weak var dayTenHour5Image: UIImageView!
    @IBOutlet weak var dayTenHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour5Time: UILabel!
    
    @IBOutlet weak var dayTenHour6Condition: UIImageView!
    @IBOutlet weak var dayTenHour6ValueText: UILabel!
    @IBOutlet weak var dayTenHour6Image: UIImageView!
    @IBOutlet weak var dayTenHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour6Time: UILabel!
    
    @IBOutlet weak var dayTenHour7Condition: UIImageView!
    @IBOutlet weak var dayTenHour7ValueText: UILabel!
    @IBOutlet weak var dayTenHour7Image: UIImageView!
    @IBOutlet weak var dayTenHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTenHour7Time: UILabel!
    
    // MARK: - Day Eleven outlets
    @IBOutlet weak var dayElevenDay: UILabel!
    @IBOutlet weak var dayElevenHighLow: UILabel!
    @IBOutlet weak var dayElevenPrecipitation: UILabel!
    @IBOutlet weak var dayElevenSummary: UITextView!
    @IBOutlet weak var dayElevenCondition: UIImageView!
    @IBOutlet weak var dayElevenForecastBar: UIImageView!
    
    @IBOutlet weak var dayElevenSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayElevenPageControl: UIPageControl!
    
    @IBOutlet weak var dayElevenHour0Condition: UIImageView!
    @IBOutlet weak var dayElevenHour0ValueText: UILabel!
    @IBOutlet weak var dayElevenHour0Image: UIImageView!
    @IBOutlet weak var dayElevenHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour0Time: UILabel!
    
    @IBOutlet weak var dayElevenHour1Condition: UIImageView!
    @IBOutlet weak var dayElevenHour1ValueText: UILabel!
    @IBOutlet weak var dayElevenHour1Image: UIImageView!
    @IBOutlet weak var dayElevenHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour1Time: UILabel!
    
    @IBOutlet weak var dayElevenHour2Condition: UIImageView!
    @IBOutlet weak var dayElevenHour2ValueText: UILabel!
    @IBOutlet weak var dayElevenHour2Image: UIImageView!
    @IBOutlet weak var dayElevenHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour2Time: UILabel!
    
    @IBOutlet weak var dayElevenHour3Condition: UIImageView!
    @IBOutlet weak var dayElevenHour3ValueText: UILabel!
    @IBOutlet weak var dayElevenHour3Image: UIImageView!
    @IBOutlet weak var dayElevenHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour3Time: UILabel!
    
    @IBOutlet weak var dayElevenHour4Condition: UIImageView!
    @IBOutlet weak var dayElevenHour4ValueText: UILabel!
    @IBOutlet weak var dayElevenHour4Image: UIImageView!
    @IBOutlet weak var dayElevenHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour4Time: UILabel!
    
    @IBOutlet weak var dayElevenHour5Condition: UIImageView!
    @IBOutlet weak var dayElevenHour5ValueText: UILabel!
    @IBOutlet weak var dayElevenHour5Image: UIImageView!
    @IBOutlet weak var dayElevenHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour5Time: UILabel!
    
    @IBOutlet weak var dayElevenHour6Condition: UIImageView!
    @IBOutlet weak var dayElevenHour6ValueText: UILabel!
    @IBOutlet weak var dayElevenHour6Image: UIImageView!
    @IBOutlet weak var dayElevenHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour6Time: UILabel!
    
    @IBOutlet weak var dayElevenHour7Condition: UIImageView!
    @IBOutlet weak var dayElevenHour7ValueText: UILabel!
    @IBOutlet weak var dayElevenHour7Image: UIImageView!
    @IBOutlet weak var dayElevenHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayElevenHour7Time: UILabel!
    
    // MARK: - Day Twelve outlets
    @IBOutlet weak var dayTwelveDay: UILabel!
    @IBOutlet weak var dayTwelveHighLow: UILabel!
    @IBOutlet weak var dayTwelvePrecipitation: UILabel!
    @IBOutlet weak var dayTwelveSummary: UITextView!
    @IBOutlet weak var dayTwelveCondition: UIImageView!
    @IBOutlet weak var dayTwelveForecastBar: UIImageView!
    
    @IBOutlet weak var dayTwelveSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayTwelvePageControl: UIPageControl!
    
    @IBOutlet weak var dayTwelveHour0Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour0ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour0Image: UIImageView!
    @IBOutlet weak var dayTwelveHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour0Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour1Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour1ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour1Image: UIImageView!
    @IBOutlet weak var dayTwelveHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour1Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour2Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour2ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour2Image: UIImageView!
    @IBOutlet weak var dayTwelveHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour2Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour3Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour3ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour3Image: UIImageView!
    @IBOutlet weak var dayTwelveHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour3Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour4Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour4ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour4Image: UIImageView!
    @IBOutlet weak var dayTwelveHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour4Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour5Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour5ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour5Image: UIImageView!
    @IBOutlet weak var dayTwelveHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour5Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour6Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour6ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour6Image: UIImageView!
    @IBOutlet weak var dayTwelveHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour6Time: UILabel!
    
    @IBOutlet weak var dayTwelveHour7Condition: UIImageView!
    @IBOutlet weak var dayTwelveHour7ValueText: UILabel!
    @IBOutlet weak var dayTwelveHour7Image: UIImageView!
    @IBOutlet weak var dayTwelveHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveHour7Time: UILabel!
    
    // MARK: - Day Thirteen outlets
    @IBOutlet weak var dayThirteenDay: UILabel!
    @IBOutlet weak var dayThirteenHighLow: UILabel!
    @IBOutlet weak var dayThirteenPrecipitation: UILabel!
    @IBOutlet weak var dayThirteenSummary: UITextView!
    @IBOutlet weak var dayThirteenCondition: UIImageView!
    @IBOutlet weak var dayThirteenForecastBar: UIImageView!
    
    @IBOutlet weak var dayThirteenSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayThirteenPageControl: UIPageControl!
    
    @IBOutlet weak var dayThirteenHour0Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour0ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour0Image: UIImageView!
    @IBOutlet weak var dayThirteenHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour0Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour1Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour1ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour1Image: UIImageView!
    @IBOutlet weak var dayThirteenHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour1Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour2Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour2ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour2Image: UIImageView!
    @IBOutlet weak var dayThirteenHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour2Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour3Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour3ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour3Image: UIImageView!
    @IBOutlet weak var dayThirteenHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour3Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour4Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour4ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour4Image: UIImageView!
    @IBOutlet weak var dayThirteenHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour4Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour5Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour5ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour5Image: UIImageView!
    @IBOutlet weak var dayThirteenHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour5Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour6Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour6ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour6Image: UIImageView!
    @IBOutlet weak var dayThirteenHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour6Time: UILabel!
    
    @IBOutlet weak var dayThirteenHour7Condition: UIImageView!
    @IBOutlet weak var dayThirteenHour7ValueText: UILabel!
    @IBOutlet weak var dayThirteenHour7Image: UIImageView!
    @IBOutlet weak var dayThirteenHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenHour7Time: UILabel!
    
    // MARK: - General constraints
    @IBOutlet weak var daysStackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var nextDaysLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var dailyStackViewBottom: NSLayoutConstraint!
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
    
    @IBOutlet weak var dayTenHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTenPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTenSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTenBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayElevenHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayElevenPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayElevenSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayElevenBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayTwelveHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwelvePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwelveBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayThirteenHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThirteenBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var detailsLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var nextHoursLabelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var currentConditionStackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition1LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition2LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition3LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition4LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition5LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition6LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition7LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition8LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition9LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition10LabelWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        locationManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        setupInitialData()
        setupInitialLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            if currentSummary.isEmpty == false {
                self.locationManager.stopUpdatingLocation()
            }
        }
        
        // Check for loaded weather, distance change, or color theme change
        if weatherLoaded == false || distanceChange == true || dataSourceChanged == true {
            loadingScreen()
        }
        
        // Check for units or clock change
        if unitsChanged == true || clockChanged == true {
            loadingScreen()
            unitsChanged = false
            clockChanged = false
        }
        
        // If user has viewed 10 times request review
        defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
        if defaults.integer(forKey: "userViewedCounter") == 10 {
            SKStoreReviewController.requestReview()
        }
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            if defaults.bool(forKey: "cumulusPro") == false {
                dailyStackViewBottom.constant = 85
            } else {
                dailyStackViewBottom.constant = 25
            }
        } else if screenHeight == 667 {
            // iPhone 8
            if defaults.bool(forKey: "cumulusPro") == false {
                dailyStackViewBottom.constant = 85
            } else {
                dailyStackViewBottom.constant = 25
            }
        } else if screenHeight == 736 {
            // iPhone Plus
            dailyStackViewBottom.constant = 95
        } else if screenHeight == 812 {
            // iPhone XS
            dailyStackViewBottom.constant = 110
        } else if screenHeight == 896 {
            // iPhone XR & XS Max
            dailyStackViewBottom.constant = 195
        } else if screenHeight == 1024 {
            // iPad 9.7"
            dailyStackViewBottom.constant = 275
        } else if screenHeight == 1112 {
            // iPad 10.5"
            dailyStackViewBottom.constant = 360
        } else if screenHeight == 1194 {
            // iPad 11"
            dailyStackViewBottom.constant = 430
        } else if screenHeight == 1366 {
            // iPad 12.9"
            dailyStackViewBottom.constant = 600
        }
        
        // Setup for pull to refresh
        scrollView.alwaysBounceVertical = true
        scrollView.bounces  = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
    }
    
    // MARK: - Action to scroll to top
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 0 {
            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
        }
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
        DispatchQueue.main.async {
            self.setWeatherDataLabels()
            self.setupObjectColors()
            self.setupConstraints()
        }
    }
    
    // MARK: Intial load of weather data
    func setupInitialData() {
        if (defaults.string(forKey: "dataSource")?.contains("Dark Sky") == true) {
            fetchDarkSkyWeatherData()
        } else {
            fetchDarkSkyWeatherData()
            defaults.set("Dark Sky", forKey: "dataSource")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Dark Sky", forKey: "setDataSource")
        }
        self.setWeatherDataLabels()
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
        dayTenTopStackView.spacing = spacing
        dayElevenTopStackView.spacing = spacing
        dayTwelveTopStackView.spacing = spacing
        dayThirteenTopStackView.spacing = spacing
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
            
            currentCondition1LabelWidth.constant = 110
            currentCondition2LabelWidth.constant = 110
            currentCondition3LabelWidth.constant = 110
            currentCondition4LabelWidth.constant = 110
            currentCondition5LabelWidth.constant = 110
            currentCondition6LabelWidth.constant = 110
            currentCondition7LabelWidth.constant = 110
            currentCondition8LabelWidth.constant = 110
            currentCondition9LabelWidth.constant = 110
            currentCondition10LabelWidth.constant = 110
            
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
            
            dayTenHighLowWidth.constant = 101
            dayTenPrecipitationWidth.constant = 100
            dayTenSummaryWidth.constant = 300
            dayTenBarWidth.constant = 300
            
            dayElevenHighLowWidth.constant = 101
            dayElevenPrecipitationWidth.constant = 100
            dayElevenSummaryWidth.constant = 300
            dayElevenBarWidth.constant = 300
            
            dayTwelveHighLowWidth.constant = 101
            dayTwelvePrecipitationWidth.constant = 100
            dayTwelveSummaryWidth.constant = 300
            dayTwelveBarWidth.constant = 300
            
            dayThirteenHighLowWidth.constant = 101
            dayThirteenPrecipitationWidth.constant = 100
            dayThirteenSummaryWidth.constant = 300
            dayThirteenBarWidth.constant = 300
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
        dayTenStackView.isHidden = true
        dayElevenStackView.isHidden = true
        dayTwelveStackView.isHidden = true
        dayThirteenStackView.isHidden = true
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
            dayTenPageControl.currentPageIndicatorTintColor = .label
            dayElevenPageControl.currentPageIndicatorTintColor = .label
            dayTwelvePageControl.currentPageIndicatorTintColor = .label
            dayThirteenPageControl.currentPageIndicatorTintColor = .label
            
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
            dayTenPageControl.pageIndicatorTintColor = .secondaryLabel
            dayElevenPageControl.pageIndicatorTintColor = .secondaryLabel
            dayTwelvePageControl.pageIndicatorTintColor = .secondaryLabel
            dayThirteenPageControl.pageIndicatorTintColor = .secondaryLabel
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
        dayTenForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayElevenForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayTwelveForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayThirteenForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
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
        dayTenCondition.image = UIImage(named: weatherCondition(condition: weatherCondition10, type: "daily"))
        dayElevenCondition.image = UIImage(named: weatherCondition(condition: weatherCondition11, type: "daily"))
        dayTwelveCondition.image = UIImage(named: weatherCondition(condition: weatherCondition12, type: "daily"))
        dayThirteenCondition.image = UIImage(named: weatherCondition(condition: weatherCondition13, type: "daily"))
    }
    
    // Set hourly condition values for each day
    func setHourlyConditionTextForDay(day: Int) {
        if day == 0 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroPrecip0, int2: dayZeroPrecip1, int3: dayZeroPrecip2, int4: dayZeroPrecip3, int5: dayZeroPrecip4, int6: dayZeroPrecip5, int7: dayZeroPrecip6, int8: dayZeroPrecip7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroPrecip8, int2: dayZeroPrecip9, int3: dayZeroPrecip10, int4: dayZeroPrecip11, int5: dayZeroPrecip12, int6: dayZeroPrecip13, int7: dayZeroPrecip14, int8: dayZeroPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroTemp0, int2: dayZeroTemp1, int3: dayZeroTemp2, int4: dayZeroTemp3, int5: dayZeroTemp4, int6: dayZeroTemp5, int7: dayZeroTemp6, int8: dayZeroTemp7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroTemp8, int2: dayZeroTemp9, int3: dayZeroTemp10, int4: dayZeroTemp11, int5: dayZeroTemp12, int6: dayZeroTemp13, int7: dayZeroTemp14, int8: dayZeroTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroHumidity0, int2: dayZeroHumidity1, int3: dayZeroHumidity2, int4: dayZeroHumidity3, int5: dayZeroHumidity4, int6: dayZeroHumidity5, int7: dayZeroHumidity6, int8: dayZeroHumidity7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroHumidity8, int2: dayZeroHumidity9, int3: dayZeroHumidity10, int4: dayZeroHumidity11, int5: dayZeroHumidity12, int6: dayZeroHumidity13, int7: dayZeroHumidity14, int8: dayZeroHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroIndex0, int2: dayZeroIndex1, int3: dayZeroIndex2, int4: dayZeroIndex3, int5: dayZeroIndex4, int6: dayZeroIndex5, int7: dayZeroIndex6, int8: dayZeroIndex7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroIndex8, int2: dayZeroIndex9, int3: dayZeroIndex10, int4: dayZeroIndex11, int5: dayZeroIndex12, int6: dayZeroIndex13, int7: dayZeroIndex14, int8: dayZeroIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroWindSpeed0, int2: dayZeroWindSpeed1, int3: dayZeroWindSpeed2, int4: dayZeroWindSpeed3, int5: dayZeroWindSpeed4, int6: dayZeroWindSpeed5, int7: dayZeroWindSpeed6, int8: dayZeroWindSpeed7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroWindSpeed8, int2: dayZeroWindSpeed9, int3: dayZeroWindSpeed10, int4: dayZeroWindSpeed11, int5: dayZeroWindSpeed12, int6: dayZeroWindSpeed13, int7: dayZeroWindSpeed14, int8: dayZeroWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroCloudCover0, int2: dayZeroCloudCover1, int3: dayZeroCloudCover2, int4: dayZeroCloudCover3, int5: dayZeroCloudCover4, int6: dayZeroCloudCover5, int7: dayZeroCloudCover6, int8: dayZeroCloudCover7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroCloudCover8, int2: dayZeroCloudCover9, int3: dayZeroCloudCover10, int4: dayZeroCloudCover11, int5: dayZeroCloudCover12, int6: dayZeroCloudCover13, int7: dayZeroCloudCover14, int8: dayZeroCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroPrecip0, int2: dayZeroPrecip1, int3: dayZeroPrecip2, int4: dayZeroPrecip3, int5: dayZeroPrecip4, int6: dayZeroPrecip5, int7: dayZeroPrecip6, int8: dayZeroPrecip7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroPrecip8, int2: dayZeroPrecip9, int3: dayZeroPrecip10, int4: dayZeroPrecip11, int5: dayZeroPrecip12, int6: dayZeroPrecip13, int7: dayZeroPrecip14, int8: dayZeroPrecip15)
                }
            }
        } else if day == 1 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOnePrecip0, int2: dayOnePrecip1, int3: dayOnePrecip2, int4: dayOnePrecip3, int5: dayOnePrecip4, int6: dayOnePrecip5, int7: dayOnePrecip6, int8: dayOnePrecip7)
                } else {
                    completeDayOneUISetup(int1: dayOnePrecip8, int2: dayOnePrecip9, int3: dayOnePrecip10, int4: dayOnePrecip11, int5: dayOnePrecip12, int6: dayOnePrecip13, int7: dayOnePrecip14, int8: dayOnePrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneTemp0, int2: dayOneTemp1, int3: dayOneTemp2, int4: dayOneTemp3, int5: dayOneTemp4, int6: dayOneTemp5, int7: dayOneTemp6, int8: dayOneTemp7)
                } else {
                    completeDayOneUISetup(int1: dayOneTemp8, int2: dayOneTemp9, int3: dayOneTemp10, int4: dayOneTemp11, int5: dayOneTemp12, int6: dayOneTemp13, int7: dayOneTemp14, int8: dayOneTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneHumidity0, int2: dayOneHumidity1, int3: dayOneHumidity2, int4: dayOneHumidity3, int5: dayOneHumidity4, int6: dayOneHumidity5, int7: dayOneHumidity6, int8: dayOneHumidity7)
                } else {
                    completeDayOneUISetup(int1: dayOneHumidity8, int2: dayOneHumidity9, int3: dayOneHumidity10, int4: dayOneHumidity11, int5: dayOneHumidity12, int6: dayOneHumidity13, int7: dayOneHumidity14, int8: dayOneHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneIndex0, int2: dayOneIndex1, int3: dayOneIndex2, int4: dayOneIndex3, int5: dayOneIndex4, int6: dayOneIndex5, int7: dayOneIndex6, int8: dayOneIndex7)
                } else {
                    completeDayOneUISetup(int1: dayOneIndex8, int2: dayOneIndex9, int3: dayOneIndex10, int4: dayOneIndex11, int5: dayOneIndex12, int6: dayOneIndex13, int7: dayOneIndex14, int8: dayOneIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneWindSpeed0, int2: dayOneWindSpeed1, int3: dayOneWindSpeed2, int4: dayOneWindSpeed3, int5: dayOneWindSpeed4, int6: dayOneWindSpeed5, int7: dayOneWindSpeed6, int8: dayOneWindSpeed7)
                } else {
                    completeDayOneUISetup(int1: dayOneWindSpeed8, int2: dayOneWindSpeed9, int3: dayOneWindSpeed10, int4: dayOneWindSpeed11, int5: dayOneWindSpeed12, int6: dayOneWindSpeed13, int7: dayOneWindSpeed14, int8: dayOneWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneCloudCover0, int2: dayOneCloudCover1, int3: dayOneCloudCover2, int4: dayOneCloudCover3, int5: dayOneCloudCover4, int6: dayOneCloudCover5, int7: dayOneCloudCover6, int8: dayOneCloudCover7)
                } else {
                    completeDayOneUISetup(int1: dayOneCloudCover8, int2: dayOneCloudCover9, int3: dayOneCloudCover10, int4: dayOneCloudCover11, int5: dayOneCloudCover12, int6: dayOneCloudCover13, int7: dayOneCloudCover14, int8: dayOneCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOnePrecip0, int2: dayOnePrecip1, int3: dayOnePrecip2, int4: dayOnePrecip3, int5: dayOnePrecip4, int6: dayOnePrecip5, int7: dayOnePrecip6, int8: dayOnePrecip7)
                } else {
                    completeDayOneUISetup(int1: dayOnePrecip8, int2: dayOnePrecip9, int3: dayOnePrecip10, int4: dayOnePrecip11, int5: dayOnePrecip12, int6: dayOnePrecip13, int7: dayOnePrecip14, int8: dayOnePrecip15)
                }
            }
        } else if day == 2 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoPrecip0, int2: dayTwoPrecip1, int3: dayTwoPrecip2, int4: dayTwoPrecip3, int5: dayTwoPrecip4, int6: dayTwoPrecip5, int7: dayTwoPrecip6, int8: dayTwoPrecip7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoPrecip8, int2: dayTwoPrecip9, int3: dayTwoPrecip10, int4: dayTwoPrecip11, int5: dayTwoPrecip12, int6: dayTwoPrecip13, int7: dayTwoPrecip14, int8: dayTwoPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoTemp0, int2: dayTwoTemp1, int3: dayTwoTemp2, int4: dayTwoTemp3, int5: dayTwoTemp4, int6: dayTwoTemp5, int7: dayTwoTemp6, int8: dayTwoTemp7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoTemp8, int2: dayTwoTemp9, int3: dayTwoTemp10, int4: dayTwoTemp11, int5: dayTwoTemp12, int6: dayTwoTemp13, int7: dayTwoTemp14, int8: dayTwoTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoHumidity0, int2: dayTwoHumidity1, int3: dayTwoHumidity2, int4: dayTwoHumidity3, int5: dayTwoHumidity4, int6: dayTwoHumidity5, int7: dayTwoHumidity6, int8: dayTwoHumidity7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoHumidity8, int2: dayTwoHumidity9, int3: dayTwoHumidity10, int4: dayTwoHumidity11, int5: dayTwoHumidity12, int6: dayTwoHumidity13, int7: dayTwoHumidity14, int8: dayTwoHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoIndex0, int2: dayTwoIndex1, int3: dayTwoIndex2, int4: dayTwoIndex3, int5: dayTwoIndex4, int6: dayTwoIndex5, int7: dayTwoIndex6, int8: dayTwoIndex7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoIndex8, int2: dayTwoIndex9, int3: dayTwoIndex10, int4: dayTwoIndex11, int5: dayTwoIndex12, int6: dayTwoIndex13, int7: dayTwoIndex14, int8: dayTwoIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoWindSpeed0, int2: dayTwoWindSpeed1, int3: dayTwoWindSpeed2, int4: dayTwoWindSpeed3, int5: dayTwoWindSpeed4, int6: dayTwoWindSpeed5, int7: dayTwoWindSpeed6, int8: dayTwoWindSpeed7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoWindSpeed8, int2: dayTwoWindSpeed9, int3: dayTwoWindSpeed10, int4: dayTwoWindSpeed11, int5: dayTwoWindSpeed12, int6: dayTwoWindSpeed13, int7: dayTwoWindSpeed14, int8: dayTwoWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoCloudCover0, int2: dayTwoCloudCover1, int3: dayTwoCloudCover2, int4: dayTwoCloudCover3, int5: dayTwoCloudCover4, int6: dayTwoCloudCover5, int7: dayTwoCloudCover6, int8: dayTwoCloudCover7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoCloudCover8, int2: dayTwoCloudCover9, int3: dayTwoCloudCover10, int4: dayTwoCloudCover11, int5: dayTwoCloudCover12, int6: dayTwoCloudCover13, int7: dayTwoCloudCover14, int8: dayTwoCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoPrecip0, int2: dayTwoPrecip1, int3: dayTwoPrecip2, int4: dayTwoPrecip3, int5: dayTwoPrecip4, int6: dayTwoPrecip5, int7: dayTwoPrecip6, int8: dayTwoPrecip7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoPrecip8, int2: dayTwoPrecip9, int3: dayTwoPrecip10, int4: dayTwoPrecip11, int5: dayTwoPrecip12, int6: dayTwoPrecip13, int7: dayTwoPrecip14, int8: dayTwoPrecip15)
                }
            }
        } else if day == 3 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreePrecip0, int2: dayThreePrecip1, int3: dayThreePrecip2, int4: dayThreePrecip3, int5: dayThreePrecip4, int6: dayThreePrecip5, int7: dayThreePrecip6, int8: dayThreePrecip7)
                } else {
                    completeDayThreeUISetup(int1: dayThreePrecip8, int2: dayThreePrecip9, int3: dayThreePrecip10, int4: dayThreePrecip11, int5: dayThreePrecip12, int6: dayThreePrecip13, int7: dayThreePrecip14, int8: dayThreePrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeTemp0, int2: dayThreeTemp1, int3: dayThreeTemp2, int4: dayThreeTemp3, int5: dayThreeTemp4, int6: dayThreeTemp5, int7: dayThreeTemp6, int8: dayThreeTemp7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeTemp8, int2: dayThreeTemp9, int3: dayThreeTemp10, int4: dayThreeTemp11, int5: dayThreeTemp12, int6: dayThreeTemp13, int7: dayThreeTemp14, int8: dayThreeTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeHumidity0, int2: dayThreeHumidity1, int3: dayThreeHumidity2, int4: dayThreeHumidity3, int5: dayThreeHumidity4, int6: dayThreeHumidity5, int7: dayThreeHumidity6, int8: dayThreeHumidity7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeHumidity8, int2: dayThreeHumidity9, int3: dayThreeHumidity10, int4: dayThreeHumidity11, int5: dayThreeHumidity12, int6: dayThreeHumidity13, int7: dayThreeHumidity14, int8: dayThreeHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeIndex0, int2: dayThreeIndex1, int3: dayThreeIndex2, int4: dayThreeIndex3, int5: dayThreeIndex4, int6: dayThreeIndex5, int7: dayThreeIndex6, int8: dayThreeIndex7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeIndex8, int2: dayThreeIndex9, int3: dayThreeIndex10, int4: dayThreeIndex11, int5: dayThreeIndex12, int6: dayThreeIndex13, int7: dayThreeIndex14, int8: dayThreeIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeWindSpeed0, int2: dayThreeWindSpeed1, int3: dayThreeWindSpeed2, int4: dayThreeWindSpeed3, int5: dayThreeWindSpeed4, int6: dayThreeWindSpeed5, int7: dayThreeWindSpeed6, int8: dayThreeWindSpeed7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeWindSpeed8, int2: dayThreeWindSpeed9, int3: dayThreeWindSpeed10, int4: dayThreeWindSpeed11, int5: dayThreeWindSpeed12, int6: dayThreeWindSpeed13, int7: dayThreeWindSpeed14, int8: dayThreeWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeCloudCover0, int2: dayThreeCloudCover1, int3: dayThreeCloudCover2, int4: dayThreeCloudCover3, int5: dayThreeCloudCover4, int6: dayThreeCloudCover5, int7: dayThreeCloudCover6, int8: dayThreeCloudCover7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeCloudCover8, int2: dayThreeCloudCover9, int3: dayThreeCloudCover10, int4: dayThreeCloudCover11, int5: dayThreeCloudCover12, int6: dayThreeCloudCover13, int7: dayThreeCloudCover14, int8: dayThreeCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreePrecip0, int2: dayThreePrecip1, int3: dayThreePrecip2, int4: dayThreePrecip3, int5: dayThreePrecip4, int6: dayThreePrecip5, int7: dayThreePrecip6, int8: dayThreePrecip7)
                } else {
                    completeDayThreeUISetup(int1: dayThreePrecip8, int2: dayThreePrecip9, int3: dayThreePrecip10, int4: dayThreePrecip11, int5: dayThreePrecip12, int6: dayThreePrecip13, int7: dayThreePrecip14, int8: dayThreePrecip15)
                }
            }
        } else if day == 4 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourPrecip0, int2: dayFourPrecip1, int3: dayFourPrecip2, int4: dayFourPrecip3, int5: dayFourPrecip4, int6: dayFourPrecip5, int7: dayFourPrecip6, int8: dayFourPrecip7)
                } else {
                    completeDayFourUISetup(int1: dayFourPrecip8, int2: dayFourPrecip9, int3: dayFourPrecip10, int4: dayFourPrecip11, int5: dayFourPrecip12, int6: dayFourPrecip13, int7: dayFourPrecip14, int8: dayFourPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourTemp0, int2: dayFourTemp1, int3: dayFourTemp2, int4: dayFourTemp3, int5: dayFourTemp4, int6: dayFourTemp5, int7: dayFourTemp6, int8: dayFourTemp7)
                } else {
                    completeDayFourUISetup(int1: dayFourTemp8, int2: dayFourTemp9, int3: dayFourTemp10, int4: dayFourTemp11, int5: dayFourTemp12, int6: dayFourTemp13, int7: dayFourTemp14, int8: dayFourTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourHumidity0, int2: dayFourHumidity1, int3: dayFourHumidity2, int4: dayFourHumidity3, int5: dayFourHumidity4, int6: dayFourHumidity5, int7: dayFourHumidity6, int8: dayFourHumidity7)
                } else {
                    completeDayFourUISetup(int1: dayFourHumidity8, int2: dayFourHumidity9, int3: dayFourHumidity10, int4: dayFourHumidity11, int5: dayFourHumidity12, int6: dayFourHumidity13, int7: dayFourHumidity14, int8: dayFourHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourIndex0, int2: dayFourIndex1, int3: dayFourIndex2, int4: dayFourIndex3, int5: dayFourIndex4, int6: dayFourIndex5, int7: dayFourIndex6, int8: dayFourIndex7)
                } else {
                    completeDayFourUISetup(int1: dayFourIndex8, int2: dayFourIndex9, int3: dayFourIndex10, int4: dayFourIndex11, int5: dayFourIndex12, int6: dayFourIndex13, int7: dayFourIndex14, int8: dayFourIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourWindSpeed0, int2: dayFourWindSpeed1, int3: dayFourWindSpeed2, int4: dayFourWindSpeed3, int5: dayFourWindSpeed4, int6: dayFourWindSpeed5, int7: dayFourWindSpeed6, int8: dayFourWindSpeed7)
                } else {
                    completeDayFourUISetup(int1: dayFourWindSpeed8, int2: dayFourWindSpeed9, int3: dayFourWindSpeed10, int4: dayFourWindSpeed11, int5: dayFourWindSpeed12, int6: dayFourWindSpeed13, int7: dayFourWindSpeed14, int8: dayFourWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourCloudCover0, int2: dayFourCloudCover1, int3: dayFourCloudCover2, int4: dayFourCloudCover3, int5: dayFourCloudCover4, int6: dayFourCloudCover5, int7: dayFourCloudCover6, int8: dayFourCloudCover7)
                } else {
                    completeDayFourUISetup(int1: dayFourCloudCover8, int2: dayFourCloudCover9, int3: dayFourCloudCover10, int4: dayFourCloudCover11, int5: dayFourCloudCover12, int6: dayFourCloudCover13, int7: dayFourCloudCover14, int8: dayFourCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourPrecip0, int2: dayFourPrecip1, int3: dayFourPrecip2, int4: dayFourPrecip3, int5: dayFourPrecip4, int6: dayFourPrecip5, int7: dayFourPrecip6, int8: dayFourPrecip7)
                } else {
                    completeDayFourUISetup(int1: dayFourPrecip8, int2: dayFourPrecip9, int3: dayFourPrecip10, int4: dayFourPrecip11, int5: dayFourPrecip12, int6: dayFourPrecip13, int7: dayFourPrecip14, int8: dayFourPrecip15)
                }
            }
        } else if day == 5 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFivePrecip0, int2: dayFivePrecip1, int3: dayFivePrecip2, int4: dayFivePrecip3, int5: dayFivePrecip4, int6: dayFivePrecip5, int7: dayFivePrecip6, int8: dayFivePrecip7)
                } else {
                    completeDayFiveUISetup(int1: dayFivePrecip8, int2: dayFivePrecip9, int3: dayFivePrecip10, int4: dayFivePrecip11, int5: dayFivePrecip12, int6: dayFivePrecip13, int7: dayFivePrecip14, int8: dayFivePrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveTemp0, int2: dayFiveTemp1, int3: dayFiveTemp2, int4: dayFiveTemp3, int5: dayFiveTemp4, int6: dayFiveTemp5, int7: dayFiveTemp6, int8: dayFiveTemp7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveTemp8, int2: dayFiveTemp9, int3: dayFiveTemp10, int4: dayFiveTemp11, int5: dayFiveTemp12, int6: dayFiveTemp13, int7: dayFiveTemp14, int8: dayFiveTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveHumidity0, int2: dayFiveHumidity1, int3: dayFiveHumidity2, int4: dayFiveHumidity3, int5: dayFiveHumidity4, int6: dayFiveHumidity5, int7: dayFiveHumidity6, int8: dayFiveHumidity7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveHumidity8, int2: dayFiveHumidity9, int3: dayFiveHumidity10, int4: dayFiveHumidity11, int5: dayFiveHumidity12, int6: dayFiveHumidity13, int7: dayFiveHumidity14, int8: dayFiveHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveIndex0, int2: dayFiveIndex1, int3: dayFiveIndex2, int4: dayFiveIndex3, int5: dayFiveIndex4, int6: dayFiveIndex5, int7: dayFiveIndex6, int8: dayFiveIndex7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveIndex8, int2: dayFiveIndex9, int3: dayFiveIndex10, int4: dayFiveIndex11, int5: dayFiveIndex12, int6: dayFiveIndex13, int7: dayFiveIndex14, int8: dayFiveIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveWindSpeed0, int2: dayFiveWindSpeed1, int3: dayFiveWindSpeed2, int4: dayFiveWindSpeed3, int5: dayFiveWindSpeed4, int6: dayFiveWindSpeed5, int7: dayFiveWindSpeed6, int8: dayFiveWindSpeed7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveWindSpeed8, int2: dayFiveWindSpeed9, int3: dayFiveWindSpeed10, int4: dayFiveWindSpeed11, int5: dayFiveWindSpeed12, int6: dayFiveWindSpeed13, int7: dayFiveWindSpeed14, int8: dayFiveWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveCloudCover0, int2: dayFiveCloudCover1, int3: dayFiveCloudCover2, int4: dayFiveCloudCover3, int5: dayFiveCloudCover4, int6: dayFiveCloudCover5, int7: dayFiveCloudCover6, int8: dayFiveCloudCover7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveCloudCover8, int2: dayFiveCloudCover9, int3: dayFiveCloudCover10, int4: dayFiveCloudCover11, int5: dayFiveCloudCover12, int6: dayFiveCloudCover13, int7: dayFiveCloudCover14, int8: dayFiveCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFivePrecip0, int2: dayFivePrecip1, int3: dayFivePrecip2, int4: dayFivePrecip3, int5: dayFivePrecip4, int6: dayFivePrecip5, int7: dayFivePrecip6, int8: dayFivePrecip7)
                } else {
                    completeDayFiveUISetup(int1: dayFivePrecip8, int2: dayFivePrecip9, int3: dayFivePrecip10, int4: dayFivePrecip11, int5: dayFivePrecip12, int6: dayFivePrecip13, int7: dayFivePrecip14, int8: dayFivePrecip15)
                }
            }
        } else if day == 6 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixPrecip0, int2: daySixPrecip1, int3: daySixPrecip2, int4: daySixPrecip3, int5: daySixPrecip4, int6: daySixPrecip5, int7: daySixPrecip6, int8: daySixPrecip7)
                } else {
                    completeDaySixUISetup(int1: daySixPrecip8, int2: daySixPrecip9, int3: daySixPrecip10, int4: daySixPrecip11, int5: daySixPrecip12, int6: daySixPrecip13, int7: daySixPrecip14, int8: daySixPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixTemp0, int2: daySixTemp1, int3: daySixTemp2, int4: daySixTemp3, int5: daySixTemp4, int6: daySixTemp5, int7: daySixTemp6, int8: daySixTemp7)
                } else {
                    completeDaySixUISetup(int1: daySixTemp8, int2: daySixTemp9, int3: daySixTemp10, int4: daySixTemp11, int5: daySixTemp12, int6: daySixTemp13, int7: daySixTemp14, int8: daySixTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixHumidity0, int2: daySixHumidity1, int3: daySixHumidity2, int4: daySixHumidity3, int5: daySixHumidity4, int6: daySixHumidity5, int7: daySixHumidity6, int8: daySixHumidity7)
                } else {
                    completeDaySixUISetup(int1: daySixHumidity8, int2: daySixHumidity9, int3: daySixHumidity10, int4: daySixHumidity11, int5: daySixHumidity12, int6: daySixHumidity13, int7: daySixHumidity14, int8: daySixHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixIndex0, int2: daySixIndex1, int3: daySixIndex2, int4: daySixIndex3, int5: daySixIndex4, int6: daySixIndex5, int7: daySixIndex6, int8: daySixIndex7)
                } else {
                    completeDaySixUISetup(int1: daySixIndex8, int2: daySixIndex9, int3: daySixIndex10, int4: daySixIndex11, int5: daySixIndex12, int6: daySixIndex13, int7: daySixIndex14, int8: daySixIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixWindSpeed0, int2: daySixWindSpeed1, int3: daySixWindSpeed2, int4: daySixWindSpeed3, int5: daySixWindSpeed4, int6: daySixWindSpeed5, int7: daySixWindSpeed6, int8: daySixWindSpeed7)
                } else {
                    completeDaySixUISetup(int1: daySixWindSpeed8, int2: daySixWindSpeed9, int3: daySixWindSpeed10, int4: daySixWindSpeed11, int5: daySixWindSpeed12, int6: daySixWindSpeed13, int7: daySixWindSpeed14, int8: daySixWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixCloudCover0, int2: daySixCloudCover1, int3: daySixCloudCover2, int4: daySixCloudCover3, int5: daySixCloudCover4, int6: daySixCloudCover5, int7: daySixCloudCover6, int8: daySixCloudCover7)
                } else {
                    completeDaySixUISetup(int1: daySixCloudCover8, int2: daySixCloudCover9, int3: daySixCloudCover10, int4: daySixCloudCover11, int5: daySixCloudCover12, int6: daySixCloudCover13, int7: daySixCloudCover14, int8: daySixCloudCover15)
                }
            } else {
                // Default to precipitation
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixPrecip0, int2: daySixPrecip1, int3: daySixPrecip2, int4: daySixPrecip3, int5: daySixPrecip4, int6: daySixPrecip5, int7: daySixPrecip6, int8: daySixPrecip7)
                } else {
                    completeDaySixUISetup(int1: daySixPrecip8, int2: daySixPrecip9, int3: daySixPrecip10, int4: daySixPrecip11, int5: daySixPrecip12, int6: daySixPrecip13, int7: daySixPrecip14, int8: daySixPrecip15)
                }
            }
        } else if day == 7 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenPrecip0, int2: daySevenPrecip1, int3: daySevenPrecip2, int4: daySevenPrecip3, int5: daySevenPrecip4, int6: daySevenPrecip5, int7: daySevenPrecip6, int8: daySevenPrecip7)
                } else {
                    completeDaySevenUISetup(int1: daySevenPrecip8, int2: daySevenPrecip9, int3: daySevenPrecip10, int4: daySevenPrecip11, int5: daySevenPrecip12, int6: daySevenPrecip13, int7: daySevenPrecip14, int8: daySevenPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenTemp0, int2: daySevenTemp1, int3: daySevenTemp2, int4: daySevenTemp3, int5: daySevenTemp4, int6: daySevenTemp5, int7: daySevenTemp6, int8: daySevenTemp7)
                } else {
                    completeDaySevenUISetup(int1: daySevenTemp8, int2: daySevenTemp9, int3: daySevenTemp10, int4: daySevenTemp11, int5: daySevenTemp12, int6: daySevenTemp13, int7: daySevenTemp14, int8: daySevenTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenHumidity0, int2: daySevenHumidity1, int3: daySevenHumidity2, int4: daySevenHumidity3, int5: daySevenHumidity4, int6: daySevenHumidity5, int7: daySevenHumidity6, int8: daySevenHumidity7)
                } else {
                    completeDaySevenUISetup(int1: daySevenHumidity8, int2: daySevenHumidity9, int3: daySevenHumidity10, int4: daySevenHumidity11, int5: daySevenHumidity12, int6: daySevenHumidity13, int7: daySevenHumidity14, int8: daySevenHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenIndex0, int2: daySevenIndex1, int3: daySevenIndex2, int4: daySevenIndex3, int5: daySevenIndex4, int6: daySevenIndex5, int7: daySevenIndex6, int8: daySevenIndex7)
                } else {
                    completeDaySevenUISetup(int1: daySevenIndex8, int2: daySevenIndex9, int3: daySevenIndex10, int4: daySevenIndex11, int5: daySevenIndex12, int6: daySevenIndex13, int7: daySevenIndex14, int8: daySevenIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenWindSpeed0, int2: daySevenWindSpeed1, int3: daySevenWindSpeed2, int4: daySevenWindSpeed3, int5: daySevenWindSpeed4, int6: daySevenWindSpeed5, int7: daySevenWindSpeed6, int8: daySevenWindSpeed7)
                } else {
                    completeDaySevenUISetup(int1: daySevenWindSpeed8, int2: daySevenWindSpeed9, int3: daySevenWindSpeed10, int4: daySevenWindSpeed11, int5: daySevenWindSpeed12, int6: daySevenWindSpeed13, int7: daySevenWindSpeed14, int8: daySevenWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenCloudCover0, int2: daySevenCloudCover1, int3: daySevenCloudCover2, int4: daySevenCloudCover3, int5: daySevenCloudCover4, int6: daySevenCloudCover5, int7: daySevenCloudCover6, int8: daySevenCloudCover7)
                } else {
                    completeDaySevenUISetup(int1: daySevenCloudCover8, int2: daySevenCloudCover9, int3: daySevenCloudCover10, int4: daySevenCloudCover11, int5: daySevenCloudCover12, int6: daySevenCloudCover13, int7: daySevenCloudCover14, int8: daySevenCloudCover15)
                }
            } else {
                // Default to precipitation
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenPrecip0, int2: daySevenPrecip1, int3: daySevenPrecip2, int4: daySevenPrecip3, int5: daySevenPrecip4, int6: daySevenPrecip5, int7: daySevenPrecip6, int8: daySevenPrecip7)
                } else {
                    completeDaySevenUISetup(int1: daySevenPrecip8, int2: daySevenPrecip9, int3: daySevenPrecip10, int4: daySevenPrecip11, int5: daySevenPrecip12, int6: daySevenPrecip13, int7: daySevenPrecip14, int8: daySevenPrecip15)
                }
            }
        } else if day == 8 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightPrecip0, int2: dayEightPrecip1, int3: dayEightPrecip2, int4: dayEightPrecip3, int5: dayEightPrecip4, int6: dayEightPrecip5, int7: dayEightPrecip6, int8: dayEightPrecip7)
                } else {
                    completeDayEightUISetup(int1: dayEightPrecip8, int2: dayEightPrecip9, int3: dayEightPrecip10, int4: dayEightPrecip11, int5: dayEightPrecip12, int6: dayEightPrecip13, int7: dayEightPrecip14, int8: dayEightPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightTemp0, int2: dayEightTemp1, int3: dayEightTemp2, int4: dayEightTemp3, int5: dayEightTemp4, int6: dayEightTemp5, int7: dayEightTemp6, int8: dayEightTemp7)
                } else {
                    completeDayEightUISetup(int1: dayEightTemp8, int2: dayEightTemp9, int3: dayEightTemp10, int4: dayEightTemp11, int5: dayEightTemp12, int6: dayEightTemp13, int7: dayEightTemp14, int8: dayEightTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightHumidity0, int2: dayEightHumidity1, int3: dayEightHumidity2, int4: dayEightHumidity3, int5: dayEightHumidity4, int6: dayEightHumidity5, int7: dayEightHumidity6, int8: dayEightHumidity7)
                } else {
                    completeDayEightUISetup(int1: dayEightHumidity8, int2: dayEightHumidity9, int3: dayEightHumidity10, int4: dayEightHumidity11, int5: dayEightHumidity12, int6: dayEightHumidity13, int7: dayEightHumidity14, int8: dayEightHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightIndex0, int2: dayEightIndex1, int3: dayEightIndex2, int4: dayEightIndex3, int5: dayEightIndex4, int6: dayEightIndex5, int7: dayEightIndex6, int8: dayEightIndex7)
                } else {
                    completeDayEightUISetup(int1: dayEightIndex8, int2: dayEightIndex9, int3: dayEightIndex10, int4: dayEightIndex11, int5: dayEightIndex12, int6: dayEightIndex13, int7: dayEightIndex14, int8: dayEightIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightWindSpeed0, int2: dayEightWindSpeed1, int3: dayEightWindSpeed2, int4: dayEightWindSpeed3, int5: dayEightWindSpeed4, int6: dayEightWindSpeed5, int7: dayEightWindSpeed6, int8: dayEightWindSpeed7)
                } else {
                    completeDayEightUISetup(int1: dayEightWindSpeed8, int2: dayEightWindSpeed9, int3: dayEightWindSpeed10, int4: dayEightWindSpeed11, int5: dayEightWindSpeed12, int6: dayEightWindSpeed13, int7: dayEightWindSpeed14, int8: dayEightWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightCloudCover0, int2: dayEightCloudCover1, int3: dayEightCloudCover2, int4: dayEightCloudCover3, int5: dayEightCloudCover4, int6: dayEightCloudCover5, int7: dayEightCloudCover6, int8: dayEightCloudCover7)
                } else {
                    completeDayEightUISetup(int1: dayEightCloudCover8, int2: dayEightCloudCover9, int3: dayEightCloudCover10, int4: dayEightCloudCover11, int5: dayEightCloudCover12, int6: dayEightCloudCover13, int7: dayEightCloudCover14, int8: dayEightCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightPrecip0, int2: dayEightPrecip1, int3: dayEightPrecip2, int4: dayEightPrecip3, int5: dayEightPrecip4, int6: dayEightPrecip5, int7: dayEightPrecip6, int8: dayEightPrecip7)
                } else {
                    completeDayEightUISetup(int1: dayEightPrecip8, int2: dayEightPrecip9, int3: dayEightPrecip10, int4: dayEightPrecip11, int5: dayEightPrecip12, int6: dayEightPrecip13, int7: dayEightPrecip14, int8: dayEightPrecip15)
                }
            }
        } else if day == 9 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNinePrecip0, int2: dayNinePrecip1, int3: dayNinePrecip2, int4: dayNinePrecip3, int5: dayNinePrecip4, int6: dayNinePrecip5, int7: dayNinePrecip6, int8: dayNinePrecip7)
                } else {
                    completeDayNineUISetup(int1: dayNinePrecip8, int2: dayNinePrecip9, int3: dayNinePrecip10, int4: dayNinePrecip11, int5: dayNinePrecip12, int6: dayNinePrecip13, int7: dayNinePrecip14, int8: dayNinePrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineTemp0, int2: dayNineTemp1, int3: dayNineTemp2, int4: dayNineTemp3, int5: dayNineTemp4, int6: dayNineTemp5, int7: dayNineTemp6, int8: dayNineTemp7)
                } else {
                    completeDayNineUISetup(int1: dayNineTemp8, int2: dayNineTemp9, int3: dayNineTemp10, int4: dayNineTemp11, int5: dayNineTemp12, int6: dayNineTemp13, int7: dayNineTemp14, int8: dayNineTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineHumidity0, int2: dayNineHumidity1, int3: dayNineHumidity2, int4: dayNineHumidity3, int5: dayNineHumidity4, int6: dayNineHumidity5, int7: dayNineHumidity6, int8: dayNineHumidity7)
                } else {
                    completeDayNineUISetup(int1: dayNineHumidity8, int2: dayNineHumidity9, int3: dayNineHumidity10, int4: dayNineHumidity11, int5: dayNineHumidity12, int6: dayNineHumidity13, int7: dayNineHumidity14, int8: dayNineHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineIndex0, int2: dayNineIndex1, int3: dayNineIndex2, int4: dayNineIndex3, int5: dayNineIndex4, int6: dayNineIndex5, int7: dayNineIndex6, int8: dayNineIndex7)
                } else {
                    completeDayNineUISetup(int1: dayNineIndex8, int2: dayNineIndex9, int3: dayNineIndex10, int4: dayNineIndex11, int5: dayNineIndex12, int6: dayNineIndex13, int7: dayNineIndex14, int8: dayNineIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineWindSpeed0, int2: dayNineWindSpeed1, int3: dayNineWindSpeed2, int4: dayNineWindSpeed3, int5: dayNineWindSpeed4, int6: dayNineWindSpeed5, int7: dayNineWindSpeed6, int8: dayNineWindSpeed7)
                } else {
                    completeDayNineUISetup(int1: dayNineWindSpeed8, int2: dayNineWindSpeed9, int3: dayNineWindSpeed10, int4: dayNineWindSpeed11, int5: dayNineWindSpeed12, int6: dayNineWindSpeed13, int7: dayNineWindSpeed14, int8: dayNineWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineCloudCover0, int2: dayNineCloudCover1, int3: dayNineCloudCover2, int4: dayNineCloudCover3, int5: dayNineCloudCover4, int6: dayNineCloudCover5, int7: dayNineCloudCover6, int8: dayNineCloudCover7)
                } else {
                    completeDayNineUISetup(int1: dayNineCloudCover8, int2: dayNineCloudCover9, int3: dayNineCloudCover10, int4: dayNineCloudCover11, int5: dayNineCloudCover12, int6: dayNineCloudCover13, int7: dayNineCloudCover14, int8: dayNineCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNinePrecip0, int2: dayNinePrecip1, int3: dayNinePrecip2, int4: dayNinePrecip3, int5: dayNinePrecip4, int6: dayNinePrecip5, int7: dayNinePrecip6, int8: dayNinePrecip7)
                } else {
                    completeDayNineUISetup(int1: dayNinePrecip8, int2: dayNinePrecip9, int3: dayNinePrecip10, int4: dayNinePrecip11, int5: dayNinePrecip12, int6: dayNinePrecip13, int7: dayNinePrecip14, int8: dayNinePrecip15)
                }
            }
        } else  if day == 10 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenPrecip0, int2: dayTenPrecip1, int3: dayTenPrecip2, int4: dayTenPrecip3, int5: dayTenPrecip4, int6: dayTenPrecip5, int7: dayTenPrecip6, int8: dayTenPrecip7)
                } else {
                    completeDayTenUISetup(int1: dayTenPrecip8, int2: dayTenPrecip9, int3: dayTenPrecip10, int4: dayTenPrecip11, int5: dayTenPrecip12, int6: dayTenPrecip13, int7: dayTenPrecip14, int8: dayTenPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenTemp0, int2: dayTenTemp1, int3: dayTenTemp2, int4: dayTenTemp3, int5: dayTenTemp4, int6: dayTenTemp5, int7: dayTenTemp6, int8: dayTenTemp7)
                } else {
                    completeDayTenUISetup(int1: dayTenTemp8, int2: dayTenTemp9, int3: dayTenTemp10, int4: dayTenTemp11, int5: dayTenTemp12, int6: dayTenTemp13, int7: dayTenTemp14, int8: dayTenTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenHumidity0, int2: dayTenHumidity1, int3: dayTenHumidity2, int4: dayTenHumidity3, int5: dayTenHumidity4, int6: dayTenHumidity5, int7: dayTenHumidity6, int8: dayTenHumidity7)
                } else {
                    completeDayTenUISetup(int1: dayTenHumidity8, int2: dayTenHumidity9, int3: dayTenHumidity10, int4: dayTenHumidity11, int5: dayTenHumidity12, int6: dayTenHumidity13, int7: dayTenHumidity14, int8: dayTenHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenIndex0, int2: dayTenIndex1, int3: dayTenIndex2, int4: dayTenIndex3, int5: dayTenIndex4, int6: dayTenIndex5, int7: dayTenIndex6, int8: dayTenIndex7)
                } else {
                    completeDayTenUISetup(int1: dayTenIndex8, int2: dayTenIndex9, int3: dayTenIndex10, int4: dayTenIndex11, int5: dayTenIndex12, int6: dayTenIndex13, int7: dayTenIndex14, int8: dayTenIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenWindSpeed0, int2: dayTenWindSpeed1, int3: dayTenWindSpeed2, int4: dayTenWindSpeed3, int5: dayTenWindSpeed4, int6: dayTenWindSpeed5, int7: dayTenWindSpeed6, int8: dayTenWindSpeed7)
                } else {
                    completeDayTenUISetup(int1: dayTenWindSpeed8, int2: dayTenWindSpeed9, int3: dayTenWindSpeed10, int4: dayTenWindSpeed11, int5: dayTenWindSpeed12, int6: dayTenWindSpeed13, int7: dayTenWindSpeed14, int8: dayTenWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenCloudCover0, int2: dayTenCloudCover1, int3: dayTenCloudCover2, int4: dayTenCloudCover3, int5: dayTenCloudCover4, int6: dayTenCloudCover5, int7: dayTenCloudCover6, int8: dayTenCloudCover7)
                } else {
                    completeDayTenUISetup(int1: dayTenCloudCover8, int2: dayTenCloudCover9, int3: dayTenCloudCover10, int4: dayTenCloudCover11, int5: dayTenCloudCover12, int6: dayTenCloudCover13, int7: dayTenCloudCover14, int8: dayTenCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenPrecip0, int2: dayTenPrecip1, int3: dayTenPrecip2, int4: dayTenPrecip3, int5: dayTenPrecip4, int6: dayTenPrecip5, int7: dayTenPrecip6, int8: dayTenPrecip7)
                } else {
                    completeDayTenUISetup(int1: dayTenPrecip8, int2: dayTenPrecip9, int3: dayTenPrecip10, int4: dayTenPrecip11, int5: dayTenPrecip12, int6: dayTenPrecip13, int7: dayTenPrecip14, int8: dayTenPrecip15)
                }
            }
        } else if day == 11 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenPrecip0, int2: dayElevenPrecip1, int3: dayElevenPrecip2, int4: dayElevenPrecip3, int5: dayElevenPrecip4, int6: dayElevenPrecip5, int7: dayElevenPrecip6, int8: dayElevenPrecip7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenPrecip8, int2: dayElevenPrecip9, int3: dayElevenPrecip10, int4: dayElevenPrecip11, int5: dayElevenPrecip12, int6: dayElevenPrecip13, int7: dayElevenPrecip14, int8: dayElevenPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenTemp0, int2: dayElevenTemp1, int3: dayElevenTemp2, int4: dayElevenTemp3, int5: dayElevenTemp4, int6: dayElevenTemp5, int7: dayElevenTemp6, int8: dayElevenTemp7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenTemp8, int2: dayElevenTemp9, int3: dayElevenTemp10, int4: dayElevenTemp11, int5: dayElevenTemp12, int6: dayElevenTemp13, int7: dayElevenTemp14, int8: dayElevenTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenHumidity0, int2: dayElevenHumidity1, int3: dayElevenHumidity2, int4: dayElevenHumidity3, int5: dayElevenHumidity4, int6: dayElevenHumidity5, int7: dayElevenHumidity6, int8: dayElevenHumidity7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenHumidity8, int2: dayElevenHumidity9, int3: dayElevenHumidity10, int4: dayElevenHumidity11, int5: dayElevenHumidity12, int6: dayElevenHumidity13, int7: dayElevenHumidity14, int8: dayElevenHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenIndex0, int2: dayElevenIndex1, int3: dayElevenIndex2, int4: dayElevenIndex3, int5: dayElevenIndex4, int6: dayElevenIndex5, int7: dayElevenIndex6, int8: dayElevenIndex7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenIndex8, int2: dayElevenIndex9, int3: dayElevenIndex10, int4: dayElevenIndex11, int5: dayElevenIndex12, int6: dayElevenIndex13, int7: dayElevenIndex14, int8: dayElevenIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenWindSpeed0, int2: dayElevenWindSpeed1, int3: dayElevenWindSpeed2, int4: dayElevenWindSpeed3, int5: dayElevenWindSpeed4, int6: dayElevenWindSpeed5, int7: dayElevenWindSpeed6, int8: dayElevenWindSpeed7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenWindSpeed8, int2: dayElevenWindSpeed9, int3: dayElevenWindSpeed10, int4: dayElevenWindSpeed11, int5: dayElevenWindSpeed12, int6: dayElevenWindSpeed13, int7: dayElevenWindSpeed14, int8: dayElevenWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenCloudCover0, int2: dayElevenCloudCover1, int3: dayElevenCloudCover2, int4: dayElevenCloudCover3, int5: dayElevenCloudCover4, int6: dayElevenCloudCover5, int7: dayElevenCloudCover6, int8: dayElevenCloudCover7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenCloudCover8, int2: dayElevenCloudCover9, int3: dayElevenCloudCover10, int4: dayElevenCloudCover11, int5: dayElevenCloudCover12, int6: dayElevenCloudCover13, int7: dayElevenCloudCover14, int8: dayElevenCloudCover15)
                }
            } else {
                // Default to precipitation
                if daySevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenPrecip0, int2: dayElevenPrecip1, int3: dayElevenPrecip2, int4: dayElevenPrecip3, int5: dayElevenPrecip4, int6: dayElevenPrecip5, int7: dayElevenPrecip6, int8: dayElevenPrecip7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenPrecip8, int2: dayElevenPrecip9, int3: dayElevenPrecip10, int4: dayElevenPrecip11, int5: dayElevenPrecip12, int6: dayElevenPrecip13, int7: dayElevenPrecip14, int8: dayElevenPrecip15)
                }
            }
        } else if day == 12 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip0, int2: dayTwelvePrecip1, int3: dayTwelvePrecip2, int4: dayTwelvePrecip3, int5: dayTwelvePrecip4, int6: dayTwelvePrecip5, int7: dayTwelvePrecip6, int8: dayTwelvePrecip7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip8, int2: dayTwelvePrecip9, int3: dayTwelvePrecip10, int4: dayTwelvePrecip11, int5: dayTwelvePrecip12, int6: dayTwelvePrecip13, int7: dayTwelvePrecip14, int8: dayTwelvePrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveTemp0, int2: dayTwelveTemp1, int3: dayTwelveTemp2, int4: dayTwelveTemp3, int5: dayTwelveTemp4, int6: dayTwelveTemp5, int7: dayTwelveTemp6, int8: dayTwelveTemp7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveTemp8, int2: dayTwelveTemp9, int3: dayTwelveTemp10, int4: dayTwelveTemp11, int5: dayTwelveTemp12, int6: dayTwelveTemp13, int7: dayTwelveTemp14, int8: dayTwelveTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveHumidity0, int2: dayTwelveHumidity1, int3: dayTwelveHumidity2, int4: dayTwelveHumidity3, int5: dayTwelveHumidity4, int6: dayTwelveHumidity5, int7: dayTwelveHumidity6, int8: dayTwelveHumidity7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveHumidity8, int2: dayTwelveHumidity9, int3: dayTwelveHumidity10, int4: dayTwelveHumidity11, int5: dayTwelveHumidity12, int6: dayTwelveHumidity13, int7: dayTwelveHumidity14, int8: dayTwelveHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveIndex0, int2: dayTwelveIndex1, int3: dayTwelveIndex2, int4: dayTwelveIndex3, int5: dayTwelveIndex4, int6: dayTwelveIndex5, int7: dayTwelveIndex6, int8: dayTwelveIndex7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveIndex8, int2: dayTwelveIndex9, int3: dayTwelveIndex10, int4: dayTwelveIndex11, int5: dayTwelveIndex12, int6: dayTwelveIndex13, int7: dayTwelveIndex14, int8: dayTwelveIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveWindSpeed0, int2: dayTwelveWindSpeed1, int3: dayTwelveWindSpeed2, int4: dayTwelveWindSpeed3, int5: dayTwelveWindSpeed4, int6: dayTwelveWindSpeed5, int7: dayTwelveWindSpeed6, int8: dayTwelveWindSpeed7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveWindSpeed8, int2: dayTwelveWindSpeed9, int3: dayTwelveWindSpeed10, int4: dayTwelveWindSpeed11, int5: dayTwelveWindSpeed12, int6: dayTwelveWindSpeed13, int7: dayTwelveWindSpeed14, int8: dayTwelveWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveCloudCover0, int2: dayTwelveCloudCover1, int3: dayTwelveCloudCover2, int4: dayTwelveCloudCover3, int5: dayTwelveCloudCover4, int6: dayTwelveCloudCover5, int7: dayTwelveCloudCover6, int8: dayTwelveCloudCover7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveCloudCover8, int2: dayTwelveCloudCover9, int3: dayTwelveCloudCover10, int4: dayTwelveCloudCover11, int5: dayTwelveCloudCover12, int6: dayTwelveCloudCover13, int7: dayTwelveCloudCover14, int8: dayTwelveCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip0, int2: dayTwelvePrecip1, int3: dayTwelvePrecip2, int4: dayTwelvePrecip3, int5: dayTwelvePrecip4, int6: dayTwelvePrecip5, int7: dayTwelvePrecip6, int8: dayTwelvePrecip7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip8, int2: dayTwelvePrecip9, int3: dayTwelvePrecip10, int4: dayTwelvePrecip11, int5: dayTwelvePrecip12, int6: dayTwelvePrecip13, int7: dayTwelvePrecip14, int8: dayTwelvePrecip15)
                }
            }
        } else if day == 13 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip0, int2: dayThirteenPrecip1, int3: dayThirteenPrecip2, int4: dayThirteenPrecip3, int5: dayThirteenPrecip4, int6: dayThirteenPrecip5, int7: dayThirteenPrecip6, int8: dayThirteenPrecip7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip8, int2: dayThirteenPrecip9, int3: dayThirteenPrecip10, int4: dayThirteenPrecip11, int5: dayThirteenPrecip12, int6: dayThirteenPrecip13, int7: dayThirteenPrecip14, int8: dayThirteenPrecip15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenTemp0, int2: dayThirteenTemp1, int3: dayThirteenTemp2, int4: dayThirteenTemp3, int5: dayThirteenTemp4, int6: dayThirteenTemp5, int7: dayThirteenTemp6, int8: dayThirteenTemp7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenTemp8, int2: dayThirteenTemp9, int3: dayThirteenTemp10, int4: dayThirteenTemp11, int5: dayThirteenTemp12, int6: dayThirteenTemp13, int7: dayThirteenTemp14, int8: dayThirteenTemp15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenHumidity0, int2: dayThirteenHumidity1, int3: dayThirteenHumidity2, int4: dayThirteenHumidity3, int5: dayThirteenHumidity4, int6: dayThirteenHumidity5, int7: dayThirteenHumidity6, int8: dayThirteenHumidity7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenHumidity8, int2: dayThirteenHumidity9, int3: dayThirteenHumidity10, int4: dayThirteenHumidity11, int5: dayThirteenHumidity12, int6: dayThirteenHumidity13, int7: dayThirteenHumidity14, int8: dayThirteenHumidity15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenIndex0, int2: dayThirteenIndex1, int3: dayThirteenIndex2, int4: dayThirteenIndex3, int5: dayThirteenIndex4, int6: dayThirteenIndex5, int7: dayThirteenIndex6, int8: dayThirteenIndex7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenIndex8, int2: dayThirteenIndex9, int3: dayThirteenIndex10, int4: dayThirteenIndex11, int5: dayThirteenIndex12, int6: dayThirteenIndex13, int7: dayThirteenIndex14, int8: dayThirteenIndex15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenWindSpeed0, int2: dayThirteenWindSpeed1, int3: dayThirteenWindSpeed2, int4: dayThirteenWindSpeed3, int5: dayThirteenWindSpeed4, int6: dayThirteenWindSpeed5, int7: dayThirteenWindSpeed6, int8: dayThirteenWindSpeed7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenWindSpeed8, int2: dayThirteenWindSpeed9, int3: dayThirteenWindSpeed10, int4: dayThirteenWindSpeed11, int5: dayThirteenWindSpeed12, int6: dayThirteenWindSpeed13, int7: dayThirteenWindSpeed14, int8: dayThirteenWindSpeed15)
                }
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                if daySevenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenCloudCover0, int2: dayThirteenCloudCover1, int3: dayThirteenCloudCover2, int4: dayThirteenCloudCover3, int5: dayThirteenCloudCover4, int6: dayThirteenCloudCover5, int7: dayThirteenCloudCover6, int8: dayThirteenCloudCover7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenCloudCover8, int2: dayThirteenCloudCover9, int3: dayThirteenCloudCover10, int4: dayThirteenCloudCover11, int5: dayThirteenCloudCover12, int6: dayThirteenCloudCover13, int7: dayThirteenCloudCover14, int8: dayThirteenCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip0, int2: dayThirteenPrecip1, int3: dayThirteenPrecip2, int4: dayThirteenPrecip3, int5: dayThirteenPrecip4, int6: dayThirteenPrecip5, int7: dayThirteenPrecip6, int8: dayThirteenPrecip7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip8, int2: dayThirteenPrecip9, int3: dayThirteenPrecip10, int4: dayThirteenPrecip11, int5: dayThirteenPrecip12, int6: dayThirteenPrecip13, int7: dayThirteenPrecip14, int8: dayThirteenPrecip15)
                }
            }
        } else if day == 14 {
               if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: precipHour0, int2: precipHour1, int3: precipHour2, int4: precipHour3, int5: precipHour4, int6: precipHour5, int7: precipHour6, int8: precipHour7)
                   } else {
                       completeHourlyUISetup(int1: precipHour8, int2: precipHour9, int3: precipHour10, int4: precipHour11, int5: precipHour12, int6: precipHour13, int7: precipHour14, int8: precipHour15)
                   }
               } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: tempHour0, int2: tempHour1, int3: tempHour2, int4: tempHour3, int5: tempHour4, int6: tempHour5, int7: tempHour6, int8: tempHour7)
                   } else {
                       completeHourlyUISetup(int1: tempHour8, int2: tempHour9, int3: tempHour10, int4: tempHour11, int5: tempHour12, int6: tempHour13, int7: tempHour14, int8: tempHour15)
                   }
               } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: humidityHour0, int2: humidityHour1, int3: humidityHour2, int4: humidityHour3, int5: humidityHour4, int6: humidityHour5, int7: humidityHour6, int8: humidityHour7)
                   } else {
                       completeHourlyUISetup(int1: humidityHour8, int2: humidityHour9, int3: humidityHour10, int4: humidityHour11, int5: humidityHour12, int6: humidityHour13, int7: humidityHour14, int8: humidityHour15)
                   }
               } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: uvindexHour0, int2: uvindexHour1, int3: uvindexHour2, int4: uvindexHour3, int5: uvindexHour4, int6: uvindexHour5, int7: uvindexHour6, int8: uvindexHour7)
                   } else {
                       completeHourlyUISetup(int1: uvindexHour8, int2: uvindexHour9, int3: uvindexHour10, int4: uvindexHour11, int5: uvindexHour12, int6: uvindexHour13, int7: uvindexHour14, int8: uvindexHour15)
                   }
               } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: windSpeedHour0, int2: windSpeedHour1, int3: windSpeedHour2, int4: windSpeedHour3, int5: windSpeedHour4, int6: windSpeedHour5, int7: windSpeedHour6, int8: windSpeedHour7)
                   } else {
                       completeHourlyUISetup(int1: windSpeedHour8, int2: windSpeedHour9, int3: windSpeedHour10, int4: windSpeedHour11, int5: windSpeedHour12, int6: windSpeedHour13, int7: windSpeedHour14, int8: windSpeedHour15)
                   }
               } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: cloudCoverHour0, int2: cloudCoverHour1, int3: cloudCoverHour2, int4: cloudCoverHour3, int5: cloudCoverHour4, int6: cloudCoverHour5, int7: cloudCoverHour6, int8: cloudCoverHour7)
                   } else {
                       completeHourlyUISetup(int1: cloudCoverHour8, int2: cloudCoverHour9, int3: cloudCoverHour10, int4: cloudCoverHour11, int5: cloudCoverHour12, int6: cloudCoverHour13, int7: cloudCoverHour14, int8: cloudCoverHour15)
                   }
               } else {
                   // Default to precipitation
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: precipHour0, int2: precipHour1, int3: precipHour2, int4: precipHour3, int5: precipHour4, int6: precipHour5, int7: precipHour6, int8: precipHour7)
                   } else {
                       completeHourlyUISetup(int1: precipHour8, int2: precipHour9, int3: precipHour10, int4: precipHour11, int5: precipHour12, int6: precipHour13, int7: precipHour14, int8: precipHour15)
                   }
               }
           }
    }
    
    // Set hourly condition values for each page or segment control tap
    func setHourlyConditionTextOnGesture(day: Int) {
        if day == 0 {
            if dayZeroSegmentControl.selectedSegmentIndex == 0 {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroPrecip0, int2: dayZeroPrecip1, int3: dayZeroPrecip2, int4: dayZeroPrecip3, int5: dayZeroPrecip4, int6: dayZeroPrecip5, int7: dayZeroPrecip6, int8: dayZeroPrecip7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroPrecip8, int2: dayZeroPrecip9, int3: dayZeroPrecip10, int4: dayZeroPrecip11, int5: dayZeroPrecip12, int6: dayZeroPrecip13, int7: dayZeroPrecip14, int8: dayZeroPrecip15)
                }
            } else if dayZeroSegmentControl.selectedSegmentIndex == 1 {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroTemp0, int2: dayZeroTemp1, int3: dayZeroTemp2, int4: dayZeroTemp3, int5: dayZeroTemp4, int6: dayZeroTemp5, int7: dayZeroTemp6, int8: dayZeroTemp7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroTemp8, int2: dayZeroTemp9, int3: dayZeroTemp10, int4: dayZeroTemp11, int5: dayZeroTemp12, int6: dayZeroTemp13, int7: dayZeroTemp14, int8: dayZeroTemp15)
                }
            } else if dayZeroSegmentControl.selectedSegmentIndex == 2 {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroHumidity0, int2: dayZeroHumidity1, int3: dayZeroHumidity2, int4: dayZeroHumidity3, int5: dayZeroHumidity4, int6: dayZeroHumidity5, int7: dayZeroHumidity6, int8: dayZeroHumidity7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroHumidity8, int2: dayZeroHumidity9, int3: dayZeroHumidity10, int4: dayZeroHumidity11, int5: dayZeroHumidity12, int6: dayZeroHumidity13, int7: dayZeroHumidity14, int8: dayZeroHumidity15)
                }
            } else if dayZeroSegmentControl.selectedSegmentIndex == 3 {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroIndex0, int2: dayZeroIndex1, int3: dayZeroIndex2, int4: dayZeroIndex3, int5: dayZeroIndex4, int6: dayZeroIndex5, int7: dayZeroIndex6, int8: dayZeroIndex7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroIndex8, int2: dayZeroIndex9, int3: dayZeroIndex10, int4: dayZeroIndex11, int5: dayZeroIndex12, int6: dayZeroIndex13, int7: dayZeroIndex14, int8: dayZeroIndex15)
                }
            } else if dayZeroSegmentControl.selectedSegmentIndex == 4 {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroWindSpeed0, int2: dayZeroWindSpeed1, int3: dayZeroWindSpeed2, int4: dayZeroWindSpeed3, int5: dayZeroWindSpeed4, int6: dayZeroWindSpeed5, int7: dayZeroWindSpeed6, int8: dayZeroWindSpeed7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroWindSpeed8, int2: dayZeroWindSpeed9, int3: dayZeroWindSpeed10, int4: dayZeroWindSpeed11, int5: dayZeroWindSpeed12, int6: dayZeroWindSpeed13, int7: dayZeroWindSpeed14, int8: dayZeroWindSpeed15)
                }
            } else if dayZeroSegmentControl.selectedSegmentIndex == 5 {
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroCloudCover0, int2: dayZeroCloudCover1, int3: dayZeroCloudCover2, int4: dayZeroCloudCover3, int5: dayZeroCloudCover4, int6: dayZeroCloudCover5, int7: dayZeroCloudCover6, int8: dayZeroCloudCover7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroCloudCover8, int2: dayZeroCloudCover9, int3: dayZeroCloudCover10, int4: dayZeroCloudCover11, int5: dayZeroCloudCover12, int6: dayZeroCloudCover13, int7: dayZeroCloudCover14, int8: dayZeroCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayZeroPageControl.currentPage == 0 {
                    completeDayZeroUISetup(int1: dayZeroPrecip0, int2: dayZeroPrecip1, int3: dayZeroPrecip2, int4: dayZeroPrecip3, int5: dayZeroPrecip4, int6: dayZeroPrecip5, int7: dayZeroPrecip6, int8: dayZeroPrecip7)
                } else {
                    completeDayZeroUISetup(int1: dayZeroPrecip8, int2: dayZeroPrecip9, int3: dayZeroPrecip10, int4: dayZeroPrecip11, int5: dayZeroPrecip12, int6: dayZeroPrecip13, int7: dayZeroPrecip14, int8: dayZeroPrecip15)
                }
            }
        } else if day == 1 {
            if dayOneSegmentControl.selectedSegmentIndex == 0 {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOnePrecip0, int2: dayOnePrecip1, int3: dayOnePrecip2, int4: dayOnePrecip3, int5: dayOnePrecip4, int6: dayOnePrecip5, int7: dayOnePrecip6, int8: dayOnePrecip7)
                } else {
                    completeDayOneUISetup(int1: dayOnePrecip8, int2: dayOnePrecip9, int3: dayOnePrecip10, int4: dayOnePrecip11, int5: dayOnePrecip12, int6: dayOnePrecip13, int7: dayOnePrecip14, int8: dayOnePrecip15)
                }
            } else if dayOneSegmentControl.selectedSegmentIndex == 1 {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneTemp0, int2: dayOneTemp1, int3: dayOneTemp2, int4: dayOneTemp3, int5: dayOneTemp4, int6: dayOneTemp5, int7: dayOneTemp6, int8: dayOneTemp7)
                } else {
                    completeDayOneUISetup(int1: dayOneTemp8, int2: dayOneTemp9, int3: dayOneTemp10, int4: dayOneTemp11, int5: dayOneTemp12, int6: dayOneTemp13, int7: dayOneTemp14, int8: dayOneTemp15)
                }
            } else if dayOneSegmentControl.selectedSegmentIndex == 2 {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneHumidity0, int2: dayOneHumidity1, int3: dayOneHumidity2, int4: dayOneHumidity3, int5: dayOneHumidity4, int6: dayOneHumidity5, int7: dayOneHumidity6, int8: dayOneHumidity7)
                } else {
                    completeDayOneUISetup(int1: dayOneHumidity8, int2: dayOneHumidity9, int3: dayOneHumidity10, int4: dayOneHumidity11, int5: dayOneHumidity12, int6: dayOneHumidity13, int7: dayOneHumidity14, int8: dayOneHumidity15)
                }
            } else if dayOneSegmentControl.selectedSegmentIndex == 3 {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneIndex0, int2: dayOneIndex1, int3: dayOneIndex2, int4: dayOneIndex3, int5: dayOneIndex4, int6: dayOneIndex5, int7: dayOneIndex6, int8: dayOneIndex7)
                } else {
                    completeDayOneUISetup(int1: dayOneIndex8, int2: dayOneIndex9, int3: dayOneIndex10, int4: dayOneIndex11, int5: dayOneIndex12, int6: dayOneIndex13, int7: dayOneIndex14, int8: dayOneIndex15)
                }
            } else if dayOneSegmentControl.selectedSegmentIndex == 4 {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneWindSpeed0, int2: dayOneWindSpeed1, int3: dayOneWindSpeed2, int4: dayOneWindSpeed3, int5: dayOneWindSpeed4, int6: dayOneWindSpeed5, int7: dayOneWindSpeed6, int8: dayOneWindSpeed7)
                } else {
                    completeDayOneUISetup(int1: dayOneWindSpeed8, int2: dayOneWindSpeed9, int3: dayOneWindSpeed10, int4: dayOneWindSpeed11, int5: dayOneWindSpeed12, int6: dayOneWindSpeed13, int7: dayOneWindSpeed14, int8: dayOneWindSpeed15)
                }
            } else if dayOneSegmentControl.selectedSegmentIndex == 5 {
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOneCloudCover0, int2: dayOneCloudCover1, int3: dayOneCloudCover2, int4: dayOneCloudCover3, int5: dayOneCloudCover4, int6: dayOneCloudCover5, int7: dayOneCloudCover6, int8: dayOneCloudCover7)
                } else {
                    completeDayOneUISetup(int1: dayOneCloudCover8, int2: dayOneCloudCover9, int3: dayOneCloudCover10, int4: dayOneCloudCover11, int5: dayOneCloudCover12, int6: dayOneCloudCover13, int7: dayOneCloudCover14, int8: dayOneCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayOnePageControl.currentPage == 0 {
                    completeDayOneUISetup(int1: dayOnePrecip0, int2: dayOnePrecip1, int3: dayOnePrecip2, int4: dayOnePrecip3, int5: dayOnePrecip4, int6: dayOnePrecip5, int7: dayOnePrecip6, int8: dayOnePrecip7)
                } else {
                    completeDayOneUISetup(int1: dayOnePrecip8, int2: dayOnePrecip9, int3: dayOnePrecip10, int4: dayOnePrecip11, int5: dayOnePrecip12, int6: dayOnePrecip13, int7: dayOnePrecip14, int8: dayOnePrecip15)
                }
            }
        } else if day == 2 {
            if dayTwoSegmentControl.selectedSegmentIndex == 0 {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoPrecip0, int2: dayTwoPrecip1, int3: dayTwoPrecip2, int4: dayTwoPrecip3, int5: dayTwoPrecip4, int6: dayTwoPrecip5, int7: dayTwoPrecip6, int8: dayTwoPrecip7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoPrecip8, int2: dayTwoPrecip9, int3: dayTwoPrecip10, int4: dayTwoPrecip11, int5: dayTwoPrecip12, int6: dayTwoPrecip13, int7: dayTwoPrecip14, int8: dayTwoPrecip15)
                }
            } else if dayTwoSegmentControl.selectedSegmentIndex == 1 {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoTemp0, int2: dayTwoTemp1, int3: dayTwoTemp2, int4: dayTwoTemp3, int5: dayTwoTemp4, int6: dayTwoTemp5, int7: dayTwoTemp6, int8: dayTwoTemp7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoTemp8, int2: dayTwoTemp9, int3: dayTwoTemp10, int4: dayTwoTemp11, int5: dayTwoTemp12, int6: dayTwoTemp13, int7: dayTwoTemp14, int8: dayTwoTemp15)
                }
            } else if dayTwoSegmentControl.selectedSegmentIndex == 2 {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoHumidity0, int2: dayTwoHumidity1, int3: dayTwoHumidity2, int4: dayTwoHumidity3, int5: dayTwoHumidity4, int6: dayTwoHumidity5, int7: dayTwoHumidity6, int8: dayTwoHumidity7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoHumidity8, int2: dayTwoHumidity9, int3: dayTwoHumidity10, int4: dayTwoHumidity11, int5: dayTwoHumidity12, int6: dayTwoHumidity13, int7: dayTwoHumidity14, int8: dayTwoHumidity15)
                }
            } else if dayTwoSegmentControl.selectedSegmentIndex == 5 {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoIndex0, int2: dayTwoIndex1, int3: dayTwoIndex2, int4: dayTwoIndex3, int5: dayTwoIndex4, int6: dayTwoIndex5, int7: dayTwoIndex6, int8: dayTwoIndex7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoIndex8, int2: dayTwoIndex9, int3: dayTwoIndex10, int4: dayTwoIndex11, int5: dayTwoIndex12, int6: dayTwoIndex13, int7: dayTwoIndex14, int8: dayTwoIndex15)
                }
            } else if dayTwoSegmentControl.selectedSegmentIndex == 4 {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoWindSpeed0, int2: dayTwoWindSpeed1, int3: dayTwoWindSpeed2, int4: dayTwoWindSpeed3, int5: dayTwoWindSpeed4, int6: dayTwoWindSpeed5, int7: dayTwoWindSpeed6, int8: dayTwoWindSpeed7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoWindSpeed8, int2: dayTwoWindSpeed9, int3: dayTwoWindSpeed10, int4: dayTwoWindSpeed11, int5: dayTwoWindSpeed12, int6: dayTwoWindSpeed13, int7: dayTwoWindSpeed14, int8: dayTwoWindSpeed15)
                }
            } else if dayTwoSegmentControl.selectedSegmentIndex == 5 {
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoCloudCover0, int2: dayTwoCloudCover1, int3: dayTwoCloudCover2, int4: dayTwoCloudCover3, int5: dayTwoCloudCover4, int6: dayTwoCloudCover5, int7: dayTwoCloudCover6, int8: dayTwoCloudCover7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoCloudCover8, int2: dayTwoCloudCover9, int3: dayTwoCloudCover10, int4: dayTwoCloudCover11, int5: dayTwoCloudCover12, int6: dayTwoCloudCover13, int7: dayTwoCloudCover14, int8: dayTwoCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayTwoPageControl.currentPage == 0 {
                    completeDayTwoUISetup(int1: dayTwoPrecip0, int2: dayTwoPrecip1, int3: dayTwoPrecip2, int4: dayTwoPrecip3, int5: dayTwoPrecip4, int6: dayTwoPrecip5, int7: dayTwoPrecip6, int8: dayTwoPrecip7)
                } else {
                    completeDayTwoUISetup(int1: dayTwoPrecip8, int2: dayTwoPrecip9, int3: dayTwoPrecip10, int4: dayTwoPrecip11, int5: dayTwoPrecip12, int6: dayTwoPrecip13, int7: dayTwoPrecip14, int8: dayTwoPrecip15)
                }
            }
        } else if day == 3 {
            if dayThreeSegmentControl.selectedSegmentIndex == 0 {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreePrecip0, int2: dayThreePrecip1, int3: dayThreePrecip2, int4: dayThreePrecip3, int5: dayThreePrecip4, int6: dayThreePrecip5, int7: dayThreePrecip6, int8: dayThreePrecip7)
                } else {
                    completeDayThreeUISetup(int1: dayThreePrecip8, int2: dayThreePrecip9, int3: dayThreePrecip10, int4: dayThreePrecip11, int5: dayThreePrecip12, int6: dayThreePrecip13, int7: dayThreePrecip14, int8: dayThreePrecip15)
                }
            } else if dayThreeSegmentControl.selectedSegmentIndex == 1 {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeTemp0, int2: dayThreeTemp1, int3: dayThreeTemp2, int4: dayThreeTemp3, int5: dayThreeTemp4, int6: dayThreeTemp5, int7: dayThreeTemp6, int8: dayThreeTemp7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeTemp8, int2: dayThreeTemp9, int3: dayThreeTemp10, int4: dayThreeTemp11, int5: dayThreeTemp12, int6: dayThreeTemp13, int7: dayThreeTemp14, int8: dayThreeTemp15)
                }
            } else if dayThreeSegmentControl.selectedSegmentIndex == 2 {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeHumidity0, int2: dayThreeHumidity1, int3: dayThreeHumidity2, int4: dayThreeHumidity3, int5: dayThreeHumidity4, int6: dayThreeHumidity5, int7: dayThreeHumidity6, int8: dayThreeHumidity7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeHumidity8, int2: dayThreeHumidity9, int3: dayThreeHumidity10, int4: dayThreeHumidity11, int5: dayThreeHumidity12, int6: dayThreeHumidity13, int7: dayThreeHumidity14, int8: dayThreeHumidity15)
                }
            } else if dayThreeSegmentControl.selectedSegmentIndex == 3 {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeIndex0, int2: dayThreeIndex1, int3: dayThreeIndex2, int4: dayThreeIndex3, int5: dayThreeIndex4, int6: dayThreeIndex5, int7: dayThreeIndex6, int8: dayThreeIndex7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeIndex8, int2: dayThreeIndex9, int3: dayThreeIndex10, int4: dayThreeIndex11, int5: dayThreeIndex12, int6: dayThreeIndex13, int7: dayThreeIndex14, int8: dayThreeIndex15)
                }
            } else if dayThreeSegmentControl.selectedSegmentIndex == 4 {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeWindSpeed0, int2: dayThreeWindSpeed1, int3: dayThreeWindSpeed2, int4: dayThreeWindSpeed3, int5: dayThreeWindSpeed4, int6: dayThreeWindSpeed5, int7: dayThreeWindSpeed6, int8: dayThreeWindSpeed7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeWindSpeed8, int2: dayThreeWindSpeed9, int3: dayThreeWindSpeed10, int4: dayThreeWindSpeed11, int5: dayThreeWindSpeed12, int6: dayThreeWindSpeed13, int7: dayThreeWindSpeed14, int8: dayThreeWindSpeed15)
                }
            } else if dayThreeSegmentControl.selectedSegmentIndex == 5 {
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreeCloudCover0, int2: dayThreeCloudCover1, int3: dayThreeCloudCover2, int4: dayThreeCloudCover3, int5: dayThreeCloudCover4, int6: dayThreeCloudCover5, int7: dayThreeCloudCover6, int8: dayThreeCloudCover7)
                } else {
                    completeDayThreeUISetup(int1: dayThreeCloudCover8, int2: dayThreeCloudCover9, int3: dayThreeCloudCover10, int4: dayThreeCloudCover11, int5: dayThreeCloudCover12, int6: dayThreeCloudCover13, int7: dayThreeCloudCover14, int8: dayThreeCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayThreePageControl.currentPage == 0 {
                    completeDayThreeUISetup(int1: dayThreePrecip0, int2: dayThreePrecip1, int3: dayThreePrecip2, int4: dayThreePrecip3, int5: dayThreePrecip4, int6: dayThreePrecip5, int7: dayThreePrecip6, int8: dayThreePrecip7)
                } else {
                    completeDayThreeUISetup(int1: dayThreePrecip8, int2: dayThreePrecip9, int3: dayThreePrecip10, int4: dayThreePrecip11, int5: dayThreePrecip12, int6: dayThreePrecip13, int7: dayThreePrecip14, int8: dayThreePrecip15)
                }
            }
        } else if day == 4 {
            if dayFourSegmentControl.selectedSegmentIndex == 0 {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourPrecip0, int2: dayFourPrecip1, int3: dayFourPrecip2, int4: dayFourPrecip3, int5: dayFourPrecip4, int6: dayFourPrecip5, int7: dayFourPrecip6, int8: dayFourPrecip7)
                } else {
                    completeDayFourUISetup(int1: dayFourPrecip8, int2: dayFourPrecip9, int3: dayFourPrecip10, int4: dayFourPrecip11, int5: dayFourPrecip12, int6: dayFourPrecip13, int7: dayFourPrecip14, int8: dayFourPrecip15)
                }
            } else if dayFourSegmentControl.selectedSegmentIndex == 1 {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourTemp0, int2: dayFourTemp1, int3: dayFourTemp2, int4: dayFourTemp3, int5: dayFourTemp4, int6: dayFourTemp5, int7: dayFourTemp6, int8: dayFourTemp7)
                } else {
                    completeDayFourUISetup(int1: dayFourTemp8, int2: dayFourTemp9, int3: dayFourTemp10, int4: dayFourTemp11, int5: dayFourTemp12, int6: dayFourTemp13, int7: dayFourTemp14, int8: dayFourTemp15)
                }
            } else if dayFourSegmentControl.selectedSegmentIndex == 2 {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourHumidity0, int2: dayFourHumidity1, int3: dayFourHumidity2, int4: dayFourHumidity3, int5: dayFourHumidity4, int6: dayFourHumidity5, int7: dayFourHumidity6, int8: dayFourHumidity7)
                } else {
                    completeDayFourUISetup(int1: dayFourHumidity8, int2: dayFourHumidity9, int3: dayFourHumidity10, int4: dayFourHumidity11, int5: dayFourHumidity12, int6: dayFourHumidity13, int7: dayFourHumidity14, int8: dayFourHumidity15)
                }
            } else if dayFourSegmentControl.selectedSegmentIndex == 3 {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourIndex0, int2: dayFourIndex1, int3: dayFourIndex2, int4: dayFourIndex3, int5: dayFourIndex4, int6: dayFourIndex5, int7: dayFourIndex6, int8: dayFourIndex7)
                } else {
                    completeDayFourUISetup(int1: dayFourIndex8, int2: dayFourIndex9, int3: dayFourIndex10, int4: dayFourIndex11, int5: dayFourIndex12, int6: dayFourIndex13, int7: dayFourIndex14, int8: dayFourIndex15)
                }
            } else if dayFourSegmentControl.selectedSegmentIndex == 4 {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourWindSpeed0, int2: dayFourWindSpeed1, int3: dayFourWindSpeed2, int4: dayFourWindSpeed3, int5: dayFourWindSpeed4, int6: dayFourWindSpeed5, int7: dayFourWindSpeed6, int8: dayFourWindSpeed7)
                } else {
                    completeDayFourUISetup(int1: dayFourWindSpeed8, int2: dayFourWindSpeed9, int3: dayFourWindSpeed10, int4: dayFourWindSpeed11, int5: dayFourWindSpeed12, int6: dayFourWindSpeed13, int7: dayFourWindSpeed14, int8: dayFourWindSpeed15)
                }
            } else if dayFourSegmentControl.selectedSegmentIndex == 5 {
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourCloudCover0, int2: dayFourCloudCover1, int3: dayFourCloudCover2, int4: dayFourCloudCover3, int5: dayFourCloudCover4, int6: dayFourCloudCover5, int7: dayFourCloudCover6, int8: dayFourCloudCover7)
                } else {
                    completeDayFourUISetup(int1: dayFourCloudCover8, int2: dayFourCloudCover9, int3: dayFourCloudCover10, int4: dayFourCloudCover11, int5: dayFourCloudCover12, int6: dayFourCloudCover13, int7: dayFourCloudCover14, int8: dayFourCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayFourPageControl.currentPage == 0 {
                    completeDayFourUISetup(int1: dayFourPrecip0, int2: dayFourPrecip1, int3: dayFourPrecip2, int4: dayFourPrecip3, int5: dayFourPrecip4, int6: dayFourPrecip5, int7: dayFourPrecip6, int8: dayFourPrecip7)
                } else {
                    completeDayFourUISetup(int1: dayFourPrecip8, int2: dayFourPrecip9, int3: dayFourPrecip10, int4: dayFourPrecip11, int5: dayFourPrecip12, int6: dayFourPrecip13, int7: dayFourPrecip14, int8: dayFourPrecip15)
                }
            }
        } else if day == 5 {
            if dayFiveSegmentControl.selectedSegmentIndex == 0 {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFivePrecip0, int2: dayFivePrecip1, int3: dayFivePrecip2, int4: dayFivePrecip3, int5: dayFivePrecip4, int6: dayFivePrecip5, int7: dayFivePrecip6, int8: dayFivePrecip7)
                } else {
                    completeDayFiveUISetup(int1: dayFivePrecip8, int2: dayFivePrecip9, int3: dayFivePrecip10, int4: dayFivePrecip11, int5: dayFivePrecip12, int6: dayFivePrecip13, int7: dayFivePrecip14, int8: dayFivePrecip15)
                }
            } else if dayFiveSegmentControl.selectedSegmentIndex == 1 {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveTemp0, int2: dayFiveTemp1, int3: dayFiveTemp2, int4: dayFiveTemp3, int5: dayFiveTemp4, int6: dayFiveTemp5, int7: dayFiveTemp6, int8: dayFiveTemp7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveTemp8, int2: dayFiveTemp9, int3: dayFiveTemp10, int4: dayFiveTemp11, int5: dayFiveTemp12, int6: dayFiveTemp13, int7: dayFiveTemp14, int8: dayFiveTemp15)
                }
            } else if dayFiveSegmentControl.selectedSegmentIndex == 2 {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveHumidity0, int2: dayFiveHumidity1, int3: dayFiveHumidity2, int4: dayFiveHumidity3, int5: dayFiveHumidity4, int6: dayFiveHumidity5, int7: dayFiveHumidity6, int8: dayFiveHumidity7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveHumidity8, int2: dayFiveHumidity9, int3: dayFiveHumidity10, int4: dayFiveHumidity11, int5: dayFiveHumidity12, int6: dayFiveHumidity13, int7: dayFiveHumidity14, int8: dayFiveHumidity15)
                }
            } else if dayFiveSegmentControl.selectedSegmentIndex == 3 {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveIndex0, int2: dayFiveIndex1, int3: dayFiveIndex2, int4: dayFiveIndex3, int5: dayFiveIndex4, int6: dayFiveIndex5, int7: dayFiveIndex6, int8: dayFiveIndex7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveIndex8, int2: dayFiveIndex9, int3: dayFiveIndex10, int4: dayFiveIndex11, int5: dayFiveIndex12, int6: dayFiveIndex13, int7: dayFiveIndex14, int8: dayFiveIndex15)
                }
            } else if dayFiveSegmentControl.selectedSegmentIndex == 4 {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveWindSpeed0, int2: dayFiveWindSpeed1, int3: dayFiveWindSpeed2, int4: dayFiveWindSpeed3, int5: dayFiveWindSpeed4, int6: dayFiveWindSpeed5, int7: dayFiveWindSpeed6, int8: dayFiveWindSpeed7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveWindSpeed8, int2: dayFiveWindSpeed9, int3: dayFiveWindSpeed10, int4: dayFiveWindSpeed11, int5: dayFiveWindSpeed12, int6: dayFiveWindSpeed13, int7: dayFiveWindSpeed14, int8: dayFiveWindSpeed15)
                }
            } else if dayFiveSegmentControl.selectedSegmentIndex == 5 {
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFiveCloudCover0, int2: dayFiveCloudCover1, int3: dayFiveCloudCover2, int4: dayFiveCloudCover3, int5: dayFiveCloudCover4, int6: dayFiveCloudCover5, int7: dayFiveCloudCover6, int8: dayFiveCloudCover7)
                } else {
                    completeDayFiveUISetup(int1: dayFiveCloudCover8, int2: dayFiveCloudCover9, int3: dayFiveCloudCover10, int4: dayFiveCloudCover11, int5: dayFiveCloudCover12, int6: dayFiveCloudCover13, int7: dayFiveCloudCover14, int8: dayFiveCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayFivePageControl.currentPage == 0 {
                    completeDayFiveUISetup(int1: dayFivePrecip0, int2: dayFivePrecip1, int3: dayFivePrecip2, int4: dayFivePrecip3, int5: dayFivePrecip4, int6: dayFivePrecip5, int7: dayFivePrecip6, int8: dayFivePrecip7)
                } else {
                    completeDayFiveUISetup(int1: dayFivePrecip8, int2: dayFivePrecip9, int3: dayFivePrecip10, int4: dayFivePrecip11, int5: dayFivePrecip12, int6: dayFivePrecip13, int7: dayFivePrecip14, int8: dayFivePrecip15)
                }
            }
        } else if day == 6 {
            if daySixSegmentControl.selectedSegmentIndex == 0 {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixPrecip0, int2: daySixPrecip1, int3: daySixPrecip2, int4: daySixPrecip3, int5: daySixPrecip4, int6: daySixPrecip5, int7: daySixPrecip6, int8: daySixPrecip7)
                } else {
                    completeDaySixUISetup(int1: daySixPrecip8, int2: daySixPrecip9, int3: daySixPrecip10, int4: daySixPrecip11, int5: daySixPrecip12, int6: daySixPrecip13, int7: daySixPrecip14, int8: daySixPrecip15)
                }
            } else if daySixSegmentControl.selectedSegmentIndex == 1 {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixTemp0, int2: daySixTemp1, int3: daySixTemp2, int4: daySixTemp3, int5: daySixTemp4, int6: daySixTemp5, int7: daySixTemp6, int8: daySixTemp7)
                } else {
                    completeDaySixUISetup(int1: daySixTemp8, int2: daySixTemp9, int3: daySixTemp10, int4: daySixTemp11, int5: daySixTemp12, int6: daySixTemp13, int7: daySixTemp14, int8: daySixTemp15)
                }
            } else if daySixSegmentControl.selectedSegmentIndex == 2 {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixHumidity0, int2: daySixHumidity1, int3: daySixHumidity2, int4: daySixHumidity3, int5: daySixHumidity4, int6: daySixHumidity5, int7: daySixHumidity6, int8: daySixHumidity7)
                } else {
                    completeDaySixUISetup(int1: daySixHumidity8, int2: daySixHumidity9, int3: daySixHumidity10, int4: daySixHumidity11, int5: daySixHumidity12, int6: daySixHumidity13, int7: daySixHumidity14, int8: daySixHumidity15)
                }
            } else if daySixSegmentControl.selectedSegmentIndex == 3 {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixIndex0, int2: daySixIndex1, int3: daySixIndex2, int4: daySixIndex3, int5: daySixIndex4, int6: daySixIndex5, int7: daySixIndex6, int8: daySixIndex7)
                } else {
                    completeDaySixUISetup(int1: daySixIndex8, int2: daySixIndex9, int3: daySixIndex10, int4: daySixIndex11, int5: daySixIndex12, int6: daySixIndex13, int7: daySixIndex14, int8: daySixIndex15)
                }
            } else if daySixSegmentControl.selectedSegmentIndex == 4 {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixWindSpeed0, int2: daySixWindSpeed1, int3: daySixWindSpeed2, int4: daySixWindSpeed3, int5: daySixWindSpeed4, int6: daySixWindSpeed5, int7: daySixWindSpeed6, int8: daySixWindSpeed7)
                } else {
                    completeDaySixUISetup(int1: daySixWindSpeed8, int2: daySixWindSpeed9, int3: daySixWindSpeed10, int4: daySixWindSpeed11, int5: daySixWindSpeed12, int6: daySixWindSpeed13, int7: daySixWindSpeed14, int8: daySixWindSpeed15)
                }
            } else if daySixSegmentControl.selectedSegmentIndex == 5 {
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixCloudCover0, int2: daySixCloudCover1, int3: daySixCloudCover2, int4: daySixCloudCover3, int5: daySixCloudCover4, int6: daySixCloudCover5, int7: daySixCloudCover6, int8: daySixCloudCover7)
                } else {
                    completeDaySixUISetup(int1: daySixCloudCover8, int2: daySixCloudCover9, int3: daySixCloudCover10, int4: daySixCloudCover11, int5: daySixCloudCover12, int6: daySixCloudCover13, int7: daySixCloudCover14, int8: daySixCloudCover15)
                }
            } else {
                // Default to precipitation
                if daySixPageControl.currentPage == 0 {
                    completeDaySixUISetup(int1: daySixPrecip0, int2: daySixPrecip1, int3: daySixPrecip2, int4: daySixPrecip3, int5: daySixPrecip4, int6: daySixPrecip5, int7: daySixPrecip6, int8: daySixPrecip7)
                } else {
                    completeDaySixUISetup(int1: daySixPrecip8, int2: daySixPrecip9, int3: daySixPrecip10, int4: daySixPrecip11, int5: daySixPrecip12, int6: daySixPrecip13, int7: daySixPrecip14, int8: daySixPrecip15)
                }
            }
        } else if day == 7 {
            if daySevenSegmentControl.selectedSegmentIndex == 0 {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenPrecip0, int2: daySevenPrecip1, int3: daySevenPrecip2, int4: daySevenPrecip3, int5: daySevenPrecip4, int6: daySevenPrecip5, int7: daySevenPrecip6, int8: daySevenPrecip7)
                } else {
                    completeDaySevenUISetup(int1: daySevenPrecip8, int2: daySevenPrecip9, int3: daySevenPrecip10, int4: daySevenPrecip11, int5: daySevenPrecip12, int6: daySevenPrecip13, int7: daySevenPrecip14, int8: daySevenPrecip15)
                }
            } else if daySevenSegmentControl.selectedSegmentIndex == 1 {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenTemp0, int2: daySevenTemp1, int3: daySevenTemp2, int4: daySevenTemp3, int5: daySevenTemp4, int6: daySevenTemp5, int7: daySevenTemp6, int8: daySevenTemp7)
                } else {
                    completeDaySevenUISetup(int1: daySevenTemp8, int2: daySevenTemp9, int3: daySevenTemp10, int4: daySevenTemp11, int5: daySevenTemp12, int6: daySevenTemp13, int7: daySevenTemp14, int8: daySevenTemp15)
                }
            } else if daySevenSegmentControl.selectedSegmentIndex == 2 {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenHumidity0, int2: daySevenHumidity1, int3: daySevenHumidity2, int4: daySevenHumidity3, int5: daySevenHumidity4, int6: daySevenHumidity5, int7: daySevenHumidity6, int8: daySevenHumidity7)
                } else {
                    completeDaySevenUISetup(int1: daySevenHumidity8, int2: daySevenHumidity9, int3: daySevenHumidity10, int4: daySevenHumidity11, int5: daySevenHumidity12, int6: daySevenHumidity13, int7: daySevenHumidity14, int8: daySevenHumidity15)
                }
            } else if daySevenSegmentControl.selectedSegmentIndex == 3 {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenIndex0, int2: daySevenIndex1, int3: daySevenIndex2, int4: daySevenIndex3, int5: daySevenIndex4, int6: daySevenIndex5, int7: daySevenIndex6, int8: daySevenIndex7)
                } else {
                    completeDaySevenUISetup(int1: daySevenIndex8, int2: daySevenIndex9, int3: daySevenIndex10, int4: daySevenIndex11, int5: daySevenIndex12, int6: daySevenIndex13, int7: daySevenIndex14, int8: daySevenIndex15)
                }
            } else if daySevenSegmentControl.selectedSegmentIndex == 4 {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenWindSpeed0, int2: daySevenWindSpeed1, int3: daySevenWindSpeed2, int4: daySevenWindSpeed3, int5: daySevenWindSpeed4, int6: daySevenWindSpeed5, int7: daySevenWindSpeed6, int8: daySevenWindSpeed7)
                } else {
                    completeDaySevenUISetup(int1: daySevenWindSpeed8, int2: daySevenWindSpeed9, int3: daySevenWindSpeed10, int4: daySevenWindSpeed11, int5: daySevenWindSpeed12, int6: daySevenWindSpeed13, int7: daySevenWindSpeed14, int8: daySevenWindSpeed15)
                }
            } else if daySevenSegmentControl.selectedSegmentIndex == 5 {
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenCloudCover0, int2: daySevenCloudCover1, int3: daySevenCloudCover2, int4: daySevenCloudCover3, int5: daySevenCloudCover4, int6: daySevenCloudCover5, int7: daySevenCloudCover6, int8: daySevenCloudCover7)
                } else {
                    completeDaySevenUISetup(int1: daySevenCloudCover8, int2: daySevenCloudCover9, int3: daySevenCloudCover10, int4: daySevenCloudCover11, int5: daySevenCloudCover12, int6: daySevenCloudCover13, int7: daySevenCloudCover14, int8: daySevenCloudCover15)
                }
            } else {
                // Default to precipitation
                if daySevenPageControl.currentPage == 0 {
                    completeDaySevenUISetup(int1: daySevenPrecip0, int2: daySevenPrecip1, int3: daySevenPrecip2, int4: daySevenPrecip3, int5: daySevenPrecip4, int6: daySevenPrecip5, int7: daySevenPrecip6, int8: daySevenPrecip7)
                } else {
                    completeDaySevenUISetup(int1: daySevenPrecip8, int2: daySevenPrecip9, int3: daySevenPrecip10, int4: daySevenPrecip11, int5: daySevenPrecip12, int6: daySevenPrecip13, int7: daySevenPrecip14, int8: daySevenPrecip15)
                }
            }
        } else if day == 8 {
            if dayEightSegmentControl.selectedSegmentIndex == 0 {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightPrecip0, int2: dayEightPrecip1, int3: dayEightPrecip2, int4: dayEightPrecip3, int5: dayEightPrecip4, int6: dayEightPrecip5, int7: dayEightPrecip6, int8: dayEightPrecip7)
                } else {
                    completeDayEightUISetup(int1: dayEightPrecip8, int2: dayEightPrecip9, int3: dayEightPrecip10, int4: dayEightPrecip11, int5: dayEightPrecip12, int6: dayEightPrecip13, int7: dayEightPrecip14, int8: dayEightPrecip15)
                }
            } else if dayEightSegmentControl.selectedSegmentIndex == 1 {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightTemp0, int2: dayEightTemp1, int3: dayEightTemp2, int4: dayEightTemp3, int5: dayEightTemp4, int6: dayEightTemp5, int7: dayEightTemp6, int8: dayEightTemp7)
                } else {
                    completeDayEightUISetup(int1: dayEightTemp8, int2: dayEightTemp9, int3: dayEightTemp10, int4: dayEightTemp11, int5: dayEightTemp12, int6: dayEightTemp13, int7: dayEightTemp14, int8: dayEightTemp15)
                }
            } else if dayEightSegmentControl.selectedSegmentIndex == 2 {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightHumidity0, int2: dayEightHumidity1, int3: dayEightHumidity2, int4: dayEightHumidity3, int5: dayEightHumidity4, int6: dayEightHumidity5, int7: dayEightHumidity6, int8: dayEightHumidity7)
                } else {
                    completeDayEightUISetup(int1: dayEightHumidity8, int2: dayEightHumidity9, int3: dayEightHumidity10, int4: dayEightHumidity11, int5: dayEightHumidity12, int6: dayEightHumidity13, int7: dayEightHumidity14, int8: dayEightHumidity15)
                }
            } else if dayEightSegmentControl.selectedSegmentIndex == 3 {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightIndex0, int2: dayEightIndex1, int3: dayEightIndex2, int4: dayEightIndex3, int5: dayEightIndex4, int6: dayEightIndex5, int7: dayEightIndex6, int8: dayEightIndex7)
                } else {
                    completeDayEightUISetup(int1: dayEightIndex8, int2: dayEightIndex9, int3: dayEightIndex10, int4: dayEightIndex11, int5: dayEightIndex12, int6: dayEightIndex13, int7: dayEightIndex14, int8: dayEightIndex15)
                }
            } else if dayEightSegmentControl.selectedSegmentIndex == 4 {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightWindSpeed0, int2: dayEightWindSpeed1, int3: dayEightWindSpeed2, int4: dayEightWindSpeed3, int5: dayEightWindSpeed4, int6: dayEightWindSpeed5, int7: dayEightWindSpeed6, int8: dayEightWindSpeed7)
                } else {
                    completeDayEightUISetup(int1: dayEightWindSpeed8, int2: dayEightWindSpeed9, int3: dayEightWindSpeed10, int4: dayEightWindSpeed11, int5: dayEightWindSpeed12, int6: dayEightWindSpeed13, int7: dayEightWindSpeed14, int8: dayEightWindSpeed15)
                }
            } else if dayEightSegmentControl.selectedSegmentIndex == 5 {
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightCloudCover0, int2: dayEightCloudCover1, int3: dayEightCloudCover2, int4: dayEightCloudCover3, int5: dayEightCloudCover4, int6: dayEightCloudCover5, int7: dayEightCloudCover6, int8: dayEightCloudCover7)
                } else {
                    completeDayEightUISetup(int1: dayEightCloudCover8, int2: dayEightCloudCover9, int3: dayEightCloudCover10, int4: dayEightCloudCover11, int5: dayEightCloudCover12, int6: dayEightCloudCover13, int7: dayEightCloudCover14, int8: dayEightCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayEightPageControl.currentPage == 0 {
                    completeDayEightUISetup(int1: dayEightPrecip0, int2: dayEightPrecip1, int3: dayEightPrecip2, int4: dayEightPrecip3, int5: dayEightPrecip4, int6: dayEightPrecip5, int7: dayEightPrecip6, int8: dayEightPrecip7)
                } else {
                    completeDayEightUISetup(int1: dayEightPrecip8, int2: dayEightPrecip9, int3: dayEightPrecip10, int4: dayEightPrecip11, int5: dayEightPrecip12, int6: dayEightPrecip13, int7: dayEightPrecip14, int8: dayEightPrecip15)
                }
            }
        } else if day == 9 {
            if dayNineSegmentControl.selectedSegmentIndex == 0 {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNinePrecip0, int2: dayNinePrecip1, int3: dayNinePrecip2, int4: dayNinePrecip3, int5: dayNinePrecip4, int6: dayNinePrecip5, int7: dayNinePrecip6, int8: dayNinePrecip7)
                } else {
                    completeDayNineUISetup(int1: dayNinePrecip8, int2: dayNinePrecip9, int3: dayNinePrecip10, int4: dayNinePrecip11, int5: dayNinePrecip12, int6: dayNinePrecip13, int7: dayNinePrecip14, int8: dayNinePrecip15)
                }
            } else if dayNineSegmentControl.selectedSegmentIndex == 1 {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineTemp0, int2: dayNineTemp1, int3: dayNineTemp2, int4: dayNineTemp3, int5: dayNineTemp4, int6: dayNineTemp5, int7: dayNineTemp6, int8: dayNineTemp7)
                } else {
                    completeDayNineUISetup(int1: dayNineTemp8, int2: dayNineTemp9, int3: dayNineTemp10, int4: dayNineTemp11, int5: dayNineTemp12, int6: dayNineTemp13, int7: dayNineTemp14, int8: dayNineTemp15)
                }
            } else if dayNineSegmentControl.selectedSegmentIndex == 2 {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineHumidity0, int2: dayNineHumidity1, int3: dayNineHumidity2, int4: dayNineHumidity3, int5: dayNineHumidity4, int6: dayNineHumidity5, int7: dayNineHumidity6, int8: dayNineHumidity7)
                } else {
                    completeDayNineUISetup(int1: dayNineHumidity8, int2: dayNineHumidity9, int3: dayNineHumidity10, int4: dayNineHumidity11, int5: dayNineHumidity12, int6: dayNineHumidity13, int7: dayNineHumidity14, int8: dayNineHumidity15)
                }
            } else if dayNineSegmentControl.selectedSegmentIndex == 3 {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineIndex0, int2: dayNineIndex1, int3: dayNineIndex2, int4: dayNineIndex3, int5: dayNineIndex4, int6: dayNineIndex5, int7: dayNineIndex6, int8: dayNineIndex7)
                } else {
                    completeDayNineUISetup(int1: dayNineIndex8, int2: dayNineIndex9, int3: dayNineIndex10, int4: dayNineIndex11, int5: dayNineIndex12, int6: dayNineIndex13, int7: dayNineIndex14, int8: dayNineIndex15)
                }
            } else if dayNineSegmentControl.selectedSegmentIndex == 4 {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineWindSpeed0, int2: dayNineWindSpeed1, int3: dayNineWindSpeed2, int4: dayNineWindSpeed3, int5: dayNineWindSpeed4, int6: dayNineWindSpeed5, int7: dayNineWindSpeed6, int8: dayNineWindSpeed7)
                } else {
                    completeDayNineUISetup(int1: dayNineWindSpeed8, int2: dayNineWindSpeed9, int3: dayNineWindSpeed10, int4: dayNineWindSpeed11, int5: dayNineWindSpeed12, int6: dayNineWindSpeed13, int7: dayNineWindSpeed14, int8: dayNineWindSpeed15)
                }
            } else if dayNineSegmentControl.selectedSegmentIndex == 5 {
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNineCloudCover0, int2: dayNineCloudCover1, int3: dayNineCloudCover2, int4: dayNineCloudCover3, int5: dayNineCloudCover4, int6: dayNineCloudCover5, int7: dayNineCloudCover6, int8: dayNineCloudCover7)
                } else {
                    completeDayNineUISetup(int1: dayNineCloudCover8, int2: dayNineCloudCover9, int3: dayNineCloudCover10, int4: dayNineCloudCover11, int5: dayNineCloudCover12, int6: dayNineCloudCover13, int7: dayNineCloudCover14, int8: dayNineCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayNinePageControl.currentPage == 0 {
                    completeDayNineUISetup(int1: dayNinePrecip0, int2: dayNinePrecip1, int3: dayNinePrecip2, int4: dayNinePrecip3, int5: dayNinePrecip4, int6: dayNinePrecip5, int7: dayNinePrecip6, int8: dayNinePrecip7)
                } else {
                    completeDayNineUISetup(int1: dayNinePrecip8, int2: dayNinePrecip9, int3: dayNinePrecip10, int4: dayNinePrecip11, int5: dayNinePrecip12, int6: dayNinePrecip13, int7: dayNinePrecip14, int8: dayNinePrecip15)
                }
            }
        } else  if day == 10 {
            if dayTenSegmentControl.selectedSegmentIndex == 0 {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenPrecip0, int2: dayTenPrecip1, int3: dayTenPrecip2, int4: dayTenPrecip3, int5: dayTenPrecip4, int6: dayTenPrecip5, int7: dayTenPrecip6, int8: dayTenPrecip7)
                } else {
                    completeDayTenUISetup(int1: dayTenPrecip8, int2: dayTenPrecip9, int3: dayTenPrecip10, int4: dayTenPrecip11, int5: dayTenPrecip12, int6: dayTenPrecip13, int7: dayTenPrecip14, int8: dayTenPrecip15)
                }
            } else if dayTenSegmentControl.selectedSegmentIndex == 1 {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenTemp0, int2: dayTenTemp1, int3: dayTenTemp2, int4: dayTenTemp3, int5: dayTenTemp4, int6: dayTenTemp5, int7: dayTenTemp6, int8: dayTenTemp7)
                } else {
                    completeDayTenUISetup(int1: dayTenTemp8, int2: dayTenTemp9, int3: dayTenTemp10, int4: dayTenTemp11, int5: dayTenTemp12, int6: dayTenTemp13, int7: dayTenTemp14, int8: dayTenTemp15)
                }
            } else if dayTenSegmentControl.selectedSegmentIndex == 2 {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenHumidity0, int2: dayTenHumidity1, int3: dayTenHumidity2, int4: dayTenHumidity3, int5: dayTenHumidity4, int6: dayTenHumidity5, int7: dayTenHumidity6, int8: dayTenHumidity7)
                } else {
                    completeDayTenUISetup(int1: dayTenHumidity8, int2: dayTenHumidity9, int3: dayTenHumidity10, int4: dayTenHumidity11, int5: dayTenHumidity12, int6: dayTenHumidity13, int7: dayTenHumidity14, int8: dayTenHumidity15)
                }
            } else if dayTenSegmentControl.selectedSegmentIndex == 3 {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenIndex0, int2: dayTenIndex1, int3: dayTenIndex2, int4: dayTenIndex3, int5: dayTenIndex4, int6: dayTenIndex5, int7: dayTenIndex6, int8: dayTenIndex7)
                } else {
                    completeDayTenUISetup(int1: dayTenIndex8, int2: dayTenIndex9, int3: dayTenIndex10, int4: dayTenIndex11, int5: dayTenIndex12, int6: dayTenIndex13, int7: dayTenIndex14, int8: dayTenIndex15)
                }
            } else if dayTenSegmentControl.selectedSegmentIndex == 4 {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenWindSpeed0, int2: dayTenWindSpeed1, int3: dayTenWindSpeed2, int4: dayTenWindSpeed3, int5: dayTenWindSpeed4, int6: dayTenWindSpeed5, int7: dayTenWindSpeed6, int8: dayTenWindSpeed7)
                } else {
                    completeDayTenUISetup(int1: dayTenWindSpeed8, int2: dayTenWindSpeed9, int3: dayTenWindSpeed10, int4: dayTenWindSpeed11, int5: dayTenWindSpeed12, int6: dayTenWindSpeed13, int7: dayTenWindSpeed14, int8: dayTenWindSpeed15)
                }
            } else if dayTenSegmentControl.selectedSegmentIndex == 5 {
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenCloudCover0, int2: dayTenCloudCover1, int3: dayTenCloudCover2, int4: dayTenCloudCover3, int5: dayTenCloudCover4, int6: dayTenCloudCover5, int7: dayTenCloudCover6, int8: dayTenCloudCover7)
                } else {
                    completeDayTenUISetup(int1: dayTenCloudCover8, int2: dayTenCloudCover9, int3: dayTenCloudCover10, int4: dayTenCloudCover11, int5: dayTenCloudCover12, int6: dayTenCloudCover13, int7: dayTenCloudCover14, int8: dayTenCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayTenPageControl.currentPage == 0 {
                    completeDayTenUISetup(int1: dayTenPrecip0, int2: dayTenPrecip1, int3: dayTenPrecip2, int4: dayTenPrecip3, int5: dayTenPrecip4, int6: dayTenPrecip5, int7: dayTenPrecip6, int8: dayTenPrecip7)
                } else {
                    completeDayTenUISetup(int1: dayTenPrecip8, int2: dayTenPrecip9, int3: dayTenPrecip10, int4: dayTenPrecip11, int5: dayTenPrecip12, int6: dayTenPrecip13, int7: dayTenPrecip14, int8: dayTenPrecip15)
                }
            }
        } else if day == 11 {
            if dayElevenSegmentControl.selectedSegmentIndex == 0 {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenPrecip0, int2: dayElevenPrecip1, int3: dayElevenPrecip2, int4: dayElevenPrecip3, int5: dayElevenPrecip4, int6: dayElevenPrecip5, int7: dayElevenPrecip6, int8: dayElevenPrecip7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenPrecip8, int2: dayElevenPrecip9, int3: dayElevenPrecip10, int4: dayElevenPrecip11, int5: dayElevenPrecip12, int6: dayElevenPrecip13, int7: dayElevenPrecip14, int8: dayElevenPrecip15)
                }
            } else if dayElevenSegmentControl.selectedSegmentIndex == 1 {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenTemp0, int2: dayElevenTemp1, int3: dayElevenTemp2, int4: dayElevenTemp3, int5: dayElevenTemp4, int6: dayElevenTemp5, int7: dayElevenTemp6, int8: dayElevenTemp7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenTemp8, int2: dayElevenTemp9, int3: dayElevenTemp10, int4: dayElevenTemp11, int5: dayElevenTemp12, int6: dayElevenTemp13, int7: dayElevenTemp14, int8: dayElevenTemp15)
                }
            } else if dayElevenSegmentControl.selectedSegmentIndex == 2 {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenHumidity0, int2: dayElevenHumidity1, int3: dayElevenHumidity2, int4: dayElevenHumidity3, int5: dayElevenHumidity4, int6: dayElevenHumidity5, int7: dayElevenHumidity6, int8: dayElevenHumidity7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenHumidity8, int2: dayElevenHumidity9, int3: dayElevenHumidity10, int4: dayElevenHumidity11, int5: dayElevenHumidity12, int6: dayElevenHumidity13, int7: dayElevenHumidity14, int8: dayElevenHumidity15)
                }
            } else if dayElevenSegmentControl.selectedSegmentIndex == 3 {
                if daySevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenIndex0, int2: dayElevenIndex1, int3: dayElevenIndex2, int4: dayElevenIndex3, int5: dayElevenIndex4, int6: dayElevenIndex5, int7: dayElevenIndex6, int8: dayElevenIndex7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenIndex8, int2: dayElevenIndex9, int3: dayElevenIndex10, int4: dayElevenIndex11, int5: dayElevenIndex12, int6: dayElevenIndex13, int7: dayElevenIndex14, int8: dayElevenIndex15)
                }
            } else if dayElevenSegmentControl.selectedSegmentIndex == 4 {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenWindSpeed0, int2: dayElevenWindSpeed1, int3: dayElevenWindSpeed2, int4: dayElevenWindSpeed3, int5: dayElevenWindSpeed4, int6: dayElevenWindSpeed5, int7: dayElevenWindSpeed6, int8: dayElevenWindSpeed7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenWindSpeed8, int2: dayElevenWindSpeed9, int3: dayElevenWindSpeed10, int4: dayElevenWindSpeed11, int5: dayElevenWindSpeed12, int6: dayElevenWindSpeed13, int7: dayElevenWindSpeed14, int8: dayElevenWindSpeed15)
                }
            } else if dayElevenSegmentControl.selectedSegmentIndex == 5 {
                if dayElevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenCloudCover0, int2: dayElevenCloudCover1, int3: dayElevenCloudCover2, int4: dayElevenCloudCover3, int5: dayElevenCloudCover4, int6: dayElevenCloudCover5, int7: dayElevenCloudCover6, int8: dayElevenCloudCover7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenCloudCover8, int2: dayElevenCloudCover9, int3: dayElevenCloudCover10, int4: dayElevenCloudCover11, int5: dayElevenCloudCover12, int6: dayElevenCloudCover13, int7: dayElevenCloudCover14, int8: dayElevenCloudCover15)
                }
            } else {
                // Default to precipitation
                if daySevenPageControl.currentPage == 0 {
                    completeDayElevenUISetup(int1: dayElevenPrecip0, int2: dayElevenPrecip1, int3: dayElevenPrecip2, int4: dayElevenPrecip3, int5: dayElevenPrecip4, int6: dayElevenPrecip5, int7: dayElevenPrecip6, int8: dayElevenPrecip7)
                } else {
                    completeDayElevenUISetup(int1: dayElevenPrecip8, int2: dayElevenPrecip9, int3: dayElevenPrecip10, int4: dayElevenPrecip11, int5: dayElevenPrecip12, int6: dayElevenPrecip13, int7: dayElevenPrecip14, int8: dayElevenPrecip15)
                }
            }
        } else if day == 12 {
            if dayTwelveSegmentControl.selectedSegmentIndex == 0 {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip0, int2: dayTwelvePrecip1, int3: dayTwelvePrecip2, int4: dayTwelvePrecip3, int5: dayTwelvePrecip4, int6: dayTwelvePrecip5, int7: dayTwelvePrecip6, int8: dayTwelvePrecip7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip8, int2: dayTwelvePrecip9, int3: dayTwelvePrecip10, int4: dayTwelvePrecip11, int5: dayTwelvePrecip12, int6: dayTwelvePrecip13, int7: dayTwelvePrecip14, int8: dayTwelvePrecip15)
                }
            } else if dayTwelveSegmentControl.selectedSegmentIndex == 1 {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveTemp0, int2: dayTwelveTemp1, int3: dayTwelveTemp2, int4: dayTwelveTemp3, int5: dayTwelveTemp4, int6: dayTwelveTemp5, int7: dayTwelveTemp6, int8: dayTwelveTemp7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveTemp8, int2: dayTwelveTemp9, int3: dayTwelveTemp10, int4: dayTwelveTemp11, int5: dayTwelveTemp12, int6: dayTwelveTemp13, int7: dayTwelveTemp14, int8: dayTwelveTemp15)
                }
            } else if dayTwelveSegmentControl.selectedSegmentIndex == 2 {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveHumidity0, int2: dayTwelveHumidity1, int3: dayTwelveHumidity2, int4: dayTwelveHumidity3, int5: dayTwelveHumidity4, int6: dayTwelveHumidity5, int7: dayTwelveHumidity6, int8: dayTwelveHumidity7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveHumidity8, int2: dayTwelveHumidity9, int3: dayTwelveHumidity10, int4: dayTwelveHumidity11, int5: dayTwelveHumidity12, int6: dayTwelveHumidity13, int7: dayTwelveHumidity14, int8: dayTwelveHumidity15)
                }
            } else if dayTwelveSegmentControl.selectedSegmentIndex == 3 {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveIndex0, int2: dayTwelveIndex1, int3: dayTwelveIndex2, int4: dayTwelveIndex3, int5: dayTwelveIndex4, int6: dayTwelveIndex5, int7: dayTwelveIndex6, int8: dayTwelveIndex7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveIndex8, int2: dayTwelveIndex9, int3: dayTwelveIndex10, int4: dayTwelveIndex11, int5: dayTwelveIndex12, int6: dayTwelveIndex13, int7: dayTwelveIndex14, int8: dayTwelveIndex15)
                }
            } else if dayTwelveSegmentControl.selectedSegmentIndex == 4 {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveWindSpeed0, int2: dayTwelveWindSpeed1, int3: dayTwelveWindSpeed2, int4: dayTwelveWindSpeed3, int5: dayTwelveWindSpeed4, int6: dayTwelveWindSpeed5, int7: dayTwelveWindSpeed6, int8: dayTwelveWindSpeed7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveWindSpeed8, int2: dayTwelveWindSpeed9, int3: dayTwelveWindSpeed10, int4: dayTwelveWindSpeed11, int5: dayTwelveWindSpeed12, int6: dayTwelveWindSpeed13, int7: dayTwelveWindSpeed14, int8: dayTwelveWindSpeed15)
                }
            } else if dayTwelveSegmentControl.selectedSegmentIndex == 5 {
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelveCloudCover0, int2: dayTwelveCloudCover1, int3: dayTwelveCloudCover2, int4: dayTwelveCloudCover3, int5: dayTwelveCloudCover4, int6: dayTwelveCloudCover5, int7: dayTwelveCloudCover6, int8: dayTwelveCloudCover7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelveCloudCover8, int2: dayTwelveCloudCover9, int3: dayTwelveCloudCover10, int4: dayTwelveCloudCover11, int5: dayTwelveCloudCover12, int6: dayTwelveCloudCover13, int7: dayTwelveCloudCover14, int8: dayTwelveCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayTwelvePageControl.currentPage == 0 {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip0, int2: dayTwelvePrecip1, int3: dayTwelvePrecip2, int4: dayTwelvePrecip3, int5: dayTwelvePrecip4, int6: dayTwelvePrecip5, int7: dayTwelvePrecip6, int8: dayTwelvePrecip7)
                } else {
                    completeDayTwelveUISetup(int1: dayTwelvePrecip8, int2: dayTwelvePrecip9, int3: dayTwelvePrecip10, int4: dayTwelvePrecip11, int5: dayTwelvePrecip12, int6: dayTwelvePrecip13, int7: dayTwelvePrecip14, int8: dayTwelvePrecip15)
                }
            }
        } else if day == 13 {
            if dayThirteenSegmentControl.selectedSegmentIndex == 0 {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip0, int2: dayThirteenPrecip1, int3: dayThirteenPrecip2, int4: dayThirteenPrecip3, int5: dayThirteenPrecip4, int6: dayThirteenPrecip5, int7: dayThirteenPrecip6, int8: dayThirteenPrecip7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip8, int2: dayThirteenPrecip9, int3: dayThirteenPrecip10, int4: dayThirteenPrecip11, int5: dayThirteenPrecip12, int6: dayThirteenPrecip13, int7: dayThirteenPrecip14, int8: dayThirteenPrecip15)
                }
            } else if dayThirteenSegmentControl.selectedSegmentIndex == 1 {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenTemp0, int2: dayThirteenTemp1, int3: dayThirteenTemp2, int4: dayThirteenTemp3, int5: dayThirteenTemp4, int6: dayThirteenTemp5, int7: dayThirteenTemp6, int8: dayThirteenTemp7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenTemp8, int2: dayThirteenTemp9, int3: dayThirteenTemp10, int4: dayThirteenTemp11, int5: dayThirteenTemp12, int6: dayThirteenTemp13, int7: dayThirteenTemp14, int8: dayThirteenTemp15)
                }
            } else if dayThirteenSegmentControl.selectedSegmentIndex == 2 {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenHumidity0, int2: dayThirteenHumidity1, int3: dayThirteenHumidity2, int4: dayThirteenHumidity3, int5: dayThirteenHumidity4, int6: dayThirteenHumidity5, int7: dayThirteenHumidity6, int8: dayThirteenHumidity7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenHumidity8, int2: dayThirteenHumidity9, int3: dayThirteenHumidity10, int4: dayThirteenHumidity11, int5: dayThirteenHumidity12, int6: dayThirteenHumidity13, int7: dayThirteenHumidity14, int8: dayThirteenHumidity15)
                }
            } else if dayThirteenSegmentControl.selectedSegmentIndex == 3 {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenIndex0, int2: dayThirteenIndex1, int3: dayThirteenIndex2, int4: dayThirteenIndex3, int5: dayThirteenIndex4, int6: dayThirteenIndex5, int7: dayThirteenIndex6, int8: dayThirteenIndex7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenIndex8, int2: dayThirteenIndex9, int3: dayThirteenIndex10, int4: dayThirteenIndex11, int5: dayThirteenIndex12, int6: dayThirteenIndex13, int7: dayThirteenIndex14, int8: dayThirteenIndex15)
                }
            } else if dayThirteenSegmentControl.selectedSegmentIndex == 4 {
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenWindSpeed0, int2: dayThirteenWindSpeed1, int3: dayThirteenWindSpeed2, int4: dayThirteenWindSpeed3, int5: dayThirteenWindSpeed4, int6: dayThirteenWindSpeed5, int7: dayThirteenWindSpeed6, int8: dayThirteenWindSpeed7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenWindSpeed8, int2: dayThirteenWindSpeed9, int3: dayThirteenWindSpeed10, int4: dayThirteenWindSpeed11, int5: dayThirteenWindSpeed12, int6: dayThirteenWindSpeed13, int7: dayThirteenWindSpeed14, int8: dayThirteenWindSpeed15)
                }
            } else if dayThirteenSegmentControl.selectedSegmentIndex == 5 {
                if daySevenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenCloudCover0, int2: dayThirteenCloudCover1, int3: dayThirteenCloudCover2, int4: dayThirteenCloudCover3, int5: dayThirteenCloudCover4, int6: dayThirteenCloudCover5, int7: dayThirteenCloudCover6, int8: dayThirteenCloudCover7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenCloudCover8, int2: dayThirteenCloudCover9, int3: dayThirteenCloudCover10, int4: dayThirteenCloudCover11, int5: dayThirteenCloudCover12, int6: dayThirteenCloudCover13, int7: dayThirteenCloudCover14, int8: dayThirteenCloudCover15)
                }
            } else {
                // Default to precipitation
                if dayThirteenPageControl.currentPage == 0 {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip0, int2: dayThirteenPrecip1, int3: dayThirteenPrecip2, int4: dayThirteenPrecip3, int5: dayThirteenPrecip4, int6: dayThirteenPrecip5, int7: dayThirteenPrecip6, int8: dayThirteenPrecip7)
                } else {
                    completeDayThirteenUISetup(int1: dayThirteenPrecip8, int2: dayThirteenPrecip9, int3: dayThirteenPrecip10, int4: dayThirteenPrecip11, int5: dayThirteenPrecip12, int6: dayThirteenPrecip13, int7: dayThirteenPrecip14, int8: dayThirteenPrecip15)
                }
            }
        } else if day == 14 {
               if hourlySegmentControl.selectedSegmentIndex == 0 {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: precipHour0, int2: precipHour1, int3: precipHour2, int4: precipHour3, int5: precipHour4, int6: precipHour5, int7: precipHour6, int8: precipHour7)
                   } else {
                       completeHourlyUISetup(int1: precipHour8, int2: precipHour9, int3: precipHour10, int4: precipHour11, int5: precipHour12, int6: precipHour13, int7: precipHour14, int8: precipHour15)
                   }
               } else if hourlySegmentControl.selectedSegmentIndex == 1 {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: tempHour0, int2: tempHour1, int3: tempHour2, int4: tempHour3, int5: tempHour4, int6: tempHour5, int7: tempHour6, int8: tempHour7)
                   } else {
                       completeHourlyUISetup(int1: tempHour8, int2: tempHour9, int3: tempHour10, int4: tempHour11, int5: tempHour12, int6: tempHour13, int7: tempHour14, int8: tempHour15)
                   }
               } else if hourlySegmentControl.selectedSegmentIndex == 2 {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: humidityHour0, int2: humidityHour1, int3: humidityHour2, int4: humidityHour3, int5: humidityHour4, int6: humidityHour5, int7: humidityHour6, int8: humidityHour7)
                   } else {
                       completeHourlyUISetup(int1: humidityHour8, int2: humidityHour9, int3: humidityHour10, int4: humidityHour11, int5: humidityHour12, int6: humidityHour13, int7: humidityHour14, int8: humidityHour15)
                   }
               } else if hourlySegmentControl.selectedSegmentIndex == 3 {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: uvindexHour0, int2: uvindexHour1, int3: uvindexHour2, int4: uvindexHour3, int5: uvindexHour4, int6: uvindexHour5, int7: uvindexHour6, int8: uvindexHour7)
                   } else {
                       completeHourlyUISetup(int1: uvindexHour8, int2: uvindexHour9, int3: uvindexHour10, int4: uvindexHour11, int5: uvindexHour12, int6: uvindexHour13, int7: uvindexHour14, int8: uvindexHour15)
                   }
               } else if hourlySegmentControl.selectedSegmentIndex == 4 {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: windSpeedHour0, int2: windSpeedHour1, int3: windSpeedHour2, int4: windSpeedHour3, int5: windSpeedHour4, int6: windSpeedHour5, int7: windSpeedHour6, int8: windSpeedHour7)
                   } else {
                       completeHourlyUISetup(int1: windSpeedHour8, int2: windSpeedHour9, int3: windSpeedHour10, int4: windSpeedHour11, int5: windSpeedHour12, int6: windSpeedHour13, int7: windSpeedHour14, int8: windSpeedHour15)
                   }
               } else if hourlySegmentControl.selectedSegmentIndex == 5 {
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: cloudCoverHour0, int2: cloudCoverHour1, int3: cloudCoverHour2, int4: cloudCoverHour3, int5: cloudCoverHour4, int6: cloudCoverHour5, int7: cloudCoverHour6, int8: cloudCoverHour7)
                   } else {
                       completeHourlyUISetup(int1: cloudCoverHour8, int2: cloudCoverHour9, int3: cloudCoverHour10, int4: cloudCoverHour11, int5: cloudCoverHour12, int6: cloudCoverHour13, int7: cloudCoverHour14, int8: cloudCoverHour15)
                   }
               } else {
                   // Default to precipitation
                   if hourlyPageControl.currentPage == 0 {
                       completeHourlyUISetup(int1: precipHour0, int2: precipHour1, int3: precipHour2, int4: precipHour3, int5: precipHour4, int6: precipHour5, int7: precipHour6, int8: precipHour7)
                   } else {
                       completeHourlyUISetup(int1: precipHour8, int2: precipHour9, int3: precipHour10, int4: precipHour11, int5: precipHour12, int6: precipHour13, int7: precipHour14, int8: precipHour15)
                   }
               }
           }
    }
    
    // MARK: - Set up hourly values for daily and hourly forecasts
    func hourSetup(conditionImage: UIImageView!, conditionImageType: String, conditionValueText: UILabel!, conditionValue: Int, image: UIImageView!, timeText: UILabel!, timeValue: String, height: NSLayoutConstraint!) {
        conditionImage.image = UIImage(named: weatherCondition(condition: conditionImageType, type: "image"))
        conditionValueText.text = "\(conditionValue)"
        image.image = UIImage(named: "Rectangle \(buttonColor).pdf")
        timeText.text = "\(timeValue)"
        height.constant = CGFloat(hourlyValue(value: conditionValue))
    }
    
    func completeHourlyUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: int1, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
        hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: int2, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
        hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: int3, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
        hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: int4, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
        hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: int5, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
        hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: int6, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
        hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: int7, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
        hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: int8, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
    }
    
    func completeDayZeroUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: int1, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
        hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: int2, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
        hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: int3, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
        hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: int4, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
        hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: int5, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
        hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: int6, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
        hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: int7, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
        hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: int8, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
    }
    
    func completeDayOneUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: int1, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
        hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: int2, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
        hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: int3, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
        hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: int4, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
        hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: int5, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
        hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: int6, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
        hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: int7, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
        hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: int8, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
    }
    
    func completeDayTwoUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: int1, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
        hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: int2, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
        hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: int3, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
        hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: int4, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
        hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: int5, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
        hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: int6, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
        hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: int7, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
        hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: int8, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
    }
    
    func completeDayThreeUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: int1, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
        hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: int2, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
        hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: int3, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
        hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: int4, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
        hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: int5, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
        hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: int6, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
        hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: int7, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
        hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: int8, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
    }
    
    func completeDayFourUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: int1, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
        hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: int2, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
        hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: int3, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
        hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: int4, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
        hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: int5, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
        hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: int6, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
        hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: int7, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
        hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: int8, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
    }
    
    func completeDayFiveUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: int1, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
        hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: int2, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
        hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: int3, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
        hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: int4, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
        hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: int5, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
        hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: int6, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
        hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: int7, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
        hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: int8, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
    }
    
    func completeDaySixUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: int1, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
        hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: int2, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
        hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: int3, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
        hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: int4, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
        hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: int5, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
        hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: int6, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
        hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: int7, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
        hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: int8, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
    }
    
    func completeDaySevenUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: int1, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
        hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: int2, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
        hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: int3, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
        hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: int4, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
        hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: int5, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
        hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: int6, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
        hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: int7, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
        hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: int8, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
    }
    
    func completeDayEightUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayEightHour0Condition, conditionImageType: dayEightCondition0, conditionValueText: dayEightHour0ValueText, conditionValue: int1, image: dayEightHour0Image, timeText: dayEightHour0Time, timeValue: dayEightTime0, height: dayEightHour0ValueHeight)
        hourSetup(conditionImage: dayEightHour1Condition, conditionImageType: dayEightCondition1, conditionValueText: dayEightHour1ValueText, conditionValue: int2, image: dayEightHour1Image, timeText: dayEightHour1Time, timeValue: dayEightTime1, height: dayEightHour1ValueHeight)
        hourSetup(conditionImage: dayEightHour2Condition, conditionImageType: dayEightCondition2, conditionValueText: dayEightHour2ValueText, conditionValue: int3, image: dayEightHour2Image, timeText: dayEightHour2Time, timeValue: dayEightTime2, height: dayEightHour2ValueHeight)
        hourSetup(conditionImage: dayEightHour3Condition, conditionImageType: dayEightCondition3, conditionValueText: dayEightHour3ValueText, conditionValue: int4, image: dayEightHour3Image, timeText: dayEightHour3Time, timeValue: dayEightTime3, height: dayEightHour3ValueHeight)
        hourSetup(conditionImage: dayEightHour4Condition, conditionImageType: dayEightCondition4, conditionValueText: dayEightHour4ValueText, conditionValue: int5, image: dayEightHour4Image, timeText: dayEightHour4Time, timeValue: dayEightTime4, height: dayEightHour4ValueHeight)
        hourSetup(conditionImage: dayEightHour5Condition, conditionImageType: dayEightCondition5, conditionValueText: dayEightHour5ValueText, conditionValue: int6, image: dayEightHour5Image, timeText: dayEightHour5Time, timeValue: dayEightTime5, height: dayEightHour5ValueHeight)
        hourSetup(conditionImage: dayEightHour6Condition, conditionImageType: dayEightCondition6, conditionValueText: dayEightHour6ValueText, conditionValue: int7, image: dayEightHour6Image, timeText: dayEightHour6Time, timeValue: dayEightTime6, height: dayEightHour6ValueHeight)
        hourSetup(conditionImage: dayEightHour7Condition, conditionImageType: dayEightCondition7, conditionValueText: dayEightHour7ValueText, conditionValue: int8, image: dayEightHour7Image, timeText: dayEightHour7Time, timeValue: dayEightTime7, height: dayEightHour7ValueHeight)
    }
    
    func completeDayNineUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayNineHour0Condition, conditionImageType: dayNineCondition0, conditionValueText: dayNineHour0ValueText, conditionValue: int1, image: dayNineHour0Image, timeText: dayNineHour0Time, timeValue: dayNineTime0, height: dayNineHour0ValueHeight)
        hourSetup(conditionImage: dayNineHour1Condition, conditionImageType: dayNineCondition1, conditionValueText: dayNineHour1ValueText, conditionValue: int2, image: dayNineHour1Image, timeText: dayNineHour1Time, timeValue: dayNineTime1, height: dayNineHour1ValueHeight)
        hourSetup(conditionImage: dayNineHour2Condition, conditionImageType: dayNineCondition2, conditionValueText: dayNineHour2ValueText, conditionValue: int3, image: dayNineHour2Image, timeText: dayNineHour2Time, timeValue: dayNineTime2, height: dayNineHour2ValueHeight)
        hourSetup(conditionImage: dayNineHour3Condition, conditionImageType: dayNineCondition3, conditionValueText: dayNineHour3ValueText, conditionValue: int4, image: dayNineHour3Image, timeText: dayNineHour3Time, timeValue: dayNineTime3, height: dayNineHour3ValueHeight)
        hourSetup(conditionImage: dayNineHour4Condition, conditionImageType: dayNineCondition4, conditionValueText: dayNineHour4ValueText, conditionValue: int5, image: dayNineHour4Image, timeText: dayNineHour4Time, timeValue: dayNineTime4, height: dayNineHour4ValueHeight)
        hourSetup(conditionImage: dayNineHour5Condition, conditionImageType: dayNineCondition5, conditionValueText: dayNineHour5ValueText, conditionValue: int6, image: dayNineHour5Image, timeText: dayNineHour5Time, timeValue: dayNineTime5, height: dayNineHour5ValueHeight)
        hourSetup(conditionImage: dayNineHour6Condition, conditionImageType: dayNineCondition6, conditionValueText: dayNineHour6ValueText, conditionValue: int7, image: dayNineHour6Image, timeText: dayNineHour6Time, timeValue: dayNineTime6, height: dayNineHour6ValueHeight)
        hourSetup(conditionImage: dayNineHour7Condition, conditionImageType: dayNineCondition7, conditionValueText: dayNineHour7ValueText, conditionValue: int8, image: dayNineHour7Image, timeText: dayNineHour7Time, timeValue: dayNineTime7, height: dayNineHour7ValueHeight)
    }
    
    func completeDayTenUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayTenHour0Condition, conditionImageType: dayTenCondition0, conditionValueText: dayTenHour0ValueText, conditionValue: int1, image: dayTenHour0Image, timeText: dayTenHour0Time, timeValue: dayTenTime0, height: dayTenHour0ValueHeight)
        hourSetup(conditionImage: dayTenHour1Condition, conditionImageType: dayTenCondition1, conditionValueText: dayTenHour1ValueText, conditionValue: int2, image: dayTenHour1Image, timeText: dayTenHour1Time, timeValue: dayTenTime1, height: dayTenHour1ValueHeight)
        hourSetup(conditionImage: dayTenHour2Condition, conditionImageType: dayTenCondition2, conditionValueText: dayTenHour2ValueText, conditionValue: int3, image: dayTenHour2Image, timeText: dayTenHour2Time, timeValue: dayTenTime2, height: dayTenHour2ValueHeight)
        hourSetup(conditionImage: dayTenHour3Condition, conditionImageType: dayTenCondition3, conditionValueText: dayTenHour3ValueText, conditionValue: int4, image: dayTenHour3Image, timeText: dayTenHour3Time, timeValue: dayTenTime3, height: dayTenHour3ValueHeight)
        hourSetup(conditionImage: dayTenHour4Condition, conditionImageType: dayTenCondition4, conditionValueText: dayTenHour4ValueText, conditionValue: int5, image: dayTenHour4Image, timeText: dayTenHour4Time, timeValue: dayTenTime4, height: dayTenHour4ValueHeight)
        hourSetup(conditionImage: dayTenHour5Condition, conditionImageType: dayTenCondition5, conditionValueText: dayTenHour5ValueText, conditionValue: int6, image: dayTenHour5Image, timeText: dayTenHour5Time, timeValue: dayTenTime5, height: dayTenHour5ValueHeight)
        hourSetup(conditionImage: dayTenHour6Condition, conditionImageType: dayTenCondition6, conditionValueText: dayTenHour6ValueText, conditionValue: int7, image: dayTenHour6Image, timeText: dayTenHour6Time, timeValue: dayTenTime6, height: dayTenHour6ValueHeight)
        hourSetup(conditionImage: dayTenHour7Condition, conditionImageType: dayTenCondition7, conditionValueText: dayTenHour7ValueText, conditionValue: int8, image: dayTenHour7Image, timeText: dayTenHour7Time, timeValue: dayTenTime7, height: dayTenHour7ValueHeight)
    }
    
    func completeDayElevenUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayElevenHour0Condition, conditionImageType: dayElevenCondition0, conditionValueText: dayElevenHour0ValueText, conditionValue: int1, image: dayElevenHour0Image, timeText: dayElevenHour0Time, timeValue: dayElevenTime0, height: dayElevenHour0ValueHeight)
        hourSetup(conditionImage: dayElevenHour1Condition, conditionImageType: dayElevenCondition1, conditionValueText: dayElevenHour1ValueText, conditionValue: int2, image: dayElevenHour1Image, timeText: dayElevenHour1Time, timeValue: dayElevenTime1, height: dayElevenHour1ValueHeight)
        hourSetup(conditionImage: dayElevenHour2Condition, conditionImageType: dayElevenCondition2, conditionValueText: dayElevenHour2ValueText, conditionValue: int3, image: dayElevenHour2Image, timeText: dayElevenHour2Time, timeValue: dayElevenTime2, height: dayElevenHour2ValueHeight)
        hourSetup(conditionImage: dayElevenHour3Condition, conditionImageType: dayElevenCondition3, conditionValueText: dayElevenHour3ValueText, conditionValue: int4, image: dayElevenHour3Image, timeText: dayElevenHour3Time, timeValue: dayElevenTime3, height: dayElevenHour3ValueHeight)
        hourSetup(conditionImage: dayElevenHour4Condition, conditionImageType: dayElevenCondition4, conditionValueText: dayElevenHour4ValueText, conditionValue: int5, image: dayElevenHour4Image, timeText: dayElevenHour4Time, timeValue: dayElevenTime4, height: dayElevenHour4ValueHeight)
        hourSetup(conditionImage: dayElevenHour5Condition, conditionImageType: dayElevenCondition5, conditionValueText: dayElevenHour5ValueText, conditionValue: int6, image: dayElevenHour5Image, timeText: dayElevenHour5Time, timeValue: dayElevenTime5, height: dayElevenHour5ValueHeight)
        hourSetup(conditionImage: dayElevenHour6Condition, conditionImageType: dayElevenCondition6, conditionValueText: dayElevenHour6ValueText, conditionValue: int7, image: dayElevenHour6Image, timeText: dayElevenHour6Time, timeValue: dayElevenTime6, height: dayElevenHour6ValueHeight)
        hourSetup(conditionImage: dayElevenHour7Condition, conditionImageType: dayElevenCondition7, conditionValueText: dayElevenHour7ValueText, conditionValue: int8, image: dayElevenHour7Image, timeText: dayElevenHour7Time, timeValue: dayElevenTime7, height: dayElevenHour7ValueHeight)
    }
    
    func completeDayTwelveUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayTwelveHour0Condition, conditionImageType: dayTwelveCondition0, conditionValueText: dayTwelveHour0ValueText, conditionValue: int1, image: dayTwelveHour0Image, timeText: dayTwelveHour0Time, timeValue: dayTwelveTime0, height: dayTwelveHour0ValueHeight)
        hourSetup(conditionImage: dayTwelveHour1Condition, conditionImageType: dayTwelveCondition1, conditionValueText: dayTwelveHour1ValueText, conditionValue: int2, image: dayTwelveHour1Image, timeText: dayTwelveHour1Time, timeValue: dayTwelveTime1, height: dayTwelveHour1ValueHeight)
        hourSetup(conditionImage: dayTwelveHour2Condition, conditionImageType: dayTwelveCondition2, conditionValueText: dayTwelveHour2ValueText, conditionValue: int3, image: dayTwelveHour2Image, timeText: dayTwelveHour2Time, timeValue: dayTwelveTime2, height: dayTwelveHour2ValueHeight)
        hourSetup(conditionImage: dayTwelveHour3Condition, conditionImageType: dayTwelveCondition3, conditionValueText: dayTwelveHour3ValueText, conditionValue: int4, image: dayTwelveHour3Image, timeText: dayTwelveHour3Time, timeValue: dayTwelveTime3, height: dayTwelveHour3ValueHeight)
        hourSetup(conditionImage: dayTwelveHour4Condition, conditionImageType: dayTwelveCondition4, conditionValueText: dayTwelveHour4ValueText, conditionValue: int5, image: dayTwelveHour4Image, timeText: dayTwelveHour4Time, timeValue: dayTwelveTime4, height: dayTwelveHour4ValueHeight)
        hourSetup(conditionImage: dayTwelveHour5Condition, conditionImageType: dayTwelveCondition5, conditionValueText: dayTwelveHour5ValueText, conditionValue: int6, image: dayTwelveHour5Image, timeText: dayTwelveHour5Time, timeValue: dayTwelveTime5, height: dayTwelveHour5ValueHeight)
        hourSetup(conditionImage: dayTwelveHour6Condition, conditionImageType: dayTwelveCondition6, conditionValueText: dayTwelveHour6ValueText, conditionValue: int7, image: dayTwelveHour6Image, timeText: dayTwelveHour6Time, timeValue: dayTwelveTime6, height: dayTwelveHour6ValueHeight)
        hourSetup(conditionImage: dayTwelveHour7Condition, conditionImageType: dayTwelveCondition7, conditionValueText: dayTwelveHour7ValueText, conditionValue: int8, image: dayTwelveHour7Image, timeText: dayTwelveHour7Time, timeValue: dayTwelveTime7, height: dayTwelveHour7ValueHeight)
    }
    
    func completeDayThirteenUISetup(int1: Int, int2: Int, int3: Int, int4: Int, int5: Int, int6: Int, int7: Int, int8: Int) {
        hourSetup(conditionImage: dayThirteenHour0Condition, conditionImageType: dayThirteenCondition0, conditionValueText: dayThirteenHour0ValueText, conditionValue: int1, image: dayThirteenHour0Image, timeText: dayThirteenHour0Time, timeValue: dayThirteenTime0, height: dayThirteenHour0ValueHeight)
        hourSetup(conditionImage: dayThirteenHour1Condition, conditionImageType: dayThirteenCondition1, conditionValueText: dayThirteenHour1ValueText, conditionValue: int2, image: dayThirteenHour1Image, timeText: dayThirteenHour1Time, timeValue: dayThirteenTime1, height: dayThirteenHour1ValueHeight)
        hourSetup(conditionImage: dayThirteenHour2Condition, conditionImageType: dayThirteenCondition2, conditionValueText: dayThirteenHour2ValueText, conditionValue: int3, image: dayThirteenHour2Image, timeText: dayThirteenHour2Time, timeValue: dayThirteenTime2, height: dayThirteenHour2ValueHeight)
        hourSetup(conditionImage: dayThirteenHour3Condition, conditionImageType: dayThirteenCondition3, conditionValueText: dayThirteenHour3ValueText, conditionValue: int4, image: dayThirteenHour3Image, timeText: dayThirteenHour3Time, timeValue: dayThirteenTime3, height: dayThirteenHour3ValueHeight)
        hourSetup(conditionImage: dayThirteenHour4Condition, conditionImageType: dayThirteenCondition4, conditionValueText: dayThirteenHour4ValueText, conditionValue: int5, image: dayThirteenHour4Image, timeText: dayThirteenHour4Time, timeValue: dayThirteenTime4, height: dayThirteenHour4ValueHeight)
        hourSetup(conditionImage: dayThirteenHour5Condition, conditionImageType: dayThirteenCondition5, conditionValueText: dayThirteenHour5ValueText, conditionValue: int6, image: dayThirteenHour5Image, timeText: dayThirteenHour5Time, timeValue: dayThirteenTime5, height: dayThirteenHour5ValueHeight)
        hourSetup(conditionImage: dayThirteenHour6Condition, conditionImageType: dayThirteenCondition6, conditionValueText: dayThirteenHour6ValueText, conditionValue: int7, image: dayThirteenHour6Image, timeText: dayThirteenHour6Time, timeValue: dayThirteenTime6, height: dayThirteenHour6ValueHeight)
        hourSetup(conditionImage: dayThirteenHour7Condition, conditionImageType: dayThirteenCondition7, conditionValueText: dayThirteenHour7ValueText, conditionValue: int8, image: dayThirteenHour7Image, timeText: dayThirteenHour7Time, timeValue: dayThirteenTime7, height: dayThirteenHour7ValueHeight)
    }

    // MARK: - Set day labels 0-7
    func setDayLabelText(dayLabel: UILabel!, highLowLabel: UILabel!, precipLabel: UILabel!, summaryTextView: UITextView!, stackView: UIStackView!, dayString: String, dateString: String, summary: String, sunrise: String, sunset: String, dayHigh: Int, dayLow: Int, dayPrecip: Int, precipAccum: Double, conditionValue: Any) {
        dayLabel.text = "\(dayString)\n\(dateString)"
        if stackView.isHidden == true {
            highLowLabel.text = "\(dayHigh)°↑ \(dayLow)°↓"
            precipLabel.text = "\(defaultDailyConditionValueType) \(conditionValue)\(defaultDailyConditionValueUnit)"
            summaryTextView.text = "\(summary)"
        } else {
            highLowLabel.text = ""
            precipLabel.text = "\(dayHigh)°↑ \(dayLow)°↓"
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
        setDayLabelText(dayLabel: dayTenDay, highLowLabel: dayTenHighLow, precipLabel: dayTenPrecipitation, summaryTextView: dayTenSummary, stackView: dayTenStackView, dayString: dayTenDayString, dateString: dayTenDateString, summary: dayTenSummaryString, sunrise: dayTenSunrise, sunset: dayTenSunset, dayHigh: dayTenHigh, dayLow: dayTenLow, dayPrecip: dayTenPrecip, precipAccum: dayTenPrecipAccum, conditionValue: dayTenConditionValue)
        setDayLabelText(dayLabel: dayElevenDay, highLowLabel: dayElevenHighLow, precipLabel: dayElevenPrecipitation, summaryTextView: dayElevenSummary, stackView: dayElevenStackView, dayString: dayElevenDayString, dateString: dayElevenDateString, summary: dayElevenSummaryString, sunrise: dayElevenSunrise, sunset: dayElevenSunset, dayHigh: dayElevenHigh, dayLow: dayElevenLow, dayPrecip: dayElevenPrecip, precipAccum: dayElevenPrecipAccum, conditionValue: dayElevenConditionValue)
        setDayLabelText(dayLabel: dayTwelveDay, highLowLabel: dayTwelveHighLow, precipLabel: dayTwelvePrecipitation, summaryTextView: dayTwelveSummary, stackView: dayTwelveStackView, dayString: dayTwelveDayString, dateString: dayTwelveDateString, summary: dayTwelveSummaryString, sunrise: dayTwelveSunrise, sunset: dayTwelveSunset, dayHigh: dayTwelveHigh, dayLow: dayTwelveLow, dayPrecip: dayTwelvePrecip, precipAccum: dayTwelvePrecipAccum, conditionValue: dayTwelveConditionValue)
        setDayLabelText(dayLabel: dayThirteenDay, highLowLabel: dayThirteenHighLow, precipLabel: dayThirteenPrecipitation, summaryTextView: dayThirteenSummary, stackView: dayThirteenStackView, dayString: dayThirteenDayString, dateString: dayThirteenDateString, summary: dayThirteenSummaryString, sunrise: dayThirteenSunrise, sunset: dayThirteenSunset, dayHigh: dayThirteenHigh, dayLow: dayThirteenLow, dayPrecip: dayThirteenPrecip, precipAccum: dayThirteenPrecipAccum, conditionValue: dayThirteenConditionValue)
    }
    
    // MARK: - Action to open weather alerts
    @IBAction func weatherAlertsButtonTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: alertURI)!)
        present(svc, animated: true, completion: nil)
    }
    
    // MARK: - Actions for changing hourly forecast
    @IBAction func hourlySegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 14)
    }
    
    @IBAction func hourlyPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 14)
    }
    @IBAction func hourlyNextPageTapped(_ sender: UITapGestureRecognizer) {
        if hourlyPageControl.currentPage == 0 {
            hourlyPageControl.currentPage = 1
        } else if hourlyPageControl.currentPage == 1 {
            hourlyPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 14)
    }
    
    @IBAction func dayZeroSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 0)
    }
    @IBAction func dayZeroPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 0)
    }
    @IBAction func dayZeroNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayZeroPageControl.currentPage == 0 {
            dayZeroPageControl.currentPage = 1
        } else if dayZeroPageControl.currentPage == 1 {
            dayZeroPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 0)
    }
    
    @IBAction func dayOneSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 1)
    }
    @IBAction func dayOnePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 1)
    }
    @IBAction func dayOneNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayOnePageControl.currentPage == 0 {
            dayOnePageControl.currentPage = 1
        } else if dayOnePageControl.currentPage == 1 {
            dayOnePageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 1)
    }
    
    @IBAction func dayTwoSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 2)
    }
    @IBAction func dayTwoPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 2)
    }
    @IBAction func dayTwoNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayTwoPageControl.currentPage == 0 {
            dayTwoPageControl.currentPage = 1
        } else if dayTwoPageControl.currentPage == 1 {
            dayTwoPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 2)
    }
    
    @IBAction func dayThreeSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 3)
    }
    @IBAction func dayThreePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 3)
    }
    @IBAction func dayThreeNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayThreePageControl.currentPage == 0 {
            dayThreePageControl.currentPage = 1
        } else if dayThreePageControl.currentPage == 1 {
            dayThreePageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 3)
    }
    
    @IBAction func dayFourSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 4)
    }
    @IBAction func dayFourPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 4)
    }
    @IBAction func dayFourNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayFourPageControl.currentPage == 0 {
            dayFourPageControl.currentPage = 1
        } else if dayFourPageControl.currentPage == 1 {
            dayFourPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 4)
    }
    
    @IBAction func dayFiveSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 5)
    }
    @IBAction func dayFivePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 5)
    }
    @IBAction func dayFiveNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayFivePageControl.currentPage == 0 {
            dayFivePageControl.currentPage = 1
        } else if dayFivePageControl.currentPage == 1 {
            dayFivePageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 5)
    }
    
    @IBAction func daySixSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 6)
    }
    @IBAction func daySixPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 6)
    }
    @IBAction func daySixNextPageTapped(_ sender: UITapGestureRecognizer) {
        if daySixPageControl.currentPage == 0 {
            daySixPageControl.currentPage = 1
        } else if daySixPageControl.currentPage == 1 {
            daySixPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 6)
    }
    
    @IBAction func daySevenSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 7)
    }
    @IBAction func daySevenPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 7)
    }
    @IBAction func daySevenNextPageTapped(_ sender: UITapGestureRecognizer) {
        if daySevenPageControl.currentPage == 0 {
            daySevenPageControl.currentPage = 1
        } else if daySevenPageControl.currentPage == 1 {
            daySevenPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 7)
    }
    
    @IBAction func dayEightSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 8)
    }
    @IBAction func dayEightPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 8)
    }
    @IBAction func dayEightNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayEightPageControl.currentPage == 0 {
            dayEightPageControl.currentPage = 1
        } else if dayEightPageControl.currentPage == 1 {
            dayEightPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 8)
    }
    
    @IBAction func dayNineSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 9)
    }
    @IBAction func dayNinePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 9)
    }
    @IBAction func dayNineNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayNinePageControl.currentPage == 0 {
            dayNinePageControl.currentPage = 1
        } else if dayNinePageControl.currentPage == 1 {
            dayNinePageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 9)
    }
    
    @IBAction func dayTenSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 10)
    }
    @IBAction func dayTenPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 10)
    }
    @IBAction func dayTenNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayTenPageControl.currentPage == 0 {
            dayTenPageControl.currentPage = 1
        } else if dayTenPageControl.currentPage == 1 {
            dayTenPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 10)
    }
    
    @IBAction func dayElevenSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 11)
    }
    @IBAction func dayElevenPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 11)
    }
    @IBAction func dayElevenNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayElevenPageControl.currentPage == 0 {
            dayElevenPageControl.currentPage = 1
        } else if dayElevenPageControl.currentPage == 1 {
            dayElevenPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 11)
    }
    
    @IBAction func dayTwelveSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 12)
    }
    @IBAction func dayTwelvePageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 12)
    }
    @IBAction func dayTwelveNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayTwelvePageControl.currentPage == 0 {
            dayTwelvePageControl.currentPage = 1
        } else if dayTwelvePageControl.currentPage == 1 {
            dayTwelvePageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 12)
    }
    
    @IBAction func dayThirteenSegmentControlTapped(_ sender: UISegmentedControl) {
        setHourlyConditionTextOnGesture(day: 13)
    }
    @IBAction func dayThirteenPageControlTapped(_ sender: UIPageControl) {
        setHourlyConditionTextOnGesture(day: 13)
    }
    @IBAction func dayThirteenNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayThirteenPageControl.currentPage == 0 {
            dayThirteenPageControl.currentPage = 1
        } else if dayThirteenPageControl.currentPage == 1 {
            dayThirteenPageControl.currentPage = 0
        }
        setHourlyConditionTextOnGesture(day: 13)
    }
    
    // MARK: - Action to show extended daily forecasts
    func setupDayStackView(stackview: UIStackView, day: Int) {
        if stackview.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                stackview.isHidden = false
                self.setHourlyConditionTextForDay(day: day)
            }
        } else {
            stackview.isHidden = true
        }
        self.setDayLabels()
    }
    
    @IBAction func dayZeroGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayZeroStackView, day: 0)
    }
    @IBAction func dayOneGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayOneStackView, day: 1)
    }
    @IBAction func dayTwoGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayTwoStackView, day: 2)
    }
    @IBAction func dayThreeGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayThreeStackView, day: 3)
    }
    @IBAction func dayFourGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayFourStackView, day: 4)
    }
    @IBAction func dayFiveGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayFiveStackView, day: 5)
    }
    @IBAction func daySixGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: daySixStackView, day: 6)
    }
    @IBAction func daySevenGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: daySevenStackView, day: 7)
    }
    @IBAction func dayEightGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayEightStackView, day: 8)
    }
    @IBAction func dayNineGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayNineStackView, day: 9)
    }
    @IBAction func dayTenGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayTenStackView, day: 10)
    }
    @IBAction func dayElevenGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayElevenStackView, day: 11)
    }
    @IBAction func dayTwelveGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayTwelveStackView, day: 12)
    }
    @IBAction func dayThirteenGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayThirteenStackView, day: 13)
    }
    
    // MARK: - Check pressure levels and set label
    func checkHighPressure(current: Int, type: String) {
        if current > pressureHour1 || current > pressureHour2 || current > current || current > pressureHour4 {
            currentCondition2Label.text = "Pressure: \n\(current) \(unitsPressure), falling"
        } else if current < pressureHour1 || current < pressureHour2 || current < pressureHour3 || current < pressureHour4 {
            currentCondition2Label.text = "Pressure: \n\(current) \(unitsPressure), rising"
        } else {
            currentCondition2Label.text = "Pressure: \n\(current) \(unitsPressure)"
        }
    }
    
    // MARK: - Set current condition labels
    func setCurrentConditionLabels() {
        // Set temperature image and label
        currentCondition1Label.text = "Temperature: \n\(highTemperature)°↑ \(lowTemperature)°↓"
        if defaults.bool(forKey: "weatherUnitsUSA") == true {
            if currentTemperature >= 80 {
                currentCondition1Image.image = UIImage(named: "Temperature high.pdf")
            } else if currentTemperature < 80 && currentTemperature >= 50 {
                currentCondition1Image.image = UIImage(named: "Temperature moderate.pdf")
            } else if currentTemperature < 50 {
                currentCondition1Image.image = UIImage(named: "Temperature low.pdf")
            }
        } else {
            if currentTemperature >= 26 {
                currentCondition1Image.image = UIImage(named: "Temperature high.pdf")
            } else if currentTemperature < 26 && currentTemperature >= 10 {
                currentCondition1Image.image = UIImage(named: "Temperature moderate.pdf")
            } else if currentTemperature < 10 {
                currentCondition1Image.image = UIImage(named: "Temperature low.pdf")
            }
        }
        
        // Set pressure image and label
        if unitsPressure == "mB" {
            if pressure >= 1013 {
                currentCondition2Image.image = UIImage(named: "High Pressure.pdf")
                checkHighPressure(current: pressure, type: "high")
            } else {
                currentCondition2Image.image = UIImage(named: "Low Pressure.pdf")
                checkHighPressure(current: pressure, type: "low")
            }
        } else if unitsPressure == "hPa" {
            if pressure >= 101300 {
                currentCondition2Image.image = UIImage(named: "High Pressure.pdf")
                checkHighPressure(current: pressure, type: "high")
            } else {
                currentCondition2Image.image = UIImage(named: "Low Pressure.pdf")
                checkHighPressure(current: pressure, type: "low")
            }
        }
        
        // Set precip accumuluation phrase
        if precipAccumulation > 0 && precipAccumulation < 1 {
            currentCondition3Label.text = "Precipitation: \(precipitation)% \nSnow: < 1 \(unitsPrecipitation)"
        } else if precipAccumulation > 1 {
            currentCondition3Label.text = "Precipitation: \(precipitation)% \nSnow: \(Int(precipAccumulation)) \(unitsPrecipitation)"
        } else {
            currentCondition3Label.text = "Precipitation: \(precipitation)%"
        }
        
        // Check for current precipitation
        if minuteSummary.isEmpty == false && minuteSummary != "none" {
            // Check if there is current precipitation
            if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                currentCondition3Label.text = "Precipitation: \(precipitation)% \n\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
            }
        }
        
        // Set precipitation image
        if precipitation == 0 {
            currentCondition3Image.image = UIImage(named: "Precipitation none.pdf")
        } else if precipitation <= 20 {
            currentCondition3Image.image = UIImage(named: "Precipitation low.pdf")
        } else if precipitation > 20 && precipitation < 80 {
            currentCondition3Image.image = UIImage(named: "Precipitation moderate.pdf")
        } else if precipitation >= 80 {
            currentCondition3Image.image = UIImage(named: "Precipitation heavy.pdf")
        }
        
        // Set humidity image and label
        currentCondition4Label.text = "Humidity: \(humidity)% \nDew point: \(dewPoint)°"
        if humidity <= 20 {
            currentCondition4Image.image = UIImage(named: "Humidity low.pdf")
        } else if humidity > 20 && humidity < 80 {
            currentCondition4Image.image = UIImage(named: "Humidity moderate.pdf")
        } else if humidity >= 80 {
            currentCondition4Image.image = UIImage(named: "Humidity heavy.pdf")
        }
        
        // Set wind image and label
        currentCondition5Label.text = "Wind: \(wind)(\(windGust)) \(unitsWindSpeed) \(windDirectionString)"
        if windDirectionString.contains("N") {
            currentCondition5Image.image = UIImage(named: "Wind N.pdf")
        }
        if windDirectionString.contains("NE") {
            currentCondition5Image.image = UIImage(named: "Wind NE.pdf")
        }
        if windDirectionString.contains("E") {
            currentCondition5Image.image = UIImage(named: "Wind E.pdf")
        }
        if windDirectionString.contains("SE") {
            currentCondition5Image.image = UIImage(named: "Wind NE.pdf")
        }
        if windDirectionString.contains("S") {
            currentCondition5Image.image = UIImage(named: "Wind S.pdf")
        }
        if windDirectionString.contains("SW") {
            currentCondition5Image.image = UIImage(named: "Wind SW.pdf")
        }
        if windDirectionString.contains("W") {
            currentCondition5Image.image = UIImage(named: "Wind W.pdf")
        }
        if windDirectionString.contains("NW") {
            currentCondition5Image.image = UIImage(named: "Wind NW.pdf")
        } else {
            currentCondition5Image.image = UIImage(named: "Wind SW.pdf")
        }
        
        // Set uv index image and text title and color
        if uvIndex == 0 || uvIndex == 1 && uvIndex <= 2 {
            currentCondition6Label.text = "UV index is low"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index low.pdf"), for: .normal)
        } else if uvIndex >= 3 && uvIndex <= 5 {
            currentCondition6Label.text = "UV index is moderate"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index moderate.pdf"), for: .normal)
        } else if uvIndex >= 6 && uvIndex <= 7 {
            currentCondition6Label.text = "UV index is high"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index high.pdf"), for: .normal)
        } else if uvIndex >= 8 && uvIndex <= 10 {
            currentCondition6Label.text = "UV index is very high"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index very high.pdf"), for: .normal)
        } else if uvIndex >= 11 {
            currentCondition6Label.text = "UV index is extreme"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index extreme.pdf"), for: .normal)
        } else {
            currentCondition6Label.text = "UV index is low"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index low.pdf"), for: .normal)
        }
        
        // If visibility is within 1 drop last character
        if visibility == 1 {
            unitsDistance = String(unitsDistance.dropLast())
            currentCondition7Label.text = "Visibility: \(visibility) \(unitsDistance)"
        } else {
            currentCondition7Label.text = "Visibility: \(visibility) \(unitsDistance)"
        }
        currentCondition7Image.image = UIImage(named: "Visibility.pdf")
        
        // Set cloud cover image and label
        currentCondition8Image.image = UIImage(named: "Cloud cover.pdf")
        
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            currentCondition8Label.text = "Cloud cover: \n\(cloudCover)%, decreasing"
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            currentCondition8Label.text = "Cloud cover: \n\(cloudCover)%, increasing"
        } else {
            currentCondition8Label.text = "Cloud cover: \n\(cloudCover)%"
        }
        
        // Set sunrise/sunset image and label
        let currentTime = Date()
        if currentTime > sunriseDate && currentTime < sunsetDate {
            currentCondition9Label.text = "Sunset: \(sunset)"
            currentCondition9Image.image = UIImage(named: "Sunset.pdf")
        } else if currentTime > sunsetDate {
            currentCondition9Label.text = "Sunrise: \(sunrise)"
            currentCondition9Image.image = UIImage(named: "Sunrise.pdf")
        }
        
        // Set moonphase image and label
        currentCondition10Label.text = "Moon phase: \n\(dayZeroMoonPhaseString.lowercased())"
        if dayZeroMoonPhaseString == "New moon" {
            currentCondition10Image.image = UIImage(named: "New Moon.pdf")
        } else if dayZeroMoonPhaseString == "Waxing crescent" {
            currentCondition10Image.image = UIImage(named: "Waxing Crescent.pdf")
        } else if dayZeroMoonPhaseString == "First quarter" {
            currentCondition10Image.image = UIImage(named: "First Quarter.pdf")
        } else if dayZeroMoonPhaseString == "Waxing gibbous" {
            currentCondition10Image.image = UIImage(named: "Waxing Gibbous.pdf")
        } else if dayZeroMoonPhaseString == "Full moon" {
            currentCondition10Image.image = UIImage(named: "Full Moon.pdf")
        } else if dayZeroMoonPhaseString == "Waning gibbous" {
            currentCondition10Image.image = UIImage(named: "Waning Gibbous.pdf")
        } else if dayZeroMoonPhaseString == "Last quarter" {
            currentCondition10Image.image = UIImage(named: "Last Quarter.pdf")
        } else if dayZeroMoonPhaseString == "Waning crescent" {
            currentCondition10Image.image = UIImage(named: "Waning Crescent.pdf")
        }
    }
    
    // MARK: - Set weather data labels
    func setWeatherDataLabels() {
        setCurrentConditionLabels()
        setDayLabels()
        setDailyConditionImages()
        
        // Check for default hourly condition value
        setHourlyConditionTextForDay(day: 14)
        
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
            // Check number of active alerts
            if alertCount > 1 {
                weatherAlertsButton.setTitle("\(alertTitle) | +\(alertCount)", for: .normal)
            } else {
                weatherAlertsButton.setTitle("\(alertTitle)!", for: .normal)
            }
            weatherAlertsButton.setTitleColor(alertColor, for: .normal)
        } else {
            weatherAlertsButton.isHidden = true
        }
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
                
                if placemark.country! == "United States" {
                    city = placemark.locality!
                    state = placemark.administrativeArea!
                    self.navigationController?.navigationBar.topItem?.title = "\(city), \(state)"
                    userCurrentLocation = "\(city), \(state)"
                } else {
                    city = placemark.administrativeArea!
                    state = placemark.country!
                    self.navigationController?.navigationBar.topItem?.title = "\(city), \(state)"
                    userCurrentLocation = "\(city), \(state)"
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
        
        if (defaults.bool(forKey: "userDeniedLocation") == true) {
            let address = "\(defaults.string(forKey: "savedSelectedLocation") ?? "New York, NY")"
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
                defaults.set(selectedLatitudeValue, forKey: "savedSelectedLatitudeValue")
                defaults.set(selectedLongitudeValue, forKey: "savedSelectedLongitudeValue")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(selectedLatitudeValue, forKey: "setWidgetLatitude")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(selectedLongitudeValue, forKey: "setWidgetLongitude")
                
                self.navigationController?.navigationBar.topItem?.title = "\(defaults.string(forKey: "savedSelectedLocation") ?? "New York, NY")"
                self.setupInitialData()
            }
            setWeatherDataLabels()
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
        self.setupInitialLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            loadView.removeFromSuperview()
            self.setWeatherDataLabels()
        }
    }

    func showLocationDisabledPopUp() {
        defaults.set(true, forKey: "userDeniedLocation")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Locations")
        present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
