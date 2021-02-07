//
//  MainViewModel.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {

    private let url = "https://api.nasa.gov/insight_weather/?api_key=GFhPC48DbHZzKDwgBawNHZxLNRxyeT5z9m6GqHV8&feedtype=json&ver=1.0"
    private var task: AnyCancellable?
    
    @Published var weatherInformation: [WeatherInformation] = []
    @Published var loading: Bool = true
    
    func getWeatherInformation() {
        
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .tryMap { data, response in
                var res : [WeatherInformation] = []
                
                do {
                    if let dataResponse = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> {
                        
                        let keys = self.getSolKeys(with: dataResponse["sol_keys"] as? Array<String>)
                        let weatherInformationData = self.getWeatherInformation(with: dataResponse, keys: keys)
                        res.append(contentsOf: weatherInformationData)
                        print(weatherInformationData)
                    }
                } catch {
                    print("json failed")
                }
                return res
        }
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                self.loading = false
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }, receiveValue: { data in
            self.weatherInformation.append(contentsOf: data)
        })
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
    
    func createSolData(dataDict: Dictionary<String, Any>) -> SolData {
        return SolData(solDict: dataDict)
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
}
