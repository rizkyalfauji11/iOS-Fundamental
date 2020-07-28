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
    
    func getPosts(_ id: String){
        guard let url = URL(string: "https://api.rawg.io/api/games/"+id) else {return}

        URLSession.shared.dataTask(with: url){ (data, response, error) in
            do{
                if let error = error {
                    print(error.localizedDescription)
                }
                if let data = data {

                    let result = try JSONDecoder().decode(DetailGame.self, from: data)
                    DispatchQueue.main.async {
                        self.description = result.descriptionRaw
                    }
                }

            }catch{
                print(error.localizedDescription)
            }
        }.resume()
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
            print("Called")
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
                    print("Data Added")
                    checkFavorite(String(game.id))
                }else{
                    guard let object = object else {return}
                    realm.delete(object)
                    print("Data Deleted")
                    checkFavorite(String(game.id))
                }
            
            })
        }catch {
            print(error.localizedDescription)
        }
    }
}
