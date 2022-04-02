//
//  SearchView.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @Binding  var isPresented: Bool
    
    @State private var title = "Search"
    
    @ObservedObject var searchManager = SearchManager()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)    // background
            
            VStack {
                DismissButtonView(isPresented: $isPresented, title: $title)
                HStack {
                    SearchTextView(searchTerm: $searchTerm)
                    // FIXME: make search field RETURN call button action
                    // main search screen
                    Button(action:  {
                        searchManager.searchStocks(keyword:
                            searchTerm)
                    }) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                // scrolling list of results
                ScrollView {
                    ForEach(searchManager.matches) { item  in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.symbol)
                                    .font(.title)
                                    .bold()
                                Text(item.type)
                                    .font(.body)
                            }
                            Spacer()
                            Text(item.name)
                            Spacer()
                            // save stock symbol in  User  Defaults
                            Button(action: {
                                UserDefaultsManager.shared.set(symbol: item.symbol)
                            })  {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            }
                        }
                        .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height:  1)
                    }
                }
            }
            .padding(.top, 50)
            .padding(.horizontal, 16)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isPresented: .constant(true))
    }
}
