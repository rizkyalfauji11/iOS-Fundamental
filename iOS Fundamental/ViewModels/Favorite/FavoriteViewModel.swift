//
//  FavoriteViewModel.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 27/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation
import RealmSwift

class FavoriteViewModel: ObservableObject {
    @Published var games: [Game] = []
    init() {
        getFavorites()
    }
    func getFavorites() {
        do{
            games = []
            let realm = try Realm(configuration: config)
            let result = realm.objects(datatype.self)
            for data in result {
                self.games.append(
                    Game(
                        id: data.id, name: data.name, released: data.released, backgroundImage: data.backgroundImage, rating: data.rating, ratingTop: data.ratingTop, genres: []
                    )
                )
            }
            
        }catch {
            print(error.localizedDescription)
        }
    }
}
