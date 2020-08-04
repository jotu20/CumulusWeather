//
//  PreferencesTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/11/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class ForecastDataTableViewController: UITableViewController,  UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    let defaultHourlyConditionTypes = ["Precip (%)", "Accumulation (%)", "Temp (°\(unitsTemperature))", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let dataSourceTypes = ["Dark Sky"]
    
    @IBOutlet weak var dataSourceTextField: UITextField!
    @IBOutlet weak var hourlyConditionsTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Forecast Data"
        self.tableView.tableFooterView = UIView(frame: .zero)
        weatherLoaded = true
        
        self.setupObjectColors()
        self.hideKeyboard()

        self.dataSourceTextField.isEnabled = false
        self.dataSourceTextField.text = defaults.string(forKey: "dataSource")
        
        if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV index") == true) {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud cover") == true) {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        } else {
            self.hourlyConditionsTextField.text = "\(defaults.string(forKey: "defaultHourlyCondition")!)"
        }
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ForecastDataTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }
    
    func setupObjectColors() {
        var color: UIColor?
        if defaults.string(forKey: "userSavedColorString") == "Mango" {
            color = mango
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            color = maximumRed
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            color = dodgerBlue
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            color = plumpPurple
        } else if defaults.string(forKey: "userSavedColorString") == "Carmine Pink" {
            color = carminePink
        } else if defaults.string(forKey: "userSavedColorString") == "Spring Green" {
            color = springGreen
        } else {
            color = dodgerBlue
        }
        
        dataSourceTextField.textColor = color
        hourlyConditionsTextField.textColor = color
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
        if currentTextField == hourlyConditionsTextField {
            return defaultHourlyConditionTypes.count
        } else if currentTextField == dataSourceTextField {
            return dataSourceTypes.count
        } else {
            return 0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == hourlyConditionsTextField {
            return defaultHourlyConditionTypes[row]
        } else if currentTextField == dataSourceTextField {
            return dataSourceTypes[row]
        } else {
            return ""
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == hourlyConditionsTextField {
            hourlyConditionsTextField.text = defaultHourlyConditionTypes[row]
            defaultHourlyCondition = "\(defaultHourlyConditionTypes[row])"
            defaults.set("\(defaultHourlyConditionTypes[row])", forKey: "defaultHourlyCondition")
            weatherLoaded = false
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
        let toolBar = UIToolbar().ToolbarPicker(mySelect: #selector(ForecastDataTableViewController.dismissPicker))
        
        if currentTextField == dataSourceTextField || currentTextField == hourlyConditionsTextField {
            currentTextField.inputView = pickerView
            currentTextField.inputAccessoryView = toolBar
        }
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension ForecastDataTableViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ForecastDataTableViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
