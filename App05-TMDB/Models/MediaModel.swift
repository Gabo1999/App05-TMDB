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
    
    func loadMoviesPosters(id: Int, handler: @escaping(_ returnedImages: [String]) ->()) {
        
        let URL = "\(tmdbURL)movie/\(id)/images?api_key=\(apikey)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            //print(json)
            var images = [String]()
        
            for image in json["posters"] {
                if image.1["width"].intValue == 2000 && image.1["iso_639_1"].stringValue == "en" {
                    images.append(image.1["file_path"].stringValue)
                }
            }
            handler(images)
        }
    }
    
    func loadMoviesTrailers(id: Int, handler: @escaping(_ returnedTrailers: [Trailer]) ->()) {
        
        let URL = "\(tmdbURL)movie/\(id)/videos?api_key=\(apikey)&language=en-US"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            //print(json)
            var trailers = [Trailer]()
            var trailer: Trailer
        
            for t in json["results"] {
                trailer = Trailer(id: t.1["id"].stringValue, name: t.1["name"].stringValue, key: t.1["key"].stringValue, type: t.1["type"].stringValue)
                trailers.append(trailer)
            }
            trailers.sort {$0.type > $1.type}
            handler(trailers)
        }
    }
}
