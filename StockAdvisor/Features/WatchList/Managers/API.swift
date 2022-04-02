//
//  API.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import Foundation

struct API {
    
    // EXAMPLES
    // https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=AAPL&apikey=41UY1WI73RS730QQ
    //
    //
    enum AVFunction: String {
        case search = "SYMBOL_SEARCH"
        case quote =  "GLOBAL_QUOTE"
    }
    
    static var baseUrl:  String {
        return "https://www.alphavantage.co/query?"
    }
    
    static func symbolSearchUrl(for searchString: String) ->  String {
        return urlBy(function: .search, searchString: searchString)
    }
    
    static func quoteUrl(for searchString: String) -> String {
        return urlBy(function: .quote, searchString: searchString)
    }
    
    private static func  urlBy(function: AVFunction, searchString: String) ->  String {
        switch function {
        case .search:
            print("\n " +  "\(baseUrl)function=\(AVFunction.search.rawValue)&apikey=\(key)&keywords=\(searchString)"  + "\n")
            
            return  "\(baseUrl)function=\(AVFunction.search.rawValue)&apikey=\(key)&keywords=\(searchString)"
        case .quote:
            print("\n " +  "\(baseUrl)function=\(AVFunction.quote.rawValue)&apikey=\(key)&symbol=\(searchString)" + "\n")
            
            return  "\(baseUrl)function=\(AVFunction.quote.rawValue)&apikey=\(key)&symbol=\(searchString)"
        }
    }

}

extension API {
    static var key: String {
        return "41UY1WI73RS730QQ"      // AlphaVantage key for david@koontz.name
    }
}
