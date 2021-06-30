//
//  ColorViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/25/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class AppIconViewController: UIViewController {
    
    @IBOutlet weak var dodgerBlueView: UIView!
    @IBOutlet weak var lightDodgerBlueView: UIView!
    @IBOutlet weak var darkDodgerBlueView: UIView!
    
    @IBOutlet weak var mangoView: UIView!
    @IBOutlet weak var lightMangoView: UIView!
    @IBOutlet weak var darkMangoView: UIView!
    
    @IBOutlet weak var maximumRedView: UIView!
    @IBOutlet weak var lightMaximumRedView: UIView!
    @IBOutlet weak var darkMaximumRedView: UIView!
    
    @IBOutlet weak var orchidView: UIView!
    @IBOutlet weak var lightOrchidView: UIView!
    @IBOutlet weak var darkOrchidView: UIView!
    
    @IBOutlet weak var plumpPurpleView: UIView!
    @IBOutlet weak var lightPlumpPurpleView: UIView!
    @IBOutlet weak var darkOPlumpPurpleiew: UIView!
    
    @IBOutlet weak var springGreenView: UIView!
    @IBOutlet weak var lightSpringGreenView: UIView!
    @IBOutlet weak var darkSpringGreenView: UIView!
    
    @IBOutlet weak var twilightZoneView: UIView!
    @IBOutlet weak var lightsOutView: UIView!
    @IBOutlet weak var thunderstormView: UIView!
    @IBOutlet weak var rainDropView: UIView!
    @IBOutlet weak var mightyUmbrellaView: UIView!
    @IBOutlet weak var eightBitView: UIView!
    @IBOutlet weak var moonlightView: UIView!
    @IBOutlet weak var windyDayView: UIView!
    @IBOutlet weak var partlyCloudyView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "App Icon"
        weatherLoaded = true
        setSelectedAppIcon(icon: (defaults.string(forKey: "userSavedAppIconString") ?? "Dodger Blue"), setIcon: false)
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AppIconViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dodgerBlueButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dodger Blue", setIcon: true)
    }
    
    @IBAction func lightDodgerBlueButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Light Dodger Blue", setIcon: true)
    }
    
    @IBAction func darkDodgerBlueButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dark Dodger Blue", setIcon: true)
    }
    
    @IBAction func mangoButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Mango", setIcon: true)
    }
    
    @IBAction func lightMangoButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Light Mango", setIcon: true)
    }
    
    @IBAction func darkMangoButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dark Mango", setIcon: true)
    }
    
    @IBAction func maximumRedButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Maximum Red", setIcon: true)
    }
    
    @IBAction func lightMaximumRedButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Light Maximum Red", setIcon: true)
    }
    
    @IBAction func darkMaximumRedButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dark Maximum Red", setIcon: true)
    }
    
    @IBAction func orchidButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Orchid", setIcon: true)
    }
    
    @IBAction func lightOrchidButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Light Orchid", setIcon: true)
    }
    
    @IBAction func darkOrchidButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dark Orchid", setIcon: true)
    }
    
    @IBAction func plumpPurpleButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Plump Purple", setIcon: true)
    }
    
    @IBAction func lightPlumpPurpleButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Light Plump Purple", setIcon: true)
    }
    
    @IBAction func darkPlumpPurpleButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dark Plump Purple", setIcon: true)
    }
    
    @IBAction func springGreenButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Spring Green", setIcon: true)
    }
    
    @IBAction func lightSpringGreenButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Light Spring Green", setIcon: true)
    }
    
    @IBAction func darkSpringGreenButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Dark Spring Green", setIcon: true)
    }
    
    @IBAction func twilightZoneButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Twilight Zone", setIcon: true)
    }
    
    @IBAction func lightsOutButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Lights Out", setIcon: true)
    }
    
    @IBAction func thunderstormButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Thunderstorm", setIcon: true)
    }
    
    @IBAction func rainDropButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Rain Drop", setIcon: true)
    }
    
    @IBAction func mightyUmbrellaButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Mighty Umbrella", setIcon: true)
    }
    
    @IBAction func eightBitButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "8-Bit", setIcon: true)
    }
    
    @IBAction func moonlightButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Moonlight", setIcon: true)
    }
    
    @IBAction func windyDayButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Windy Day", setIcon: true)
    }
    
    @IBAction func partlyCloudyButtonTapped(_ sender: UIButton) {
        setSelectedAppIcon(icon: "Partly Cloudy", setIcon: true)
    }
    
    func setSelectedAppIcon(icon: String, setIcon: Bool) {
        var color: UIColor?
        if (defaults.string(forKey: "userSavedColorString") == "Mango") {
            color = mango
        } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
            color = maximumRed
        } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
            color = dodgerBlue
        } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
            color = plumpPurple
        } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
            color = orchid
        } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
            color = springGreen
        } else {
            color = dodgerBlue
        }
        
        defaults.set(icon, forKey: "userSavedAppIconString")
        dodgerBlueView.layer.cornerRadius = 10
        lightDodgerBlueView.layer.cornerRadius = 10
        darkDodgerBlueView.layer.cornerRadius = 10
        mangoView.layer.cornerRadius = 10
        lightMangoView.layer.cornerRadius = 10
        darkMangoView.layer.cornerRadius = 10
        maximumRedView.layer.cornerRadius = 10
        lightMaximumRedView.layer.cornerRadius = 10
        darkMaximumRedView.layer.cornerRadius = 10
        orchidView.layer.cornerRadius = 10
        lightOrchidView.layer.cornerRadius = 10
        darkOrchidView.layer.cornerRadius = 10
        plumpPurpleView.layer.cornerRadius = 10
        lightPlumpPurpleView.layer.cornerRadius = 10
        darkOPlumpPurpleiew.layer.cornerRadius = 10
        springGreenView.layer.cornerRadius = 10
        lightSpringGreenView.layer.cornerRadius = 10
        darkSpringGreenView.layer.cornerRadius = 10
        twilightZoneView.layer.cornerRadius = 10
        lightsOutView.layer.cornerRadius = 10
        thunderstormView.layer.cornerRadius = 10
        rainDropView.layer.cornerRadius = 10
        mightyUmbrellaView.layer.cornerRadius = 10
        eightBitView.layer.cornerRadius = 10
        moonlightView.layer.cornerRadius = 10
        windyDayView.layer.cornerRadius = 10
        partlyCloudyView.layer.cornerRadius = 10
        
        dodgerBlueView.backgroundColor = .clear
        lightDodgerBlueView.backgroundColor = .clear
        darkDodgerBlueView.backgroundColor = .clear
        
        mangoView.backgroundColor = .clear
        lightMangoView.backgroundColor = .clear
        darkMangoView.backgroundColor = .clear
        
        maximumRedView.backgroundColor = .clear
        lightMaximumRedView.backgroundColor = .clear
        darkMaximumRedView.backgroundColor = .clear
        
        orchidView.backgroundColor = .clear
        lightOrchidView.backgroundColor = .clear
        darkOrchidView.backgroundColor = .clear
        
        plumpPurpleView.backgroundColor = .clear
        lightPlumpPurpleView.backgroundColor = .clear
        darkOPlumpPurpleiew.backgroundColor = .clear
        
        springGreenView.backgroundColor = .clear
        lightSpringGreenView.backgroundColor = .clear
        darkSpringGreenView.backgroundColor = .clear
        
        twilightZoneView.backgroundColor = .clear
        lightsOutView.backgroundColor = .clear
        thunderstormView.backgroundColor = .clear
        rainDropView.backgroundColor = .clear
        mightyUmbrellaView.backgroundColor = .clear
        eightBitView.backgroundColor = .clear
        moonlightView.backgroundColor = .clear
        windyDayView.backgroundColor = .clear
        partlyCloudyView.backgroundColor = .clear
        
        if icon == "Dodger Blue" {
            dodgerBlueView.backgroundColor = color
            
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
        
        if icon == "Light Dodger Blue" {
            lightDodgerBlueView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightDodgerBlue") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Dark Dodger Blue" {
            darkDodgerBlueView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DarkDodgerBlue") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Mango" {
            mangoView.backgroundColor = color
            
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
        
        if icon == "Light Mango" {
            lightMangoView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightMango") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Dark Mango" {
            darkMangoView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DarkMango") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Maximum Red" {
            maximumRedView.backgroundColor = color
            
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
        
        if icon == "Light Maximum Red" {
            lightMaximumRedView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightMaximumRed") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Dark Maximum Red" {
            darkMaximumRedView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DarkMaximumRed") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Orchid" {
            orchidView.backgroundColor = color
            
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
        
        if icon == "Light Orchid" {
            lightOrchidView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightOrchid") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Dark Orchid" {
            darkOrchidView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DarkOrchid") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Plump Purple" {
            plumpPurpleView.backgroundColor = color
            
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
        
        if icon == "Light Plump Purple" {
            lightPlumpPurpleView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightPlumpPurple") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Dark Plump Purple" {
            darkOPlumpPurpleiew.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DarkPlumpPurple") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Spring Green" {
            springGreenView.backgroundColor = color
            
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
        
        if icon == "Light Spring Green" {
            lightSpringGreenView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-LightSpringGreen") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Dark Spring Green" {
            darkSpringGreenView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-DarkSpringGreen") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success! Icon has been changed")
                    }
                }
            }
        }
        
        if icon == "Twilight Zone" {
            twilightZoneView.backgroundColor = color
            
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
        
        if icon == "Lights Out" {
            lightsOutView.backgroundColor = color
            
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
        
        if icon == "Thunderstorm" {
            thunderstormView.backgroundColor = color
            
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
        
        if icon == "Rain Drop" {
            rainDropView.backgroundColor = color
            
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
        
        if icon == "Mighty Umbrella" {
            mightyUmbrellaView.backgroundColor = color
            
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
        
        if icon == "8-Bit" {
            eightBitView.backgroundColor = color
            
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
        
        if icon == "Moonlight" {
            moonlightView.backgroundColor = color
            
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
        
        if icon == "Windy Day" {
            windyDayView.backgroundColor = color
            
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
        
        if icon == "Partly Cloudy" {
            partlyCloudyView.backgroundColor = color
            
            if setIcon == true {
                UIApplication.shared.setAlternateIconName("AppIcon-PartlyCloudy") { error in
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
