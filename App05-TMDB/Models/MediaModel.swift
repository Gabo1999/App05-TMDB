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
    @Published var moviesNowPlaying = [Media]()
    @Published var seriesNowPlaying = [Media]()
    
    init() {
        loadGenres()
        loadMoviesNowPlaying()
        loadSeriesNowPlaying()
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
    
    func loadMoviesNowPlaying() {
        
        let URL = "\(tmdbURL)movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

                let json = try! JSON(data: data.data!)
                //print(json)
                var movie: Media
            
                for m in json["results"] {
                    var genresIds = [String]()
                    for i in m.1["genre_ids"] {
                        if let index = self.genres.firstIndex(where: {$0.id == i.1.intValue}) {
                            genresIds.append(self.genres[index].name)
                        }
                    }
                    movie = Media(id: m.1["id"].intValue,
                                  title: m.1["title"].stringValue,
                                  overview: m.1["overview"].stringValue,
                                  poster: m.1["poster_path"].stringValue,
                                  rating: m.1["vote_average"].doubleValue,
                                  genres: genresIds,
                                  releaseDate: m.1["release_date"].stringValue)
                    self.moviesNowPlaying.append(movie)
                }
        }
    }
    
    func loadSeriesNowPlaying() {
        
    }
}
