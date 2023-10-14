//
//  CurrencyRouter.swift
//  ExchangeRates
//
//  Created by Daniel Washington Ignacio on 13/10/23.
//

import Foundation

enum CurrencyRouter {
    
    case symbols
    
    var path: String{
        switch self {
        case .symbols:
            return RatesApi.symbols
        }
    }
    
    func asUrlRequest() throws -> URLRequest? {
        guard var url = URL(string: RatesApi.baseUrl) else { return nil }
        
        switch self {
        case .symbols:
            url.append(queryItems: [
            URLQueryItem(name: "access_key", value: "6180f4593c8a5173453c767edf52b028"),
            URLQueryItem(name: "fomart", value: "1")])
            
            
            
            var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
            request.httpMethod =  HttpMethod.get.rawValue
            request.addValue(RatesApi.apiKey, forHTTPHeaderField: "apikey")
            print(request)
            return request
        }
        
    }
    
    
}
