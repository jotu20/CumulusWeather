//
//  PrivacyPolicyViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/12/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {
    
    @IBOutlet weak var privacyPolicyView: UIView!
    
    @IBOutlet weak var statement0TextView: UITextView!
    @IBOutlet weak var statement1TextView: UITextView!
    @IBOutlet weak var statement2TextView: UITextView!
    @IBOutlet weak var statement3TextView: UITextView!
    @IBOutlet weak var statement4TextView: UITextView!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        self.navigationItem.title = "Privacy Policy"
        self.navigationController?.navigationBar.topItem?.title = ""
        
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
        setLabels()
        
        var setWidth: CGFloat = 0
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            setWidth = 300
            statementDescription0Height.constant = 90
            statementDescription1Height.constant = 180
            statementDescription2Height.constant = 364
            statementDescription3Height.constant = 120
            statementDescription4Height.constant = 60
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
        
        statementTitle0Width.constant = setWidth
        statementDescription0Width.constant = setWidth
        statementTitle1Width.constant = setWidth
        statementDescription1Width.constant = setWidth
        statementTitle2Width.constant = setWidth
        statementDescription2Width.constant = setWidth
        statementTitle3Width.constant = setWidth
        statementDescription3Width.constant = setWidth
        statementTitle4Width.constant = setWidth
        statementDescription4Width.constant = setWidth
        
        if potentialCustomer == true {
            let doneBarButton = UIButton.init(type: .custom)
            doneBarButton.setTitle("Done", for: .normal)
            doneBarButton.setTitleColor(UIColor.link, for: .normal)
            doneBarButton.addTarget(self, action: #selector(PrivacyPolicyViewController.returnTapped), for: UIControl.Event.touchUpInside)
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
            statement4TextView.attributedText = attributedString
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
