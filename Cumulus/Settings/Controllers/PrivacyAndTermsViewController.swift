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
        self.navigationItem.title = "Privacy & Terms"
        weatherLoaded = true
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        if screenWidth < 375 {
            let widthSize: CGFloat = 310
            
             statementTitle0Width.constant = widthSize
             statementDescription0Width.constant = widthSize

             statementTitle1Width.constant = widthSize
             statementDescription1Width.constant = widthSize
            
             statementTitle2Width.constant = widthSize
             statementDescription2Width.constant = widthSize
             
             statementTitle3Width.constant = widthSize
             statementDescription3Width.constant = widthSize
             
             statementTitle4Width.constant = widthSize
             statementDescription4Width.constant = widthSize
             
             statementTitle5Width.constant = widthSize
             statementDescription5Width.constant = widthSize
        }
        
        self.statement0TextView.text = "Cumulus takes your privacy and personal data seriously. Cumulus will only retrieve the least information that is necessary. Individual users are never tracked and personal data is never given to third parties."
        
        self.statement1TextView.text = "You may opt to grant Cumulus access to your location to receive localized weather forecasts. Cumulus does not require access to your location however some of its features do. For the most accurate weather forecasts location permission is recommended but is not required. You can enable location access by selecting to allow location access \"While Using the App\" or \"Always\". You can always change the location access on your devices' settings."
        
        self.statement2TextView.text = "Cumulus does not collect or store any personally identifiable information. Cumulus may ask for permission to access your location but this can be changed at anytime under your devices' settings and is not required. When you allow location access to Cumulus, your location is used each time a request is made with the weather data server selected by you under Cumulus' data source settings to retrieve weather forecasts for your location. None of the information sent is personally identifiable or stored by any third party."
        
        self.statement3TextView.text = "Some features of Cumulus are only accessible through a subscription basis and billed according to the subscription. You will be billed in advance on a recurring and periodic cycle. Billing cycles are set either on a monthly or yearly basis, depending upon the type of subscription plan you select when purchasing a subscription. \n\nYour subscription will be charged to your iTunes account at confirmation of purchase. Your subscription will automatically renew at the end of your subscription period unless canceled at least 24 hours prior to the end of the current period. Your account will be charged for renewal within 24 hours prior to the end of current period. \n\nYou can manage your subscription or turn off auto-renewal at any time from your iTunes account settings. Cancellation of the active subscription period is not allowed."
        
        self.statement4TextView.text = "Cumulus does not use any third party services for analytics. However, it does utilize Apple's App Analytics platform to collect statistics on app crashes and usage. This information helps to diagnose and resolve any issues when encountered. This data is anonymous and cannot be used to personally identify users."

        self.setLabels()
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ThemeTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }
    
    // Set the labels for all corresponding statements
    func setLabels() {
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.label,
        ]
        
        let attributedString = NSMutableAttributedString(string:"To report any issues, ask questions, give feedback, or request features, please feel free to reach out.", attributes: attributes)
        let linkWasSet = attributedString.setAsLink(textToFind: "reach out", linkURL: "mailto:support@cumulusweatherapp.com")

        if linkWasSet {
            statement5TextView.attributedText = attributedString
            statement5TextView.textAlignment = .center
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
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
