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
    let defaultWidgetConditionSlot1 = ["Current condition", "Feels like (°\(unitsTemperature))", "Precip (%)", "Accumulation (%)", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let defaultWidgetConditionSlot2 = ["Current condition", "Feels like (°\(unitsTemperature))", "Precip (%)", "Accumulation (%)", "Humidity (%)", "UV index", "Wind (\(unitsWindSpeed))", "Cloud cover (%)"]
    let dataSourceTypes = ["Dark Sky"]
    
    @IBOutlet weak var dataSourceTextField: UITextField!
    @IBOutlet weak var hourlyConditionsTextField: UITextField!
    @IBOutlet weak var widgetSlot1TextField: UITextField!
    @IBOutlet weak var widgetSlot2TextField: UITextField!
    
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
        
        if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Current condition") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Feels like") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Precip") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Humidity") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("UV index") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Wind") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Cloud cover") == true) {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        } else {
            self.widgetSlot1TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot1")!)"
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Current condition") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Feels like") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Precip") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Humidity") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("UV index") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Wind") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Cloud cover") == true) {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
        } else {
            self.widgetSlot2TextField.text = "\(defaults.string(forKey: "defaultWidgetSlot2")!)"
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
        widgetSlot1TextField.textColor = color
        widgetSlot2TextField.textColor = color
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
        } else if currentTextField == widgetSlot1TextField {
            return defaultWidgetConditionSlot1.count
        } else if currentTextField == widgetSlot2TextField {
            return defaultWidgetConditionSlot2.count
        } else if currentTextField == dataSourceTextField {
            return dataSourceTypes.count
        } else {
            return 0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == hourlyConditionsTextField {
            return defaultHourlyConditionTypes[row]
        } else if currentTextField == widgetSlot1TextField {
            return defaultWidgetConditionSlot1[row]
        } else if currentTextField == widgetSlot2TextField {
            return defaultWidgetConditionSlot2[row]
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
        } else if currentTextField == widgetSlot1TextField {
            widgetSlot1TextField.text = defaultWidgetConditionSlot1[row]
            defaultWidgetSlot1 = "\(defaultWidgetConditionSlot1[row])"
            defaults.set("\(defaultWidgetConditionSlot1[row])", forKey: "defaultWidgetSlot1")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(defaultWidgetSlot1, forKey: "setDefaultWidgetSlot1")
        } else if currentTextField == widgetSlot2TextField {
            widgetSlot2TextField.text = defaultWidgetConditionSlot2[row]
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
        let toolBar = UIToolbar().ToolbarPicker(mySelect: #selector(ForecastDataTableViewController.dismissPicker))
        
        if currentTextField == dataSourceTextField || currentTextField == hourlyConditionsTextField || currentTextField == widgetSlot1TextField || currentTextField == widgetSlot2TextField {
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
