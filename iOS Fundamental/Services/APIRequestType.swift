//
//  APIRequestType.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 16/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation
import Combine

protocol APIRequestType{
    associatedtype Response: Decodable
    
    var getListPath: String {get}
    var queryItems: [URLQueryItem]? {get}
    func getDetail(id: String)->String
}

protocol APIServiceType{
    func getGames<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
    func getDetailGame<Request>(from request: Request, id: String) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    func getDetailGame<Request>(from request: Request, id: String) -> AnyPublisher<Request.Response, APIServiceError> where Request : APIRequestType {
        let pathURL = URL(string: request.getDetail(id: id), relativeTo: baseURL)!
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        let request = URLRequest(url: urlComponents.url!)
        
        let jsonDecoder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data  }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: jsonDecoder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .print("Detail")
            .eraseToAnyPublisher()
    }
    
    
    private let baseURL: URL
    init(baseURL: URL = URL(string: "https://api.rawg.io")!) {
        self.baseURL = baseURL
    }
    
    func getGames<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
        
        let pathURL = URL(string: request.getListPath, relativeTo: baseURL)!
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        let request = URLRequest(url: urlComponents.url!)
        
        let jsonDecoder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data  }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: jsonDecoder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .print("List")
            .eraseToAnyPublisher()
    }
}
