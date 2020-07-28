//
//  RatingView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    var value: Double
    var body: some View {
        HStack{
            ForEach(0..<Int(value)){_ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(0)
                    .frame(width: 10, height: 10)
            }
            
            ForEach(Int(value)..<5){_ in
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                    .frame(width: 10, height: 10)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(value: 4.0)
    }
}
