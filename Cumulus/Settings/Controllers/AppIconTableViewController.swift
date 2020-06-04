//
//  ColorViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/25/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class AppIconTableViewController: UITableViewController {

    @IBOutlet weak var mandarinTableCell: UITableViewCell!
    @IBOutlet weak var malachiteTableCell: UITableViewCell!
    @IBOutlet weak var maximumRedTableCell: UITableViewCell!
    @IBOutlet weak var dodgerBlueTableCell: UITableViewCell!
    @IBOutlet weak var plumpPurpleTableCell: UITableViewCell!
    @IBOutlet weak var sandstormTableCell: UITableViewCell!
    @IBOutlet weak var asteroidTableCell: UITableViewCell!
    @IBOutlet weak var carminePinkTableCell: UITableViewCell!
    @IBOutlet weak var lightsOutTableCell: UITableViewCell!
    @IBOutlet weak var twilightZoneTableCell: UITableViewCell!
    @IBOutlet weak var prideTableCell: UITableViewCell!
    @IBOutlet weak var twilightMoonTableCell: UITableViewCell!
    @IBOutlet weak var mightyUmbrellaTableCell: UITableViewCell!
    @IBOutlet weak var eightBitTableCell: UITableViewCell!
    @IBOutlet weak var thunderstormTableCell: UITableViewCell!
    @IBOutlet weak var cloudyDayTableCell: UITableViewCell!
    @IBOutlet weak var rainDropTableCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true

        self.navigationItem.title = "App Icon"
        
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
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        if defaults.string(forKey: "userSavedAppIconString") == "8-Bit" {
            setSelectedCheckMark(layerString: "8-Bit", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Asteroid" {
            setSelectedCheckMark(layerString: "Asteroid", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Carmine Pink" {
            setSelectedCheckMark(layerString: "Carmine Pink", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Cloudy Day" {
            setSelectedCheckMark(layerString: "Cloudy Day", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Dodger Blue" {
            setSelectedCheckMark(layerString: "Dodger Blue", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Lights Out" {
            setSelectedCheckMark(layerString: "Lights Out", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Malachite" {
            setSelectedCheckMark(layerString: "Malachite", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Mandarin" {
            setSelectedCheckMark(layerString: "Mandarin", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Maximum Red" {
            setSelectedCheckMark(layerString: "Maximum Red", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Mighty Umbrella" {
            setSelectedCheckMark(layerString: "Mighty Umbrella", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Plump Purple" {
            setSelectedCheckMark(layerString: "Plump Purple", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Pride" {
            setSelectedCheckMark(layerString: "Pride", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Rain drop" {
            setSelectedCheckMark(layerString: "Rain drop", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Sandstorm" {
            setSelectedCheckMark(layerString: "Sandstorm", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Thunderstorm" {
            setSelectedCheckMark(layerString: "Thunderstorm", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Twilight Moon" {
            setSelectedCheckMark(layerString: "Twilight Moon", setIcon: false)
        } else if defaults.string(forKey: "userSavedAppIconString") == "Twilight Zone" {
            setSelectedCheckMark(layerString: "Twilight Zone", setIcon: false)
        } else {
            setSelectedCheckMark(layerString: "Dodger Blue", setIcon: false)
        }
        
        if (defaults.bool(forKey: "cumulusPro") == false) {
            potentialCustomer = true
        }
    }
    
    @IBAction func mandarinTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Mandarin", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Mandarin", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func malachiteTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Malachite", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Malachite", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func maximumRedTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Maximum Red", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Maximum Red", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func dodgerBlueTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Dodger Blue", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Dodger Blue", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func cottonCandyTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Cotton Candy", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Cotton Candy", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func plumpPurpleTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Plump Purple", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Plump Purple", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func sandstormTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Sandstorm", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Sandstorm", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func asteroidTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Asteroid", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Asteroid", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func carminePinkTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Carmine Pink", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Carmine Pink", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func lightsOutTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Lights Out", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Lights Out", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func twilightZoneTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Twilight Zone", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Twilight Zone", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func prideTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Pride", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Pride", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func twilightMoonTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Twilight Moon", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Twilight Moon", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func mightyUmbrellaTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Mighty Umbrella", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Mighty Umbrella", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func eightBitTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("8-Bit", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "8-Bit", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func thunderstormTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Thunderstorm", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Thunderstorm", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func cloudyDayTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Cloudy Day", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Cloudy Day", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func rainDropTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            defaults.set("Rain Drop", forKey: "userSavedAppIconString")
            setSelectedCheckMark(layerString: "Rain Drop", setIcon: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    func setSelectedCheckMark(layerString: String, setIcon: Bool) {
        weatherLoaded = true
        
        if layerString == "Mandarin" {
            setTableViewCellColor(tableCell: mandarinTableCell)
            
            mandarinTableCell.accessoryType = .checkmark
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Mandarin") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Malachite" {
            setTableViewCellColor(tableCell: malachiteTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .checkmark
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Malachite") { error in
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

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .checkmark
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .checkmark
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .checkmark
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
        
        if layerString == "Sandstorm" {
            setTableViewCellColor(tableCell: sandstormTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .checkmark
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Sandstorm") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Asteroid" {
            setTableViewCellColor(tableCell: asteroidTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .checkmark
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Asteroid") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Carmine Pink" {
            setTableViewCellColor(tableCell: carminePinkTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .checkmark
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-CarminePink") { error in
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

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .checkmark
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .checkmark
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
        
        if layerString == "Pride" {
            setTableViewCellColor(tableCell: prideTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .checkmark
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-Pride") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if layerString == "Twilight Moon" {
            setTableViewCellColor(tableCell: twilightMoonTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .checkmark
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-TwilightMoon") { error in
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .checkmark
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .checkmark
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .checkmark
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .none
            
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
        
        if layerString == "Cloudy Day" {
            setTableViewCellColor(tableCell: cloudyDayTableCell)
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .checkmark
            rainDropTableCell.accessoryType = .none
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-CloudyDay") { error in
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
            
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            lightsOutTableCell.accessoryType = .none
            twilightZoneTableCell.accessoryType = .none
            prideTableCell.accessoryType = .none
            twilightMoonTableCell.accessoryType = .none
            mightyUmbrellaTableCell.accessoryType = .none
            eightBitTableCell.accessoryType = .none
            thunderstormTableCell.accessoryType = .none
            cloudyDayTableCell.accessoryType = .none
            rainDropTableCell.accessoryType = .checkmark
            
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
    }
}
