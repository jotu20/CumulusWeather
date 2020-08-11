//
//  ColorThemeViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 9/18/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class ColorThemeTableViewController: UITableViewController {

    @IBOutlet weak var mangoTableCell: UITableViewCell!
    @IBOutlet weak var maximumRedTableCell: UITableViewCell!
    @IBOutlet weak var dodgerBlueTableCell: UITableViewCell!
    @IBOutlet weak var orchidTableCell: UITableViewCell!
    @IBOutlet weak var plumpPurpleTableCell: UITableViewCell!
    @IBOutlet weak var springGreenTableCell: UITableViewCell!
    @IBOutlet weak var autoThemeTableCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Color Theme"
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        weatherLoaded = true
        self.setColorTheme()
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ColorThemeTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }

    func setColorTheme() {
        if defaults.string(forKey: "userSavedColorString") == "Mango" {
            setSelectedCheckMark(layerString: "Mango", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            setSelectedCheckMark(layerString: "Maximum Red", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            setSelectedCheckMark(layerString: "Plump Purple", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Orchid" {
            setSelectedCheckMark(layerString: "Orchid", setColor: false)
        } else if defaults.string(forKey: "userSavedColorString") == "Spring Green" {
            setSelectedCheckMark(layerString: "Spring Green", setColor: false)
        } else {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: false)
        }
    }
    
    @IBAction func mangoTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Mango", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func maximumRedTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Maximum Red", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func plumpPurpleTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Plump Purple", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func orchidTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Orchid", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func springGreenTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Spring Green", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func dodgerBlueTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Dodger Blue", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func autoThemeTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            setSelectedCheckMark(layerString: "Auto", setColor: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Plus")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
            setTableViewCellColor(tableCell: mangoTableCell)

            mangoTableCell.accessoryType = .checkmark
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            autoThemeTableCell.accessoryType = .none
        }

        if layerString == "Maximum Red" {
            defaults.set("Maximum Red", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: maximumRedTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .checkmark
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            autoThemeTableCell.accessoryType = .none
        }

        if layerString == "Dodger Blue" {
            defaults.set("Dodger Blue", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: dodgerBlueTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .checkmark
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            autoThemeTableCell.accessoryType = .none
        }

        if layerString == "Plump Purple" {
            defaults.set("Plump Purple", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: plumpPurpleTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .checkmark
            orchidTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            autoThemeTableCell.accessoryType = .none
        }
        
        if layerString == "Orchid" {
            defaults.set("Orchid", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: orchidTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .checkmark
            springGreenTableCell.accessoryType = .none
            autoThemeTableCell.accessoryType = .none
        }
        
        if layerString == "Spring Green" {
            defaults.set("Spring Green", forKey: "userSavedColorString")
            setTableViewCellColor(tableCell: springGreenTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .checkmark
            autoThemeTableCell.accessoryType = .none
        }

        if layerString == "Auto" {
            defaults.set(true, forKey: "autoThemeEnabled")

            let autoTheme = Int(arc4random_uniform(UInt32(13)))
            
            if autoTheme == 0 || autoTheme == 1 {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            } else if autoTheme == 2 {
                defaults.set("Orchid", forKey: "userSavedColorString")
            } else if autoTheme == 3 {
                defaults.set("Mango", forKey: "userSavedColorString")
            } else if autoTheme == 4 {
                defaults.set("Maximum Red", forKey: "userSavedColorString")
            } else if autoTheme == 5 {
                defaults.set("Plump Purple", forKey: "userSavedColorString")
            } else if autoTheme == 6 {
                defaults.set("Spring Green", forKey: "userSavedColorString")
            } else {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            }
            setTableViewCellColor(tableCell: autoThemeTableCell)

            mangoTableCell.accessoryType = .none
            maximumRedTableCell.accessoryType = .none
            dodgerBlueTableCell.accessoryType = .none
            plumpPurpleTableCell.accessoryType = .none
            orchidTableCell.accessoryType = .none
            springGreenTableCell.accessoryType = .none
            autoThemeTableCell.accessoryType = .checkmark
        }
    }
}
