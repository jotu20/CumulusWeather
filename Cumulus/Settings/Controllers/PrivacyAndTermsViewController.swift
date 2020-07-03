//
//  PrivacyPolicyViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/12/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class PrivacyAndTermsViewController: UIViewController {
    
    @IBOutlet weak var privacyPolicyView: UIView!
    
    @IBOutlet weak var statement0TextView: UITextView!
    @IBOutlet weak var statement1TextView: UITextView!
    @IBOutlet weak var statement2TextView: UITextView!
    @IBOutlet weak var statement3TextView: UITextView!
    @IBOutlet weak var statement4TextView: UITextView!
    @IBOutlet weak var statement5TextView: UITextView!
    
    @IBOutlet weak var statementTitle0Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription0Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription0Height: NSLayoutConstraint!

    @IBOutlet weak var statementTitle1Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription1Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription1Height: NSLayoutConstraint!
   
    @IBOutlet weak var statementTitle2Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription2Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription2Height: NSLayoutConstraint!
    
    @IBOutlet weak var statementTitle3Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription3Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription3Height: NSLayoutConstraint!
    
    @IBOutlet weak var statementTitle4Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription4Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription4Height: NSLayoutConstraint!
    
    @IBOutlet weak var statementTitle5Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription5Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription5Height: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Privacy/Terms"
        weatherLoaded = true
        
        self.statement0TextView.text = "Cumulus takes your privacy and personal data seriously. Cumulus will only retrieve the least information that is necessary. Individual users are never tracked and personal data is never given to third parties."
        
        self.statement1TextView.text = "You may opt to grant Cumulus access to your location to receive localized weather forecasts. Cumulus does not require access to your location however some of its features do. For the most accurate weather forecasts location permission is recommended but is not required. You can enable location access by selecting to allow location access \"While Using the App\" or \"Always\". You can always change the location access on your devices' settings."
        
        self.statement2TextView.text = "Cumulus does not collect or store any personally identifiable information. Cumulus may ask for permission to access your location but this can be changed at anytime under your devices' settings and is not required. When you allow location access to Cumulus, your location is used along with the Dark Sky servers to retrieve weather forecasts for your location. Your location is also used when the today widget or Siri shortcuts are enabled. Your location is only used each time a request is made. None of the information sent is personally identifiable or stored by any third party."
        
        self.statement3TextView.text = "Cumulus does not use any third party services for analytics. However, it does utilize Apple's App Analytics platform to collect statistics on app crashes and usage. This information helps to diagnose and resolve any issues when encountered. This data is collected anonymously and cannot be used to personally identify users."
        
        self.statement4TextView.text = "Some features of Cumulus are only accessible through a subscription basis and billed according to the subscription. You will be billed in advance on a recurring and periodic cycle. Billing cycles are set either on a monthly or yearly basis, depending upon the type of subscription plan you select when purchasing a subscription. \n\nYour subscription will be charged to your iTunes account at confirmation of purchase. Your subscription will automatically renew at the end of your subscription period unless canceled at least 24 hours prior to the end of the current period. Your account will be charged for renewal within 24 hours prior to the end of current period. \n\nYou can manage your subscription or turn off auto-renewal at any time from your iTunes account settings. Cancellation of the active subscription period is not allowed."
        
        if defaults.string(forKey: "userSavedColorString") == "Mandarin" {
            self.navigationController?.navigationBar.tintColor = mandarin
        } else if defaults.string(forKey: "userSavedColorString") == "Malachite" {
            self.navigationController?.navigationBar.tintColor = malachite
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            self.navigationController?.navigationBar.tintColor = maximumRed
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            self.navigationController?.navigationBar.tintColor = dodgerBlue
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            self.navigationController?.navigationBar.tintColor = plumpPurple
        } else if defaults.string(forKey: "userSavedColorString") == "Sandstorm" {
            self.navigationController?.navigationBar.tintColor = sandstorm
        } else if defaults.string(forKey: "userSavedColorString") == "Asteroid" {
            self.navigationController?.navigationBar.tintColor = asteroid
        } else if defaults.string(forKey: "userSavedColorString") == "Carmine Pink" {
            self.navigationController?.navigationBar.tintColor = carminePink
        } else {
            self.navigationController?.navigationBar.tintColor = dodgerBlue
        }
        self.setLabels()
        
        var setWidth: CGFloat = 0
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            setWidth = 300
            self.statementDescription0Height.constant = 90
            self.statementDescription1Height.constant = 180
            self.statementDescription2Height.constant = 364
            self.statementDescription3Height.constant = 120
            self.statementDescription4Height.constant = 60
        } else if screenHeight == 667 {
            // iPhone 8
            setWidth = 359
        } else if screenHeight == 736 {
            // iPhone Plus
            setWidth = 399
        } else if screenHeight == 812 {
            // iPhone XS
            setWidth = 359
        } else if screenHeight == 896 {
            // iPhone XR & XS Max
            setWidth = 390
        } else if screenHeight == 1024 {
            // iPad 9.7"
            setWidth = 752
        } else if screenHeight == 1112 {
            // iPad 10.5"
            setWidth = 795
        } else if screenHeight == 1194 {
            // iPad 11"
            setWidth = 815
        } else if screenHeight == 1366 {
            // iPad 12.9"
            setWidth = 1008
        }
        
        self.statementTitle0Width.constant = setWidth
        self.statementDescription0Width.constant = setWidth
        self.statementTitle1Width.constant = setWidth
        self.statementDescription1Width.constant = setWidth
        self.statementTitle2Width.constant = setWidth
        self.statementDescription2Width.constant = setWidth
        self.statementTitle3Width.constant = setWidth
        self.statementDescription3Width.constant = setWidth
        self.statementTitle4Width.constant = setWidth
        self.statementDescription4Width.constant = setWidth
        
        if potentialCustomer == true {
            let doneBarButton = UIButton.init(type: .custom)
            doneBarButton.setTitle("Done", for: .normal)
            doneBarButton.setTitleColor(UIColor.link, for: .normal)
            doneBarButton.addTarget(self, action: #selector(PrivacyAndTermsViewController.returnTapped), for: UIControl.Event.touchUpInside)
            let barButton = UIBarButtonItem(customView: doneBarButton)
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    // Set the labels for all corresponding statements
    func setLabels() {
        let font = UIFont(name: "Oswald-Light", size: 17)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font!,
            .foregroundColor: UIColor.label,
        ]
        
        let attributedString = NSMutableAttributedString(string:"To report any issues, ask questions, or give feedback, please feel free to reach out.", attributes: attributes)
        let linkWasSet = attributedString.setAsLink(textToFind: "reach out", linkURL: "mailto:support@cumulusweatherapp.com")

        if linkWasSet {
            statement5TextView.attributedText = attributedString
        }
    }
    
    @IBAction func returnTapped(_ sender: UIBarButtonItem) {
        weatherLoaded = true
        dismiss(animated: true, completion: nil)
    }
}

extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) -> Bool {

        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}
