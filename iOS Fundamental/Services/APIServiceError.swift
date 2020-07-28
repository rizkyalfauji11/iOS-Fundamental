//
//  APIServiceError.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation

enum APIServiceError: Error{
    case responseError
    case parseError(Error)
}
