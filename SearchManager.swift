//
//  SearchManager.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import Foundation


// Search on AlphVantage site for stock symbols
//
final class  SearchManager: ObservableObject {
    
    @Published var  matches = [BestMatches]()
    
    func searchStocks(keyword: String)  {
        
        let defaultUrl = URL(string: "https://www.merriam-webster.com/thesaurus/error")
        
        //guard let searchString =  keyword  else { return  }
        
        NetworkManager<SearchResponse>().fetch(from: (URL(string: API.symbolSearchUrl(for: keyword)) ?? defaultUrl)!  ) { result in
            switch result  {
            case  .failure(let  error):
                print(error)
            case .success(let response):
                DispatchQueue.main.async {
                    self.matches = response.bestMatches
                }
            }
        }
    }
}
