//
//  ContentView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 15/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: GameViewModel
    var body: some View {
        NavigationView{
            TabView{
                MainListView(games: viewModel.games)
                    .tabItem{
                        Image(systemName: "gamecontroller.fill")
                        Text("List")
                }
                FavoriteListView()
                    .tabItem{
                        Image(systemName: "star.circle")
                        Text("Favorite")
                }
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
                .navigationBarTitle(Text("Game"))
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
            }
                
            .navigationBarTitle("Game List")
            .navigationBarItems(trailing:
                NavigationLink(destination: ProfileView()){
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                }
            )
        }
            
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: .init())
    }
}
