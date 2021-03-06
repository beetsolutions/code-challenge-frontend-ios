//
//  WeatherInformationMapper.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation

class WeatherInformationMapper {
    
    func map(with data: Dictionary<String, Any>, keys: Array<String>) -> Array<WeatherInformation>{
        var weatherInformation: Array<WeatherInformation> = []
        for sol in keys {
            let dataObject = self.createSolData(dataDict: data[sol] as? Dictionary<String, Any> ?? [:])
            
            weatherInformation.append(self.createWeatherInformation(weatherData: dataObject, forSol: sol))
        }
        return weatherInformation
    }
    
    func createWeatherInformation(weatherData: SolData, forSol: String) -> WeatherInformation {
        return WeatherInformation (
            key: forSol,
            pressure: WeatherValue(
                average: weatherData.pressure.avarageValue.formattedAsPressureString(),
                min: weatherData.pressure.avarageValue.formattedAsPressureString(),
                max: weatherData.pressure.avarageValue.formattedAsPressureString()),
            wind: WeatherValue(
                average: weatherData.wind.avarageValue.formattedAsWindString(),
                min: weatherData.wind.avarageValue.formattedAsWindString(),
                max: weatherData.wind.avarageValue.formattedAsWindString()),
            temperature: WeatherValue(
                average: weatherData.temperature.avarageValue.formattedAsTemperatureString(),
                min: weatherData.temperature.avarageValue.formattedAsTemperatureString(),
                max: weatherData.temperature.avarageValue.formattedAsTemperatureString()),
            firstDate:weatherData.firstDate.fromUTCToDateMonthString(),
            season: weatherData.season
        )
    }

    func createSolData(dataDict: Dictionary<String, Any>) -> SolData {
        return SolData(solDict: dataDict)
    }
    
    func getSolKeys(with array: Array<String>?) -> Array<String> {
        var solKeys: Array<String> = []
        if let keysArray = array {
            solKeys = keysArray
        }
        return solKeys
    }
    
    func getWeatherInformation(with data: Dictionary<String, Any>, keys: Array<String>) -> Array<WeatherInformation>{
        var weatherInformation: Array<WeatherInformation> = []
        for sol in keys {
            let dataObject = self.createSolData(dataDict: data[sol] as? Dictionary<String, Any> ?? [:])
            
            weatherInformation.append(self.createWeatherInformation(weatherData: dataObject, forSol: sol))
        }
        return weatherInformation
    }
}
