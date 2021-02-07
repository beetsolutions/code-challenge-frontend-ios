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
    
    private let mapper = WeatherInformationMapper()
    
    func getWeatherInformation() {
        
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .tryMap { data, response in
                var res : [WeatherInformation] = []
                
                do {
                    if let dataResponse = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> {
                        
                        let keys = self.mapper.getSolKeys(with: dataResponse["sol_keys"] as? Array<String>)
                        let weatherInformationData = self.mapper.map(with: dataResponse, keys: keys)
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
}
