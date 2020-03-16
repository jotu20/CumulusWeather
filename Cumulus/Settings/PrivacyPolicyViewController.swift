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
    
    @IBOutlet weak var statementDescription1: UILabel!
    @IBOutlet weak var statementDescription2: UILabel!
    @IBOutlet weak var statementDescription3: UILabel!
    @IBOutlet weak var statementDescription4: UILabel!

    @IBOutlet weak var statementTitle1Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription1Height: NSLayoutConstraint!
    @IBOutlet weak var statementDescription1Width: NSLayoutConstraint!
    @IBOutlet weak var statementTitle2Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription2Height: NSLayoutConstraint!
    @IBOutlet weak var statementDescription2Width: NSLayoutConstraint!
    @IBOutlet weak var statementTitle3Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription3Height: NSLayoutConstraint!
    @IBOutlet weak var statementDescription3Width: NSLayoutConstraint!
    @IBOutlet weak var statementTitle4Width: NSLayoutConstraint!
    @IBOutlet weak var statementDescription4Height: NSLayoutConstraint!
    @IBOutlet weak var statementDescription4Width: NSLayoutConstraint!
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        title = "Privacy Policy"
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            statementTitle1Width.constant = 300
            statementDescription1Height.constant = 180
            statementDescription1Width.constant = 300
            statementDescription1.numberOfLines = 15
            
            statementTitle2Width.constant = 300
            statementDescription2Height.constant = 364
            statementDescription2Width.constant = 300
            statementDescription2.numberOfLines = 25
            
            statementTitle3Width.constant = 300
            statementDescription3Height.constant = 120
            statementDescription3Width.constant = 300
            statementDescription3.numberOfLines = 10
            
            statementTitle4Width.constant = 300
            statementDescription4Height.constant = 60
            statementDescription4Width.constant = 300
        } else if screenHeight == 667 {
            // iPhone 8
            stackViewWidth.constant = 359
        } else if screenHeight == 736 {
            // iPhone Plus
            stackViewWidth.constant = 399
        } else if screenHeight == 812 {
            // iPhone XS
            stackViewWidth.constant = 359
        } else if screenHeight == 896 {
            // iPhone XR & XS Max
            stackViewWidth.constant = 399
        } else if screenHeight == 1024 {
            // iPad 9.7"
            stackViewWidth.constant = 752
        } else if screenHeight == 1112 {
            // iPad 10.5"
            stackViewWidth.constant = 795
        } else if screenHeight == 1194 {
            // iPad 11"
            stackViewWidth.constant = 815
        } else if screenHeight == 1366 {
            // iPad 12.9"
            stackViewWidth.constant = 1008
        }
        
        if potentialCustomer == true {
            let doneBarButton = UIButton.init(type: .custom)
            doneBarButton.setTitle("Done", for: .normal)
            doneBarButton.setTitleColor(UIColor.link, for: .normal)
            doneBarButton.addTarget(self, action: #selector(PrivacyPolicyViewController.returnTapped), for: UIControl.Event.touchUpInside)
            let barButton = UIBarButtonItem(customView: doneBarButton)
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    @IBAction func returnTapped(_ sender: UIBarButtonItem) {
        weatherLoaded = true
        dismiss(animated: true, completion: nil)
    }
}
