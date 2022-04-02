//
//  SearchTextView.swift
//  StockAdvisor
//
//  Created by David on 3/31/22.
//

import SwiftUI

struct SearchTextView: View {
    
    @Binding var searchTerm: String
    
    // search in Watch List function
    // FIXME: does not have an action (return doesn't work)
    var body: some View {
        // This  field does NOT search the local WatchList like it was envisioned - it does not work at  all
        CustomTextField(placeholder: Text("Search for...")
                            .foregroundColor(Color.gray),
                    text: $searchTerm)
        .foregroundColor(.white)
        .padding(.leading, 40)
        .frame(height: 40)
        .background(ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color.gray.opacity(0.6))
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)
                .padding(.leading, 10)
        })
            
    }
}

struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextView(searchTerm: .constant(""))
            .background(.black)
    }
}
