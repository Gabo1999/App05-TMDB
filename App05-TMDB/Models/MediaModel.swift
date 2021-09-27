//
//  MediaModel.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 27/09/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class MediaModel: ObservableObject {
    
    @Published var genres = [Genre]()
    
    init() {
        loadGenres()
    }
    
    func loadGenres() {
        genres.removeAll()
        
        let URL = "\(tmdbURL)genre/movie/list?api_key=\(apikey)&language=en-US"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

                let json = try! JSON(data: data.data!)
                //print(json)
                var genre: Genre
            
                for j in json["genres"] {
                    genre = Genre(id: j.1["id"].intValue, name: j.1["name"].stringValue)
                    self.genres.append(genre)
                }
        }
    }
}
