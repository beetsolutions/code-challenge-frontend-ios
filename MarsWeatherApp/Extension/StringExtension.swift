//
//  StringExtension.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

extension String {
    func fromUTCToDateMonthString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let currentDate = formatter.date(from: self)
        formatter.locale = Locale(identifier: "en_EN")
        formatter.dateFormat = "d MMM"
        return formatter.string(from: currentDate!)
    }
}
