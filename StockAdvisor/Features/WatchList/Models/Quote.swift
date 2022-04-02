//
//  Quote.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import Foundation

struct Quote: Codable {
    var symbol:         String
    var open:           String
    var high:           String
    var low:            String
    var price:          String
    var volume:         String
    var day:            String
    var previousClose:  String
    var change:         String
    var changePercent:  String
    
    enum CodingKeys: String, CodingKey {
        case symbol          = "01. symbol"
        case open            = "02. open"
        case high            = "03. high"
        case low             = "04. low"
        case price           = "05. price"
        case volume          = "06. volume"
        case day             = "07. latest trading day"
        case previousClose   = "08. previous close"
        case change          = "09. change"
        case changePercent   = "10. change percent"
    }
}

extension Quote: Identifiable {
    var id: UUID {
        return UUID()
    }
}
