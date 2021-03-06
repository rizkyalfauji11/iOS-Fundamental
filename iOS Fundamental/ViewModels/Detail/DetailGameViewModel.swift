//
//  DetailGameViewModel.swift
//  iOS Fundamental
//
//  Created by Rizky Alfa Uji Gultom on 17/07/20.
//  Copyright © 2020 Rizky Alfa Uji Gultom. All rights reserved.
//

import Foundation
import Combine
import RxSwift
import RxCocoa
import RealmSwift

let config = Realm.Configuration(schemaVersion: 1)
class DetailGameViewModel: ObservableObject{
    @Published var description = "Plese wait .."
    @Published var favoriteIcon = "star"
    @Published var genres: [Genre] = []
    
    func getPosts(_ id: String){
        guard let url = URL(string: "https://api.rawg.io/api/games/"+id) else {return}
        
        let task = URLSession.shared.dataTask(with:url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let data = data {
                        let result = try JSONDecoder().decode(DetailGame.self, from: data)
                        DispatchQueue.main.async {
                            self.description = result.descriptionRaw
                            self.genres = result.genres
                        }
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
    
    func checkFavorite(_ id: String) {
        do {
            let realm = try Realm(configuration: config)
            let result = realm.objects(datatype.self).filter("id = %@", Int64(id) as Any).first
            DispatchQueue.main.async {
                if result != nil {
                    self.favoriteIcon = "star.fill"
                }else{
                    self.favoriteIcon = "star"
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addToFavorite(_ game: Game){
        do {
            let realm = try Realm(configuration: config)
            let object = realm.objects(datatype.self).filter("id = %@", game.id).first
            try realm.write({
                if object == nil {
                    let newData = datatype()
                    newData.id = game.id
                    newData.name = game.name
                    newData.backgroundImage = game.backgroundImage
                    newData.released = game.released
                    newData.rating = game.rating
                    newData.ratingTop = game.ratingTop ?? 0.0
                    realm.add(newData)
                    checkFavorite(String(game.id))
                }else{
                    guard let object = object else {return}
                    realm.delete(object)
                    checkFavorite(String(game.id))
                }
                
            })
        }catch {
            print(error.localizedDescription)
        }
    }
}
