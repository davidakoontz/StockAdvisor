//
//  DismissButtonView.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import SwiftUI

struct DismissButtonView: View {
    
    @Binding  var isPresented: Bool
    @Binding  var title: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)// middle of page
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                isPresented.toggle()    // dismiss  the view
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(10)
            })
        }
    }
}

struct DismissButtonView_Previews: PreviewProvider {
    static var previews: some View {

        DismissButtonView( isPresented: .constant(true), title: .constant("Dismissable View") )
            .background(.black)
    }
}
