//
//  ColorThemeViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 9/18/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class ColorThemeTableViewController: UITableViewController {

    @IBOutlet weak var mandarinTableCell: UITableViewCell!
    @IBOutlet weak var malachiteTableCell: UITableViewCell!
    @IBOutlet weak var maximumRedTableCell: UITableViewCell!
    @IBOutlet weak var dodgerBlueTableCell: UITableViewCell!
    @IBOutlet weak var plumpPurpleTableCell: UITableViewCell!
    @IBOutlet weak var sandstormTableCell: UITableViewCell!
    @IBOutlet weak var asteroidTableCell: UITableViewCell!
    @IBOutlet weak var carminePinkTableCell: UITableViewCell!
    @IBOutlet weak var randomTableCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true

        self.navigationItem.title = "Color Theme"
        
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
        setColorTheme()
        
        if (defaults.bool(forKey: "cumulusPro") == false) {
            potentialCustomer = true
        }
    }

    func setColorTheme() {
        if defaults.string(forKey: "userSavedColorString") == "Mandarin" {
            setSelectedCheckMark(layerString: "Mandarin", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Malachite" {
            setSelectedCheckMark(layerString: "Malachite", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            setSelectedCheckMark(layerString: "Maximum Red", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            setSelectedCheckMark(layerString: "Plump Purple", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Sandstorm" {
            setSelectedCheckMark(layerString: "Sandstorm", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Asteroid" {
            setSelectedCheckMark(layerString: "Asteroid", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Carmine Pink" {
                   setSelectedCheckMark(layerString: "Carmine Pink", setColor: false)
        } else {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: false)
        }
    }
    
    @IBAction func mandarinTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Mandarin", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func malachiteTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Malachite", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func maximumRedTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Maximum Red", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func plumpPurpleTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Plump Purple", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func sandstormTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Sandstorm", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func asteroidTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Asteroid", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func carminePinkTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Carmine Pink", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func dodgerBlueTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func randomTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Random", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    func setSelectedCheckMark(layerString: String, setColor: Bool) {
        weatherLoaded = true
        
        if setColor == true {
            userChangedColorTheme = true
        } else {
            userChangedColorTheme = false
        }

        if layerString == "Mandarin" {
            defaults.set("Mandarin", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: mandarinTableCell)

            mandarinTableCell.accessoryType = .checkmark
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Malachite" {
            defaults.set("Malachite", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: malachiteTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .checkmark
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Maximum Red" {
            defaults.set("Maximum Red", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: maximumRedTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .checkmark
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Dodger Blue" {
            defaults.set("Dodger Blue", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: dodgerBlueTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .checkmark
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Plump Purple" {
            defaults.set("Plump Purple", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: plumpPurpleTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .checkmark
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Sandstorm" {
            defaults.set("Sandstorm", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: sandstormTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .checkmark
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Asteroid" {
            defaults.set("Asteroid", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: asteroidTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .checkmark
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }
        
        if layerString == "Carmine Pink" {
            defaults.set("Carmine Pink", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: carminePinkTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .checkmark
            randomTableCell.accessoryType = .none
        }

        if layerString == "Random" {
            defaults.set(true, forKey: "randomColorEnabled")

            let randomTheme = Int(arc4random_uniform(UInt32(13)))
            
            if randomTheme == 0 || randomTheme == 1 {
                defaults.set("Asteroid", forKey: "userSavedColorString")
            } else if randomTheme == 2 {
                defaults.set("Carmine Pink", forKey: "userSavedColorString")
            } else if randomTheme == 3 {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            } else if randomTheme == 4 {
                defaults.set("Malachite", forKey: "userSavedColorString")
            } else if randomTheme == 5 {
                defaults.set("Mandarin", forKey: "userSavedColorString")
            } else if randomTheme == 7 {
                defaults.set("Maximum Red", forKey: "userSavedColorString")
            } else if randomTheme == 8 {
                defaults.set("Plump Purple", forKey: "userSavedColorString")
            } else if randomTheme == 9 {
                defaults.set("Random", forKey: "userSavedColorString")
            } else if randomTheme == 10 {
                defaults.set("Sandstorm", forKey: "userSavedColorString")
            } else {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            }
            setTableViewCellColor(tableCell: randomTableCell)

            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            randomTableCell.accessoryType = .checkmark
        }
        setTabBarColor(tabBar: tabBarController!)
    }
}
