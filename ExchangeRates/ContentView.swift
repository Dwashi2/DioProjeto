//
//  ContentView.swift
//  ExchangeRates
//
//  Created by Daniel Washington Ignacio on 13/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                doFetchData()
            } label: {
                Image(systemName: "network")
            }
        }
        .padding()
    }
    
    private func doFetchData() {
        let rateFluctuationDataprovider = RatesFluctuationDataProvider()
        rateFluctuationDataprovider.delegate = self
        rateFluctuationDataprovider.fetchFluctuation(by: "BRL", from: ["USD","EUR"], startDate: "2022-10-11", endDate: "2022-11-11")
        
        let rateSymbolDataProvider = CurrencySymbolsDataProvider()
        rateSymbolDataProvider.delegate = self
        rateSymbolDataProvider.fetchSymbols()
        
        let rateHistoricalDataProvider = RatesHitoricalDataProvider()
        rateHistoricalDataProvider.delegate = self
        rateHistoricalDataProvider.fetchTimeseries(by: "BRL", from: ["USD", "EUR"], startDate: "2022-10-11", endDate: "2022-11-11")
    }
}

#Preview {
    ContentView()
}


extension ContentView: RatesFluctuationDataProviderDelegate{
    func success(model: RatesFluctuationObject) {
       // print("RateFluctuationModel: \(model)\n\n")
    }
}

extension ContentView: CurrencySymbolsDataProviderDelegate {
    func success(model: CurrencySymbolObject) {
      //  print("RateSymbolDataProviderDelegate: \(model) \n\n")
    }
}

extension ContentView: RatesHitoricalDataProviderDelegate {
    func success(model: RatesHistoricalObject) {
      //  print("RatesHistoricalModel: \(model)\n\n")
    }
    
    
}
