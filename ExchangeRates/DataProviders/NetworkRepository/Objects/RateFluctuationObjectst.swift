//
//  RateFluctuationObjectst.swift
//  ExchangeRates
//
//  Created by Daniel Washington Ignacio on 14/10/23.
//

import Foundation

typealias RatesFluctuationObject = [String: FluctuationObject]

struct FluctuationObject: Codable {
    let endRate, change, changePct: Double
    
    enum CodingKeys: String, CodingKey {
        case endRate = "end_rate"
        case change
        case changePct = "change_pct"
    }
}
