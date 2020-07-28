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
    @Published var games: [Game]? = nil
    
    func getFavorites() {
        let config = Realm.Configuration(schemaVersion: 1)
        do{
            let realm = try Realm(configuration: config)
            let result = realm.objects(datatype.self)
            print(result)
        }catch {
            print(error.localizedDescription)
        }
    }
}
