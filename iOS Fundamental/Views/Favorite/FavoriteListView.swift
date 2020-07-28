//
//  FavoriteListView.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 27/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import SwiftUI

struct FavoriteListView: View {
    @ObservedObject var viewModel = FavoriteViewModel()
    var body: some View {
        viewModel.getFavorites()
        return Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
