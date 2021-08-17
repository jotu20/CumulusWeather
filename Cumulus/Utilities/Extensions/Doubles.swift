//
//  Doubles.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 2/1/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import Foundation

extension Double {
    // Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
