//
//  DarkModeTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/31/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class DarkModeTableViewController: UITableViewController {

    @IBOutlet weak var automaticTableViewCell: UITableViewCell!
    @IBOutlet weak var systemTableViewCell: UITableViewCell!
    @IBOutlet weak var onTableViewCell: UITableViewCell!
    @IBOutlet weak var offTableViewCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Dark Mode"
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        weatherLoaded = true
        
        if defaults.string(forKey: "darkMode") == "Auto" {
            self.setSelectedCheckMark(type: "Auto")
        }
        if defaults.string(forKey: "darkMode") == "System" {
            self.setSelectedCheckMark(type: "System")
        }
        if defaults.string(forKey: "darkMode") == "On" {
            self.setSelectedCheckMark(type: "On")
        }
        if defaults.string(forKey: "darkMode") == "Off" {
            self.setSelectedCheckMark(type: "Off")
        }
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DarkModeTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @IBAction func automaticTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(type: "Auto")
    }
    @IBAction func systemTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(type: "System")
        overrideUserInterfaceStyle = .unspecified
    }
    @IBAction func onTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(type: "On")
        overrideUserInterfaceStyle = .dark
    }
    @IBAction func offTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(type: "Off")
        overrideUserInterfaceStyle = .light
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func setSelectedCheckMark(type: String) {
        if type == "Auto" {
            setTableViewCellColor(tableCell: automaticTableViewCell)
            
            defaults.set("Auto", forKey: "darkMode")
            if defaults.string(forKey: "darkMode") == "Auto" {
                automaticTableViewCell.accessoryType = .checkmark
                systemTableViewCell.accessoryType = .none
                onTableViewCell.accessoryType = .none
                offTableViewCell.accessoryType = .none
            }
        }

        if type == "System" {
            setTableViewCellColor(tableCell: systemTableViewCell)

            defaults.set("System", forKey: "darkMode")
            if defaults.string(forKey: "darkMode") == "System" {
                automaticTableViewCell.accessoryType = .none
                systemTableViewCell.accessoryType = .checkmark
                onTableViewCell.accessoryType = .none
                offTableViewCell.accessoryType = .none
            }
        }

        if type == "On" {
            setTableViewCellColor(tableCell: onTableViewCell)

            defaults.set("On", forKey: "darkMode")
            if defaults.string(forKey: "darkMode") == "On" {
                automaticTableViewCell.accessoryType = .none
                systemTableViewCell.accessoryType = .none
                onTableViewCell.accessoryType = .checkmark
                offTableViewCell.accessoryType = .none
            }
        }

        if type == "Off" {
            setTableViewCellColor(tableCell: offTableViewCell)

            defaults.set("Off", forKey: "darkMode")
            if defaults.string(forKey: "darkMode") == "Off" {
                automaticTableViewCell.accessoryType = .none
                systemTableViewCell.accessoryType = .none
                onTableViewCell.accessoryType = .none
                offTableViewCell.accessoryType = .checkmark
            }
        }
    }
}
