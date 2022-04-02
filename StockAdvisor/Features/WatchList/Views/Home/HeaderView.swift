//
//  HeaderView.swift
//  StockAdvisor
//
//  Created by David on 3/30/22.
//

import SwiftUI

//  Displays the App name "Stocks++" the date and the "+" add to watch list button
struct HeaderView: View {
    
    @Binding var stocks: [String]
    
    @State private  var showSearch = false
    
    
    var body: some View {
        HStack  {
            VStack(alignment: .leading, spacing: -5.0) {
                Text("Stocks++")
                    .foregroundColor(.white)
                    .bold()
                // Today's date in header
                Text("\(Date(), formatter: dateFormater)")
                    .foregroundColor(.gray)
                    .bold()
            } .font(.title)
            Spacer()
            
            Button  {
                showSearch.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }.sheet(isPresented: $showSearch, onDismiss: {
                self.stocks  = UserDefaultsManager.shared.savedSymbols
            }, content: {
                SearchView(isPresented: $showSearch)
            })
        }
    }
    
    
    private let dateFormater: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat =  "MMMM dd"
        return formatter
    }()
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(stocks:  .constant(["AAPL", "GOOG"]))
            .background(Color.black)
    }
}
