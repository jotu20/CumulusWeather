//
//  DataSourceTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 3/3/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class ForecastDataTableViewController: UITableViewController, UITabBarControllerDelegate {

    @IBOutlet weak var darkSkyCell: UITableViewCell!
    @IBOutlet weak var openWeatherCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Forecast Data"
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        weatherLoaded = true
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ForecastDataTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
        setSelectedCheckMark()
    }
    
    @IBAction func darkSkyTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        dataSource = "Dark Sky"
        defaults.set(dataSource, forKey: "dataSource")
        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(dataSource, forKey: "setDataSource")
        setSelectedCheckMark()
    }
    
    @IBAction func openWeatherTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        dataSource = "OpenWeather"
        defaults.set(dataSource, forKey: "dataSource")
        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(dataSource, forKey: "setDataSource")
        setSelectedCheckMark()
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        if weatherLoaded == true {
            dismiss(animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Home")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func setSelectedCheckMark() {
        if (defaults.string(forKey: "dataSource") == "Dark Sky") {
            setTableViewCellColor(tableCell: darkSkyCell)
            darkSkyCell.accessoryType = .checkmark
            openWeatherCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            setTableViewCellColor(tableCell: openWeatherCell)
            darkSkyCell.accessoryType = .none
            openWeatherCell.accessoryType = .checkmark
        }
    }
}
