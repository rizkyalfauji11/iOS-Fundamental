//
//  Game.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 15/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

struct Game: Decodable, Hashable, Identifiable{
    var id: Int64
    var name: String
    var released: String
    var backgroundImage: String
    var rating: Double
    var ratingTop: Double?
    var genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case genres
    }
}

struct Genre: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let backgroundImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "image_background"
    }
}

class datatype : Object{
    @objc dynamic var id: Int64 = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var ratingTop: Double = 0.0
    
    
    override class func primaryKey() -> String? {
        "id"
    }
}
