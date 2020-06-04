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
    @IBOutlet weak var statement0: UILabel!
    @IBOutlet weak var statement1: UILabel!
    @IBOutlet weak var acknowledgement0Label: UILabel!
    @IBOutlet weak var acknowledgement1Label: UILabel!
    @IBOutlet weak var acknowledgement0TextView: UITextView!
    @IBOutlet weak var acknowledgement1TextView: UITextView!
    
    @IBOutlet weak var statement0Width: NSLayoutConstraint!
    @IBOutlet weak var statement0Height: NSLayoutConstraint!
    
    @IBOutlet weak var statement1Width: NSLayoutConstraint!
    @IBOutlet weak var statement1Height: NSLayoutConstraint!
    
    @IBOutlet weak var acknowledgement0LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var acknowledgement0LabelHeight: NSLayoutConstraint!
    @IBOutlet weak var acknowledgement0TextViewWidth: NSLayoutConstraint!
    @IBOutlet weak var acknowledgement0TextViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var acknowledgement1LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var acknowledgement1LabelHeight: NSLayoutConstraint!
    @IBOutlet weak var acknowledgement1TextViewWidth: NSLayoutConstraint!
    @IBOutlet weak var acknowledgement1TextViewHeight: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        self.navigationItem.title = "Acknowledgements"
        
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
        
        acknowledgement0TextView.text = "Copyright (c) 2016 Satyam Ghodasara <sghodas@gmail.com>. \n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
        
        acknowledgement1TextView.text = "Copyright (c) 2015-2016 Andrea Bizzotto bizz84@gmail.com. \n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software, \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
        
        var setWidth: CGFloat = 0
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            setWidth = 300
            statement0Height.constant = 50
            statement1Height.constant = 50
            acknowledgement0LabelHeight.constant = 20
            acknowledgement0TextViewHeight.constant = 645
            acknowledgement1LabelHeight.constant = 20
            acknowledgement1TextViewHeight.constant = 645
            
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
        
        statement0Width.constant = setWidth
        statement1Width.constant = setWidth
        acknowledgement0LabelWidth.constant = setWidth
        acknowledgement0TextViewWidth.constant = setWidth
        acknowledgement1LabelWidth.constant = setWidth
        acknowledgement1TextViewWidth.constant = setWidth
        
        // Check for dark mode
        if traitCollection.userInterfaceStyle == .light {
            poweredByButton.setBackgroundImage(UIImage(named: "poweredby-oneline.pdf"), for: .normal)
        } else {
            poweredByButton.setBackgroundImage(UIImage(named: "poweredby-oneline-darkbackground.pdf"), for: .normal)
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

    @IBAction func returnTapped(_ sender: UIBarButtonItem) {
        weatherLoaded = true
        dismiss(animated: true, completion: nil)
    }
}
