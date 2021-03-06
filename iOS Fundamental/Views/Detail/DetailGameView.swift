//
//  DetailGameView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailGameView: View {
    @State var game: Game
    @ObservedObject var viewModel: DetailGameViewModel = DetailGameViewModel()
    var body: some View {
        return ScrollView{
            VStack{
                WebImage(url: URL(string: self.game.backgroundImage))
                    .resizable()
                    .placeholder{
                        Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .animation(.easeOut(duration: 0.5))
                .transition(.fade)
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width,
                       minHeight: (UIScreen.main.bounds.height / 2.5),
                       maxHeight: (UIScreen.main.bounds.height / 2.5))
                
                TitleCardView(title: self.game.name, genre: self.game.genres)
                    .offset(y: -60)
                    .padding(.bottom, -60)
                
                
                BodyCardView(rating: self.game.rating, description: viewModel.description, releasedDate: self.game.released )
                    .onAppear{
                        self.viewModel.getPosts(String(self.game.id))
                }
                
            }
            .onAppear{
                self.viewModel.checkFavorite(String(self.game.id))
                print(self.viewModel.genres.count)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(minHeight: UIScreen.main.bounds.height)
        .navigationBarItems(trailing: Button( action: {
            self.viewModel.addToFavorite(self.game)
        }){
            Image(systemName: self.viewModel.favoriteIcon)
            
        }.simultaneousGesture(LongPressGesture().onEnded({ _ in
            self.viewModel.addToFavorite(self.game)
        }))
        )
    }
}

