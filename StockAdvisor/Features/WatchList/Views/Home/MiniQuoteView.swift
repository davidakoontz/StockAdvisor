//
//  MiniQuoteView.swift
//  StockAdvisor
//
//  Created by David on 3/31/22.
//

import SwiftUI

struct MiniQuoteView: View {
    
    @ObservedObject var stockQuotes: StockQuoteManager
                                    // MockQuoteManager
                                    // StockQuoteManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)  {
            HStack {
                ForEach(stockQuotes.quotes) { quote in
                    VStack {
                        Text(quote.symbol)
                            .font(.subheadline)
                            .bold()
                        Text(quote.price)
                            .font(.subheadline)
                        
                        Text(quote.change)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .frame(width: 100)
                            .background(RoundedRectangle(cornerRadius: 5.0)
                                .fill(Double(quote.change)! > 0.0 ? Color.green :  Color.red ), alignment: .trailing)
                    }  .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.white.opacity(0.2)))
                        .foregroundColor(Color.white)
                }
            } .background(Color.black)
        } .onAppear {
            stockQuotes.download(stocks: [], completion: { _  in })
        }
    }
}

//struct MiniQuoteView_Previews: PreviewProvider {
//    static var previews: some View {
//
//       MiniQuoteView(stockQuotes: MockQuoteManager().download(stocks: [], completion: { _ in }) )
//    }
//}
