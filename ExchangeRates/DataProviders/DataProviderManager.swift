//
//  DataProviderManager.swift
//  ExchangeRates
//
//  Created by Daniel Washington Ignacio on 14/10/23.
//

import Foundation


protocol DataProviderManagerDelegate {
    func success(model: Any)
    func errorData(_ provider: DataProviderManagerDelegate?, error: Error)
}

extension DataProviderManagerDelegate {
    func success(model: Any) {
        preconditionFailure("This method must be overridden")
    }
    func errorData(_ provider: DataProviderManagerDelegate?, error: Error) {
        print(error.localizedDescription)
    }
    
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
