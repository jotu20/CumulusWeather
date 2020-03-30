//
//  PreferencesTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/11/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class PreferencesTableViewController: UITableViewController,  UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    let defaultHourlyConditionTypes = ["Precip (%)", "Temp (°\(unitsTemperature))", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let defaultDailyConditionTypes = ["Precip (%)", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let defaultWidgetConditionSlot1 = ["Current condition", "Feels like (°\(unitsTemperature))", "Precip (%)", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let defaultWidgetConditionSlot2 = ["Current condition", "Feels like (°\(unitsTemperature))", "Precip (%)", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let dataSourceTypes = ["Dark Sky"]
    
    @IBOutlet var appIconGesture: UITapGestureRecognizer!
    @IBOutlet var colorThemeGesture: UITapGestureRecognizer!
    @IBOutlet var siriShortcutsGesture: UITapGestureRecognizer!
    @IBOutlet weak var twentyfourHourClockSwitch: UISwitch!
    
    @IBOutlet weak var defaultHourlyConditionTextField: UITextField!
    @IBOutlet weak var defaultDailyConditionTextField: UITextField!
    @IBOutlet weak var defaultWidgetSlot1TextField: UITextField!
    @IBOutlet weak var defaultWidgetSlot2TextField: UITextField!
    @IBOutlet weak var dataSourceTextField: UITextField!
    
    @IBOutlet weak var appIconLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var colorThemeLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var siriShortcutsLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var twentyFourHourClockLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var defaultHourlyConditionWidth: NSLayoutConstraint!
    @IBOutlet weak var defaultDailyConditionWidth: NSLayoutConstraint!
    @IBOutlet weak var defaultWidgetSlot1Width: NSLayoutConstraint!
    @IBOutlet weak var defaultWidgetSlot2Width: NSLayoutConstraint!
    @IBOutlet weak var dataSourceWidth: NSLayoutConstraint!
    
    @IBOutlet weak var defaultHourlyConditionValueWidth: NSLayoutConstraint!
    @IBOutlet weak var defaultDailyConditionValueWidth: NSLayoutConstraint!
    @IBOutlet weak var defaultWidgetSlot1ValueWidth: NSLayoutConstraint!
    @IBOutlet weak var defaultWidgetSlot2ValueWidth: NSLayoutConstraint!
    @IBOutlet weak var dataSourceValueWidth: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        setupObjectColors()
        self.hideKeyboard()

        self.navigationItem.title = "Preferences"
        tableView.tableFooterView = UIView(frame: .zero)
        
        if defaults.bool(forKey: "cumulusPro") == false {
            defaultHourlyConditionTextField.isEnabled = false
            defaultDailyConditionTextField.isEnabled = false
            defaultWidgetSlot1TextField.isEnabled = false
            defaultWidgetSlot2TextField.isEnabled = false
            dataSourceTextField.isEnabled = false
        }
        
        if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV index") == true) {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud cover") == true) {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else {
            defaultHourlyConditionTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        }
        
        if (defaults.string(forKey: "defaultDailyCondition")?.contains("Precip") == true) {
            defaultDailyConditionTextField.text = "\(defaults.string(forKey: "defaultDailyCondition")!)"
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Humidity") == true) {
            defaultDailyConditionTextField.text = "\(defaults.string(forKey: "defaultDailyCondition")!)"
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("UV index") == true) {
            defaultDailyConditionTextField.text = "\(defaults.string(forKey: "defaultDailyCondition")!)"
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Wind") == true) {
            defaultDailyConditionTextField.text = "\(defaults.string(forKey: "defaultDailyCondition")!)"
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Cloud cover") == true) {
            defaultDailyConditionTextField.text = "\(defaults.string(forKey: "defaultDailyCondition")!)"
        } else {
            defaultDailyConditionTextField.text = "\(defaults.string(forKey: "defaultDailyCondition")!)"
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Current condition") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Feels like") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Precip") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Humidity") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("UV index") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Wind") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Cloud cover") == true) {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else {
            defaultWidgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Current condition") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Feels like") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Precip") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Humidity") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("UV index") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Wind") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Cloud cover") == true) {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else {
            defaultWidgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        }
        
        dataSourceTextField.text = defaults.string(forKey: "dataSource")
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            appIconLabelWidth.constant = 200
            colorThemeLabelWidth.constant = 200
            siriShortcutsLabelWidth.constant = 200
            twentyFourHourClockLabelWidth.constant = 200
            defaultHourlyConditionWidth.constant = 200
            defaultDailyConditionWidth.constant = 200
            defaultWidgetSlot1Width.constant = 200
            defaultWidgetSlot2Width.constant = 200
            dataSourceWidth.constant = 200
            
            defaultHourlyConditionValueWidth.constant = 40
            defaultDailyConditionValueWidth.constant = 40
            defaultWidgetSlot1ValueWidth.constant = 40
            defaultWidgetSlot2ValueWidth.constant = 40
            dataSourceValueWidth.constant = 40
        }

        if defaults.bool(forKey: "twentyFourHourClockEnabled") == false {
            twentyfourHourClockSwitch.isOn = false
        } else {
            twentyfourHourClockSwitch.isOn = true
        }
    }
    
    func setupObjectColors() {
        if defaults.string(forKey: "userSavedColorString") == "Tuscan" {
            twentyfourHourClockSwitch.onTintColor = tuscan
        } else if defaults.string(forKey: "userSavedColorString") == "Mandarin" {
            twentyfourHourClockSwitch.onTintColor = mandarin
        } else if defaults.string(forKey: "userSavedColorString") == "Malachite" {
            twentyfourHourClockSwitch.onTintColor = malachite
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            twentyfourHourClockSwitch.onTintColor = maximumRed
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            twentyfourHourClockSwitch.onTintColor = dodgerBlue
        } else if defaults.string(forKey: "userSavedColorString") == "Cotton Candy" {
            twentyfourHourClockSwitch.onTintColor = cottonCandy
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            twentyfourHourClockSwitch.onTintColor = plumpPurple
        } else if defaults.string(forKey: "userSavedColorString") == "Sandstorm" {
            twentyfourHourClockSwitch.onTintColor = sandstorm
        } else if defaults.string(forKey: "userSavedColorString") == "Asteroid" {
            twentyfourHourClockSwitch.onTintColor = asteroid
        } else {
            twentyfourHourClockSwitch.onTintColor = dodgerBlue
        }
    }
    
    @IBAction func twentyFourHourClockSwitchTapped(_ sender: UISwitch) {
        weatherLoaded = false
        clockChanged = true
        if defaults.bool(forKey: "twentyFourHourClockEnabled") == false {
            twentyfourHourClockSwitch.isOn = true
            defaults.set(true, forKey: "twentyFourHourClockEnabled")
        } else {
            twentyfourHourClockSwitch.isOn = false
            defaults.set(false, forKey: "twentyFourHourClockEnabled")
        }
    }
    
    @IBAction func appIconTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "appIcon", sender: nil)
    }
    
    @IBAction func colorThemeTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "colorTheme", sender: nil)
    }

    @IBAction func siriShortcutsTapped(_ sender: UITapGestureRecognizer) {
        // If User denied location ask for location permission
        if (defaults.bool(forKey: "userDeniedLocation") == true) {
            let alertController = UIAlertController (title: "Location access must be enabled", message: "Cumulus requires your location to enable Siri shortcuts.", preferredStyle: .alert)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                }
            }
            alertController.addAction(settingsAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "siriShortcuts", sender: nil)
        }
    }
    
    // Limit text field to numbers only
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == defaultHourlyConditionTextField {
            return defaultHourlyConditionTypes.count
        } else if currentTextField == defaultDailyConditionTextField {
            return defaultDailyConditionTypes.count
        } else if currentTextField == defaultWidgetSlot1TextField {
            return defaultWidgetConditionSlot1.count
        } else if currentTextField == defaultWidgetSlot2TextField {
            return defaultWidgetConditionSlot2.count
        } else if currentTextField == dataSourceTextField {
            return dataSourceTypes.count
        } else {
            return 0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == defaultHourlyConditionTextField {
            return defaultHourlyConditionTypes[row]
        } else if currentTextField == defaultDailyConditionTextField {
            return defaultDailyConditionTypes[row]
        } else if currentTextField == defaultWidgetSlot1TextField {
            return defaultWidgetConditionSlot1[row]
        } else if currentTextField == defaultWidgetSlot2TextField {
            return defaultWidgetConditionSlot2[row]
        } else if currentTextField == dataSourceTextField {
            return dataSourceTypes[row]
        } else {
            return ""
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == defaultHourlyConditionTextField {
            defaultHourlyConditionTextField.text = defaultHourlyConditionTypes[row]
            defaultHourlyCondition = "\(defaultHourlyConditionTypes[row])"
            defaults.set("\(defaultHourlyConditionTypes[row])", forKey: "defaultHourlyCondition")
            weatherLoaded = false
        } else if currentTextField == defaultDailyConditionTextField {
            defaultDailyConditionTextField.text = defaultDailyConditionTypes[row]
            defaultDailyCondition = "\(defaultDailyConditionTypes[row])"
            defaults.set("\(defaultDailyConditionTypes[row])", forKey: "defaultDailyCondition")
            weatherLoaded = false
        } else if currentTextField == defaultWidgetSlot1TextField {
            defaultWidgetSlot1TextField.text = defaultWidgetConditionSlot1[row]
            defaultWidgetSlot1 = "\(defaultWidgetConditionSlot1[row])"
            defaults.set("\(defaultWidgetConditionSlot1[row])", forKey: "defaultWidgetSlot1")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(defaultWidgetSlot1, forKey: "setDefaultWidgetSlot1")
        } else if currentTextField == defaultWidgetSlot2TextField {
            defaultWidgetSlot2TextField.text = defaultWidgetConditionSlot2[row]
            defaultWidgetSlot2 = "\(defaultWidgetConditionSlot2[row])"
            defaults.set("\(defaultWidgetConditionSlot2[row])", forKey: "defaultWidgetSlot2")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(defaultWidgetSlot2, forKey: "setDefaultWidgetSlot2")
        } else if currentTextField == dataSourceTextField {
            dataSourceTextField.text = dataSourceTypes[row]
            dataSource = "\(dataSourceTypes[row])"
            defaults.set(dataSource, forKey: "dataSource")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(dataSource, forKey: "setDataSource")
            dataSourceChanged = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        currentTextField = textField
        let toolBar = UIToolbar().ToolbarPicker(mySelect: #selector(PreferencesTableViewController.dismissPicker))
        
        if currentTextField == defaultHourlyConditionTextField || currentTextField == defaultDailyConditionTextField || currentTextField == defaultWidgetSlot1TextField || currentTextField == defaultWidgetSlot2TextField || currentTextField == dataSourceTextField {
            currentTextField.inputView = pickerView
            currentTextField.inputAccessoryView = toolBar
        }
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
}

extension PreferencesTableViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(PreferencesTableViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
