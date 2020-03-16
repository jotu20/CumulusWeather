//
//  AcknowledgementsViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/29/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SafariServices

class AcknowledgementsViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var acknowledgementsView: UIView!
    @IBOutlet weak var poweredByButton: UIButton!
    @IBOutlet weak var poweredByButton2: UIButton!
    @IBOutlet weak var statement1: UILabel!
    @IBOutlet weak var statement2: UILabel!
    @IBOutlet weak var acknowledgementDescription2: UILabel!
    @IBOutlet weak var acknowledgementDescription3: UILabel!
    
    @IBOutlet weak var statement1Height: NSLayoutConstraint!
    @IBOutlet weak var statement1Width: NSLayoutConstraint!
    @IBOutlet weak var statement2Height: NSLayoutConstraint!
    @IBOutlet weak var statement2Width: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementTitle2Width: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementSecondTitle2Height: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementSecondTitle2Width: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementDescription2Height: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementDescription2Width: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementTitle3Width: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementSecondTitle3Height: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementSecondTitle3Width: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementDescription3Height: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementDescription3Width: NSLayoutConstraint!
    @IBOutlet weak var statement1DescriptioniPadWidth: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        title = "Acknowledgements"
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            statement1Height.constant = 60
            statement1Width.constant = 300
            statement1.numberOfLines = 3
            
            statement2Height.constant = 40
            statement2Width.constant = 300
            
            acknowledgementTitle2Width.constant = 300
            acknowledgementSecondTitle2Height.constant = 40
            acknowledgementSecondTitle2Width.constant = 300
            acknowledgementDescription2Height.constant = 584
            acknowledgementDescription2Width.constant = 300
            acknowledgementDescription2.numberOfLines = 35
            
            acknowledgementTitle3Width.constant = 300
            acknowledgementSecondTitle3Height.constant = 40
            acknowledgementSecondTitle3Width.constant = 300
            acknowledgementDescription3Height.constant = 594
            acknowledgementDescription3Width.constant = 300
            acknowledgementDescription3.numberOfLines = 35
        } else if screenHeight == 1366 {
            // iPad 12.9"
            statement1DescriptioniPadWidth.constant = 1008
        }
        
        // Check for dark mode
        if traitCollection.userInterfaceStyle == .light {
            poweredByButton.setBackgroundImage(UIImage(named: "poweredby-oneline.pdf"), for: .normal)
            poweredByButton2.setBackgroundImage(UIImage(named: "AerisWeather-logo-dark.pdf"), for: .normal)
        } else {
            poweredByButton.setBackgroundImage(UIImage(named: "poweredby-oneline-darkbackground.pdf"), for: .normal)
            poweredByButton2.setBackgroundImage(UIImage(named: "AerisWeather-logo-light.pdf"), for: .normal)
        }
        
        if potentialCustomer == true {
            let doneBarButton = UIButton.init(type: .custom)
            doneBarButton.setTitle("Done", for: .normal)
            doneBarButton.setTitleColor(UIColor.link, for: .normal)
            doneBarButton.addTarget(self, action: #selector(AcknowledgementsViewController.returnTapped), for: UIControl.Event.touchUpInside)
            let barButton = UIBarButtonItem(customView: doneBarButton)
            self.navigationItem.rightBarButtonItem = barButton
        }
    }

    @IBAction func poweredByDarkSkyTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: "http://darksky.net/poweredby/")!)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func poweredByAerisWeatherTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: "http://www.aerisweather.com")!)
        present(svc, animated: true, completion: nil)
    }

    @IBAction func returnTapped(_ sender: UIBarButtonItem) {
        weatherLoaded = true
        dismiss(animated: true, completion: nil)
    }
}
