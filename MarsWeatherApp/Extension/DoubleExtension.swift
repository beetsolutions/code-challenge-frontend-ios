//
//  DoubleExtension.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

extension Double {
    func formattedAsTemperatureString() -> String {
        return String(format: "%.1f", self)
    }
    
    func formattedAsWindString() -> String {
        return String(format: "%.0f", self)
    }
    
    func formattedAsPressureString() -> String {
        return String(format: "%.1f", self)
    }
}
