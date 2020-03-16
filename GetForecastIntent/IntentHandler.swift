//
//  IntentHandler.swift
//  GetForecastIntent
//
//  Created by Joseph Szafarowicz on 10/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        guard intent is ForecastIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        
        return ForecastIntentHandler()
    }
}
