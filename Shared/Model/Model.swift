//
//  Model.swift
//  WaterControllApp WatchKit Extension
//
//  Created by Физтех.Радио on 29.03.2021.
//

import Foundation

class WaterModel {
    static let HOW_MANY_GLASSES: Int = 8
    
    static func GetDataToday() -> Double {
        let defaults = UserDefaults.standard
        let recordedDate = defaults.string(forKey: "Date")
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let currentDate = formatter.string(from: date)
        
        if (recordedDate != currentDate) {
            defaults.set(currentDate, forKey: "Date")
            defaults.set(0.0, forKey: "Glasses")
        }
        
        return defaults.double(forKey: "Glasses")
    }
    
    static func SetDataToday(glasses: Double) {
        let defaults = UserDefaults.standard
        defaults.set(glasses, forKey: "Glasses") 
    }
}
