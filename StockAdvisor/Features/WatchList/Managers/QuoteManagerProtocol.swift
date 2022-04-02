//
//  QuoteManagerProtocol.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] {  get set }
    func download(stocks:  [String], completion: @escaping  (Result<[Quote], NetworkError>) -> Void)
}
