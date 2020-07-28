//
//  GameRow.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 15/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameRow: View {
    var game: Game
    
    var body: some View {
        HStack(alignment: .top, spacing: 0){
            WebImage(url: URL(string: self.game.backgroundImage))
                .resizable()
                .placeholder{Rectangle().foregroundColor(.gray)}
                .indicator(.activity)
                .animation(.easeOut(duration: 0.5))
                .transition(.fade)
                .frame(maxWidth: (UIScreen.main.bounds.width / 2.5), minHeight: 120, maxHeight: 120)
            
            VStack(alignment: .leading, spacing: 0){
                Text(self.game.name)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 10, trailing: 0))
                HStack{
                    RatingView(value: self.game.rating)
                    
                    Text(String(self.game.rating))
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                }
                .fixedSize(horizontal: false, vertical: true)
                
                Text(self.game.released)
                    .font(.system(size: 12))
                    .fontWeight(.thin)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
