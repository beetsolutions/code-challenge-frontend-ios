//
//  WeatherValue.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

struct WeatherValue : Decodable {
    let average: String
    let min: String
    let max: String
    
    init(average: String, min: String, max: String) {
        self.average = average
        self.min = min
        self.max = max
    }
}
