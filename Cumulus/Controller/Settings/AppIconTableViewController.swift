//
//  ColorViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/25/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class AppIconTableViewController: UITableViewController {

    @IBOutlet weak var mangoTableCell: UITableViewCell!
    @IBOutlet weak var maximumRedTableCell: UITableViewCell!
    @IBOutlet weak var dodgerBlueTableCell: UITableViewCell!
    @IBOutlet weak var plumpPurpleTableCell: UITableViewCell!
    @IBOutlet weak var orchidTableCell: UITableViewCell!
    @IBOutlet weak var lightsOutTableCell: UITableViewCell!
    @IBOutlet weak var twilightZoneTableCell: UITableViewCell!
    @IBOutlet weak var mightyUmbrellaTableCell: UITableViewCell!
    @IBOutlet weak var eightBitTableCell: UITableViewCell!
    @IBOutlet weak var thunderstormTableCell: UITableViewCell!
    @IBOutlet weak var rainDropTableCell: UITableViewCell!
    @IBOutlet weak var springGreenTableCell: UITableViewCell!
    @IBOutlet weak var moonlightTableCell: UITableViewCell!
    @IBOutlet weak var windyDayTableCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "App Icon"
        weatherLoaded = true
        
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        if (defaults.string(forKey: "userSavedAppIconString") == "8-Bit") {
            self.setSelectedCheckMark(layerString: "8-Bit", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Orchid") {
            self.setSelectedCheckMark(layerString: "Orchid", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Dodger Blue") {
            self.setSelectedCheckMark(layerString: "Dodger Blue", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Lights Out") {
            self.setSelectedCheckMark(layerString: "Lights Out", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Mango") {
            self.setSelectedCheckMark(layerString: "Mango", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Maximum Red") {
            self.setSelectedCheckMark(layerString: "Maximum Red", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Mighty Umbrella") {
            self.setSelectedCheckMark(layerString: "Mighty Umbrella", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Plump Purple") {
            self.setSelectedCheckMark(layerString: "Plump Purple", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Rain Drop") {
            self.setSelectedCheckMark(layerString: "Rain Drop", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Spring Green") {
            self.setSelectedCheckMark(layerString: "Spring Green", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Thunderstorm") {
            self.setSelectedCheckMark(layerString: "Thunderstorm", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Twilight Zone") {
            self.setSelectedCheckMark(layerString: "Twilight Zone", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Moonlight") {
            self.setSelectedCheckMark(layerString: "Moonlight", setIcon: false)
        } else if (defaults.string(forKey: "userSavedAppIconString") == "Windy Day") {
            self.setSelectedCheckMark(layerString: "Windy Day", setIcon: false)
        } else {
            self.setSelectedCheckMark(layerString: "Dodger Blue", setIcon: false)
        }

        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AppIconTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @IBAction func mangoTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Mango", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Mango", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func maximumRedTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Maximum Red", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Maximum Red", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func dodgerBlueTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Dodger Blue", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Dodger Blue", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func plumpPurpleTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Plump Purple", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Plump Purple", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func orchidTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Orchid", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Orchid", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func lightsOutTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Lights Out", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Lights Out", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func twilightZoneTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Twilight Zone", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Twilight Zone", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func mightyUmbrellaTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Mighty Umbrella", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Mighty Umbrella", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func eightBitTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("8-Bit", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "8-Bit", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func thunderstormTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Thunderstorm", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Thunderstorm", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func rainDropTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Rain Drop", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Rain Drop", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func springGreenTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Spring Green", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Spring Green", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func moonlightTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Moonlight", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Moonlight", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func windyDayTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            defaults.set("Windy Day", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Windy Day", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func setSelectedCheckMark(layerString: String, setIcon: Bool) {
        weatherLoaded = true
        
        if layerString == "Mango" {
            setTableViewCellColor(tableCell: mangoTableCell)
            
            mangoTableCell.accessoryType = .checkmark
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Mango") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Maximum Red" {
            setTableViewCellColor(tableCell: maximumRedTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .checkmark
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-MaximumRed") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Dodger Blue" {
            setTableViewCellColor(tableCell: dodgerBlueTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .checkmark
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DodgerBlue") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Plump Purple" {
            setTableViewCellColor(tableCell: plumpPurpleTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .checkmark
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-PlumpPurple") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Orchid" {
            setTableViewCellColor(tableCell: orchidTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .checkmark
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Orchid") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Lights Out" {
            setTableViewCellColor(tableCell: lightsOutTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .checkmark
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightsOut") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Twilight Zone" {
            setTableViewCellColor(tableCell: twilightZoneTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .checkmark
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-TwilightZone") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Mighty Umbrella" {
            setTableViewCellColor(tableCell: mightyUmbrellaTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .checkmark
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-MightyUmbrella") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "8-Bit" {
            setTableViewCellColor(tableCell: eightBitTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .checkmark
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-8-Bit") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Thunderstorm" {
            setTableViewCellColor(tableCell: thunderstormTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .checkmark
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Thunderstorm") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Rain Drop" {
            setTableViewCellColor(tableCell: rainDropTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .checkmark
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-RainDrop") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Spring Green" {
            setTableViewCellColor(tableCell: springGreenTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .checkmark
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-SpringGreen") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Moonlight" {
            setTableViewCellColor(tableCell: moonlightTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .checkmark
            windyDayTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Moonlight") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Windy Day" {
            setTableViewCellColor(tableCell: windyDayTableCell)
            
            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            moonlightTableCell.accessoryType = .none
            windyDayTableCell.accessoryType = .checkmark
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-WindyDay") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
    }
}
