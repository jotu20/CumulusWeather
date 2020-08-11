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
        self.navigationItem.title = "Acknowledgements"
        weatherLoaded = true
        
        self.acknowledgement0TextView.text = "Copyright (c) 2016 Satyam Ghodasara <sghodas@gmail.com>. \n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
        
        self.acknowledgement1TextView.text = "Copyright (c) 2015-2016 Andrea Bizzotto bizz84@gmail.com. \n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software, \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
        
        // Check for dark mode
        if self.traitCollection.userInterfaceStyle == .light {
            self.poweredByButton.setBackgroundImage(UIImage(named: "poweredby-oneline.pdf"), for: .normal)
        } else {
            self.poweredByButton.setBackgroundImage(UIImage(named: "poweredby-oneline-darkbackground.pdf"), for: .normal)
        }
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ColorThemeTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }

    @IBAction func poweredByDarkSkyTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: "http://darksky.net/poweredby/")!)
        present(svc, animated: true, completion: nil)
    }

    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
