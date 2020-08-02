//
//  RemoteRepository.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation

struct RemoteRepository<type: Decodable>: APIRequestType {
    typealias Response = type
    
    var getListPath: String {return "api/games"}
    var queryItems: [URLQueryItem]?{
        return [
            .init(name: "page_size", value: "15")
        ]
    }
}
