//
//  DateExtensions.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 1/19/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import Foundation

extension Date {
    func localString(dateStyle: DateFormatter.Style = .medium,
                     timeStyle: DateFormatter.Style = .medium) -> String {
        return DateFormatter.localizedString(
            from: self,
            dateStyle: dateStyle,
            timeStyle: timeStyle)
    }
    
    var midnight: Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
}
