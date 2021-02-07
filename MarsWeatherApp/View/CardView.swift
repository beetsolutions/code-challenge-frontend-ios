//
//  CardView.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-07.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    private let weatherInformation: WeatherInformation
    
    init(weatherInformation: WeatherInformation) {
        self.weatherInformation = weatherInformation
    }
    
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sol \(weatherInformation.key)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.secondary).padding(.bottom, 10)
                    Text(weatherInformation.firstDate)
                        .font(.headline).padding(.bottom, 10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Pressure (pa)")
                                .font(.headline)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                            Text("HIGH: \(weatherInformation.pressure.max)".uppercased())
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("LOW: \(weatherInformation.pressure.min)".uppercased())
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Temperature (C°)")
                                .font(.headline)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                            Text("HIGH: \(weatherInformation.temperature.max)".uppercased())
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("LOW: \(weatherInformation.temperature.min)".uppercased())
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }.padding(.leading, 10)
                    }
                    .foregroundColor(.secondary).padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Wind (m/s)")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                        Text("HIGH: \(weatherInformation.wind.max)".uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("LOW: \(weatherInformation.wind.min)".uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }.padding(.bottom, 10)

                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
            .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(weatherInformation: WeatherInformation(
        key: "772",
        pressure: WeatherValue(average: "10", min: "10", max: "10"),
        wind: WeatherValue(average: "10", min: "10", max: "10"),
        temperature: WeatherValue(average: "10", min: "10", max: "10"),
        firstDate: "28 Jan",
        season: "Winter"))
    }
}
