//
//  GlobalQuote.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import Foundation
import UIKit

//
//{
//    "Global Quote": {
//        "01. symbol": "IBM",
//        "02. open": "132.0100",
//        "03. high": "133.0800",
//        "04. low": "131.3900",
//        "05. price": "132.1300",
//        "06. volume": "2616524",
//        "07. latest trading day": "2022-03-30",
//        "08. previous close": "131.9400",
//        "09. change": "0.1900",
//        "10. change percent": "0.1440%"
//    }
//}


struct GlobalQuoteResponse:  Codable {
    
    var quote:  Quote

    enum  CodingKeys: String, CodingKey {
        case quote = "Global Quote"         //  header in JSON response
    }
}


