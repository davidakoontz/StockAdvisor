//
//  ContentView.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stockManager = StockQuoteManager()
    //  MockQuoteManager()
    // StockQuoteManager()
    
    @ObservedObject var newsManager = NewsDownloadManager()
    
    @State private var stocks = UserDefaultsManager.shared.savedSymbols
    // ["AAPL",  "GOOG"]
    @State private var searchTerm = ""
    @State private var newsOpen = false
    @State private var oldStocks = [String]()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    
    // displays the  main app screen - the  titles & Watch List  with quotes
    //
    var body: some View {
        ZStack {
            Color.black  // background
            
            VStack(alignment: .leading) {
                if newsOpen {
                    withAnimation {
                        MiniQuoteView(stockQuotes: stockManager)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .frame(height: newsOpen ? 100 : 0)
                            .transition(.move(edge: .top))
                    }
                } else {
                    withAnimation  {
                        HeaderView(stocks: $stocks)
                            .padding(.top, 50)
                            .frame(height: newsOpen ? 0 : 100)
                            .transition(.move(edge: .top))
                    }
                }
                
                List {
                    Group {
                        SearchTextView(searchTerm: $searchTerm)
                        
                        ForEach(getQuotes() ) { quote in
                            QuoteCell(quote: quote)
                        }
                    } // Group
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    // List
                }.onAppear {
                    fetchData(for: stocks)
                    oldStocks = stocks      // cacheing
                }.onChange(of: stocks, perform: {  value in
                    fetchData(for: stocks.difference(from: oldStocks))
                    oldStocks = stocks      // refresh cache
                })
                .listStyle(PlainListStyle())
                .foregroundColor(.white)
            } // VStack
            .padding(.horizontal, 32)
            .padding(.bottom,  UIScreen.main.bounds.height * 0.21) // space for  news frame
            // NewsSheetView()
            NewsSheetView(newsOpen: $newsOpen, newsManager: newsManager)
        }   // ZStack
        .background(.black)
        .edgesIgnoringSafeArea(.all)
        
    }   //  body View
    
    // cache of quotes
    private func getQuotes() -> [Quote] {
        return searchTerm.isEmpty  ? stockManager.quotes : stockManager.quotes.filter {
            $0.symbol.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    private func fetchData(for symbols: [String]) {
        stockManager.download(stocks: symbols) { _ in
            // ignoring the  completion this time
        }
    }
}   // Content View
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
