//
//  RatesHitoricalDataProvider.swift
//  ExchangeRates
//
//  Created by Daniel Washington Ignacio on 14/10/23.
//

import Foundation

protocol RatesHitoricalDataProviderDelegate: DataProviderManagerDelegate {
    func success(model: RatesHistoricalObject)
}

class RatesHitoricalDataProvider: DataProviderManager<RatesHitoricalDataProviderDelegate, RatesHistoricalObject> {
    
    private let ratesStore: RatesStore
    
    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }
    
    func fetchTimeseries(by base: String, from symbols: [String], startDate: String, endDate: String) {
        Task.init {
            do {
                let model = try await ratesStore.fetchTimeseries(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: model)
            }catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
