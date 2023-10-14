//
//  RatesApi.swift
//  ExchangeRates
//
//  Created by Daniel Washington Ignacio on 13/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct RatesApi {
    
    static let baseUrl = "http://api.exchangeratesapi.io/v1"
    static let apiKey = "access_key=6180f4593c8a5173453c767edf52b028&format=1"
    
    static let fluctuation = "/fluctuation"
    static let symbols = "/latest"
    static let timeseries = "/timeseries"
    static let lastest = "/latest"
    
}
