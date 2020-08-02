//
//  DetailGame.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 17/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation

struct DetailGame: Decodable, Hashable, Identifiable{
    var id: Int64
    var descriptionRaw: String
    var genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id
        case descriptionRaw = "description_raw"
        case genres
    }
}
