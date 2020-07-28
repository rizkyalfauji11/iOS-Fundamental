//
//  BodyCardView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI
import RxSwift
import RxCocoa


struct BodyCardView: View {
    var rating: Double
    var description: String
    var releasedDate: String
    var body: some View {
        ZStack(alignment: .topLeading){
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(self.releasedDate)
                        .fontWeight(.thin)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
                        .font(.system(size: 12))
                    
                    Text(self.description)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
                        .font(.body)
                }
                Spacer()
            }
            .padding(.bottom, 24)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
            .offset(y: 24)
            .frame(width: (UIScreen.main.bounds.width*0.9))
            
            HStack{
                Spacer()
                HStack(alignment: .center){
                    RatingView(value: self.rating)
                    Text(String(self.rating))
                        .font(.system(size: 14))
                        .fontWeight(.thin)
                }
                    
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 2)
            }
        }
        .frame(width: (UIScreen.main.bounds.width * 0.9))
    }
}

struct BodyCardView_Previews: PreviewProvider {
    static var previews: some View {
        BodyCardView(rating: 1.0, description: "String", releasedDate: "2003-08-07")
    }
}
