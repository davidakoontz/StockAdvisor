//
//  QuoteCell.swift
//  StockAdvisor
//
//  Created by David on 3/31/22.
//

import SwiftUI

//  Displays one row of stock info in the Watch List
//
struct QuoteCell: View {
    var quote: Quote
    
    var body: some View {
        HStack  {
            VStack {
                Text(quote.symbol)
                    .font(.body)
                    .bold()
                Text(quote.symbol)  // should be company name
                    .font(.caption)
                    
                // FIXME: get stock name from BestMatches Symbol_Search
            }
            Spacer()

            VStack {
                Text(quote.price.toCurrency())
                    .font(.body)
                    .bold()
                Text(quote.change.toPrecentage())
                    .font(.caption)
                    .frame(width: 60)           //  controling the stack width
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 5.0)
                        .fill(Double(quote.change)! > 0.0 ? Color.green : Color.red),
                                alignment: .trailing )
            }
        }
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static let apple =  Quote(symbol: "AAPL", open: "135.22", high: "138.38", low: "134.83", price: "137.76", volume: "200000", day: "2022-2-7", previousClose: "134.68", change: "0.21", changePercent: "0.034%")
    static var previews: some View {
        QuoteCell(quote: apple)
    }
}
