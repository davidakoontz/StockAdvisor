//
//  NewsHeaderView.swift
//  StockAdvisor
//
//  Created by David on 3/31/22.
//

import SwiftUI

struct NewsHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top News")
                .font(.title)
                .foregroundColor(.white)
            
            HStack(spacing: 2)  {
                Text("Stocks++")
                Spacer()
                Image(systemName: "applelogo")
                Spacer()
                Text("NewsAPI.org")
            }
            .font(.title2)
            .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.gray)
                .frame(height: 1)
        }
    }
}

struct NewsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeaderView()
            .background(Color.black)
    }
}
