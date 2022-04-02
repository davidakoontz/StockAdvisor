//
//  Search.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import Foundation

struct BestMatches: Codable, Identifiable {
    var id: UUID { return UUID() }
    var symbol: String
    var name: String
    var type: String
    var region: String
    var marketOpen: String
    var marketClose: String
    var timezone: String
    var currency: String
    var matchScore: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol =       "1. symbol"         // ticker symbol
        case name =         "2. name"           // Company  name
        case type =         "3. type"           // Equity
        case region =       "4. region"         // United States
        case marketOpen =   "5. marketOpen"     // 9:30
        case marketClose =  "6. marketClose"    // 16:00
        case timezone =     "7. timezone"       // UTC-04
        case currency =     "8. currency"       //  USD
        case matchScore =   "9. matchScore"     // 1.0000 ... 0.4706 .. 0.
    }
}
