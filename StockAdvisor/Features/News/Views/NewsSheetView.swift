//
//  NewsSheetView.swift
//  StockAdvisor
//
//  Created by David on 3/31/22.
//

import SwiftUI

struct NewsSheetView: View {
    
    @Binding var newsOpen: Bool
    @ObservedObject var  newsManager: NewsDownloadManager
    
    init(newsOpen: Binding<Bool>, newsManager:  NewsDownloadManager)  {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self._newsOpen =  newsOpen
        self.newsManager = newsManager
    }
    
    
    var body: some View {
        BottomSheetView(isOpen: $newsOpen, maxHeight: UIScreen.main.bounds.height *  0.89) {
            ZStack {
                Color.white     // background
                Rectangle().fill(Color.black.opacity(0.8))
                
                VStack(alignment: .leading) {
                   //  header view
                    NewsHeaderView()
                    Spacer()
                    //  list view
                    NewsListView(newsManager: newsManager)
                }
                .padding()
            } // Zstack
        }.edgesIgnoringSafeArea(.vertical)
        // BottomSheetView
    } // body View
       
}

//struct NewsSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsSheetView()
//    }
//}
