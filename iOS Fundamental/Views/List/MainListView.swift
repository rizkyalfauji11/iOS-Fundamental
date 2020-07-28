//
//  MainListView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 27/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI

struct MainListView: View {
    var games: [Game]
    var body: some View {
        List(games){ result in
            ZStack{
                GameRow(game: result)
                NavigationLink(destination: DetailGameView(game: result)) {
                    EmptyView()
                }
            }
        }
    }
}
