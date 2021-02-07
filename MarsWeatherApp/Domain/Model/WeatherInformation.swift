//
//  WeatherInformation.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

struct WeatherInformation : Decodable {
    let key: String
    let pressure: WeatherValue
    let wind: WeatherValue
    let temperature: WeatherValue
    let firstDate: String
    let season: String
    
    init(key: String, pressure: WeatherValue, wind: WeatherValue, temperature: WeatherValue, firstDate: String, season: String) {
        self.key = key
        self.pressure = pressure
        self.wind = wind
        self.temperature = temperature
        self.firstDate = firstDate
        self.season = season
    }
}
