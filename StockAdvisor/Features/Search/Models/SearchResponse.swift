//
//  SearchResponse.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import Foundation

struct  SearchResponse: Codable {
    var bestMatches: [BestMatches]
    
}
