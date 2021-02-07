//
//  SolData.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

struct SolData : Codable {
    var season: String
    var wind: WeatherData
    var pressure: WeatherData
    var lastDate: String
    var temperature: WeatherData
    var firstDate: String
    
    init(solDict: Dictionary<String, Any>) {
        self.season = solDict["Season"] as? String ?? ""
        self.wind = WeatherData(weatherDataDict: solDict["WD"] as? Dictionary<String, Any> ?? [:])
        self.pressure = WeatherData(weatherDataDict: solDict["PRE"] as? Dictionary<String, Any> ?? [:])
        self.lastDate = solDict["Last_UTC"] as? String ?? ""
        self.temperature = WeatherData(weatherDataDict: solDict["AT"] as? Dictionary<String, Any> ?? [:])
        self.firstDate = solDict["First_UTC"] as? String ?? ""
    }
}
