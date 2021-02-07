//
//  WeatherData.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    var avarageValue: Double
    var recordedSamplesOverSol: Int
    var minValue: Double
    var maxValue: Double
    
    init(weatherDataDict: Dictionary<String, Any>) {
        self.avarageValue = weatherDataDict["av"] as? Double ?? 0
        self.recordedSamplesOverSol = weatherDataDict["ct"] as? Int ?? 0
        self.minValue = weatherDataDict["mn"] as? Double ?? 0
        self.maxValue = weatherDataDict["mx"] as? Double ?? 0
    }
}
