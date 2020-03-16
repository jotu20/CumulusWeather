//
//  ColorThemeViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 9/18/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class ColorThemeTableViewController: UITableViewController {

    @IBOutlet weak var tuscanTableCell: UITableViewCell!
    @IBOutlet weak var mandarinTableCell: UITableViewCell!
    @IBOutlet weak var malachiteTableCell: UITableViewCell!
    @IBOutlet weak var maximumRedTableCell: UITableViewCell!
    @IBOutlet weak var dodgerBlueTableCell: UITableViewCell!
    @IBOutlet weak var cottonCandyTableCell: UITableViewCell!
    @IBOutlet weak var plumpPurpleTableCell: UITableViewCell!
    @IBOutlet weak var sandstormTableCell: UITableViewCell!
    @IBOutlet weak var asteroidTableCell: UITableViewCell!
    @IBOutlet weak var carminePinkTableCell: UITableViewCell!
    @IBOutlet weak var iguanaGreenTableCell: UITableViewCell!
    @IBOutlet weak var darkCeruleanTableCell: UITableViewCell!
    @IBOutlet weak var randomTableCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        title = "Color Theme"
        tableView.tableFooterView = UIView(frame: .zero)
        setColorTheme()
        
        if (defaults.bool(forKey: "cumulusPro") == false) {
            potentialCustomer = true
        }
    }

    func setColorTheme() {
        if defaults.string(forKey: "userSavedColorString") == "Tuscan" {
            setSelectedCheckMark(layerString: "Tuscan", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Mandarin" {
            setSelectedCheckMark(layerString: "Mandarin", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Malachite" {
            setSelectedCheckMark(layerString: "Malachite", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            setSelectedCheckMark(layerString: "Maximum Red", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Cotton Candy" {
            setSelectedCheckMark(layerString: "Cotton Candy", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            setSelectedCheckMark(layerString: "Plump Purple", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Sandstorm" {
            setSelectedCheckMark(layerString: "Sandstorm", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Asteroid" {
            setSelectedCheckMark(layerString: "Asteroid", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Carmine Pink" {
                   setSelectedCheckMark(layerString: "Carmine Pink", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Iguana Green" {
                   setSelectedCheckMark(layerString: "Iguana Green", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Dark Cerulean" {
                   setSelectedCheckMark(layerString: "Dark Cerulean", setColor: false)
        } else {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: false)
        }
    }
    
    @IBAction func tuscanTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Tuscan", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
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
    
    @IBAction func dodgerBlueTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func cottonCandyTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Cotton Candy", setColor: true)
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
    
    @IBAction func iguanaGreenTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Iguana Green", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func darkCeruleanTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Dark Cerulean", setColor: true)
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

        if layerString == "Tuscan" {
            defaults.set("Tuscan", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: tuscanTableCell)

            tuscanTableCell.accessoryType = .checkmark
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Mandarin" {
            defaults.set("Mandarin", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: mandarinTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .checkmark
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Malachite" {
            defaults.set("Malachite", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: malachiteTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .checkmark
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Maximum Red" {
            defaults.set("Maximum Red", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: maximumRedTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .checkmark
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Dodger Blue" {
            defaults.set("Dodger Blue", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: dodgerBlueTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .checkmark
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Cotton Candy" {
            defaults.set("Cotton Candy", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: cottonCandyTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .checkmark
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Plump Purple" {
            defaults.set("Plump Purple", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: plumpPurpleTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .checkmark
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Sandstorm" {
            defaults.set("Sandstorm", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: sandstormTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .checkmark
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }

        if layerString == "Asteroid" {
            defaults.set("Asteroid", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: asteroidTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .checkmark
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }
        
        if layerString == "Carmine Pink" {
            defaults.set("Carmine Pink", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: carminePinkTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .checkmark
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }
        
        if layerString == "Iguana Green" {
            defaults.set("Iguana Green", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: iguanaGreenTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .checkmark
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .none
        }
        
        if layerString == "Dark Cerulean" {
            defaults.set("Dark Cerulean", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: darkCeruleanTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .checkmark
            randomTableCell.accessoryType = .none
        }

        if layerString == "Random" {
            defaults.set(true, forKey: "randomColorEnabled")

            let randomTheme = Int(arc4random_uniform(UInt32(13)))

            if randomTheme == 0 || randomTheme == 1 {
                defaults.set("Tuscan", forKey: "userSavedColorString")
            } else if randomTheme == 2 {
                defaults.set("Mandarin", forKey: "userSavedColorString")
            } else if randomTheme == 3 {
                defaults.set("Malachite", forKey: "userSavedColorString")
            } else if randomTheme == 4 {
                defaults.set("Maximum Red", forKey: "userSavedColorString")
            } else if randomTheme == 5 {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            } else if randomTheme == 6 {
                defaults.set("Cotton Candy", forKey: "userSavedColorString")
            } else if randomTheme == 7 {
                defaults.set("Plump Purple", forKey: "userSavedColorString")
            } else if randomTheme == 8 {
                defaults.set("Sandstorm", forKey: "userSavedColorString")
            } else if randomTheme == 9 {
                defaults.set("Asteroid", forKey: "userSavedColorString")
            } else if randomTheme == 10 {
                defaults.set("Carmine Pink", forKey: "userSavedColorString")
            } else if randomTheme == 11 {
                defaults.set("Iguana Green", forKey: "userSavedColorString")
            } else if randomTheme == 12 {
                defaults.set("Dark Cerulean", forKey: "userSavedColorString")
            }
            setTableViewCellColor(tableCell: randomTableCell)

            tuscanTableCell.accessoryType = .none
            mandarinTableCell.accessoryType = .none
            malachiteTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            cottonCandyTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            sandstormTableCell.accessoryType = .none
            asteroidTableCell.accessoryType = .none
            carminePinkTableCell.accessoryType = .none
            iguanaGreenTableCell.accessoryType = .none
            darkCeruleanTableCell.accessoryType = .none
            randomTableCell.accessoryType = .checkmark
        }
        setTabBarColor(tabBar: tabBarController!)
    }
}
