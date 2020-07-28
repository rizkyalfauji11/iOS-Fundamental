//
//  TitleCardView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI

struct TitleCardView: View {
    var title: String
    var genre: [Genre]
    var body: some View {
        VStack(spacing: 16){
            Text(self.title)
                .font(.title)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            HStack{
                ForEach(0..<self.genre.count){i in
                    Text(self.genre[i].name+" ")
                        .fontWeight(.thin)
                        .font(.caption)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                }
            }
        }
        .padding(8)
        .frame(minWidth: (UIScreen.main.bounds.width / 1.25), maxHeight: 130)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

struct TitleCardView_Previews: PreviewProvider {
    static var previews: some View {
        TitleCardView(title: "Hello", genre: [])
    }
}
