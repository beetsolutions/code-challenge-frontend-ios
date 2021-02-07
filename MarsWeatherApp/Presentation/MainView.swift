//
//  ContentView.swift
//  MarsWeatherApp
//
//  Created by Etukeni E. Ndecha O. on 2021-02-06.
//  Copyright © 2021 Etukeni E. Ndecha O. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if(!viewModel.loading) {
                    List(self.viewModel.weatherInformation, id: \.key) {
                        CardView(weatherInformation: $0)
                    }
                }
                LoadingView(isAnimating: viewModel.loading, style: .large, color: .black)
            }
            .navigationBarTitle("Mars Weather", displayMode: .automatic)
        }.onAppear {
            self.viewModel.getWeatherInformation()
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
