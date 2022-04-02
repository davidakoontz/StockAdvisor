//
//  MockQuoteManager.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import Foundation

final class MockQuoteManager: QuoteManagerProtocol,  ObservableObject {
    
    @Published var quotes: [Quote] = []
    
    func  download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl  = Quote(symbol: "AAPL", open: "135.90", high: "136.39", low: "133.77", price: "135.13", volume: "200000", day: "2021-12-23", previousClose: "135.78", change: "-0.26", changePercent: "-0.19%")
        let goog  = Quote(symbol: "GOOG", open: "2099.51", high: "2102.03", low: "2077.32", price: "2095.89", volume: "201000", day: "2021-12-23", previousClose: "2098.81", change: "-0.51", changePercent: "-0.024%")
    
        // create a bunch of downloads
        for _ in 0..<8  {
            quotes.append(contentsOf: [aapl, goog])
        }
    }
    
}
