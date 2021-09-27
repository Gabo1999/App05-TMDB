//
//  TMDBLogin.swift
//  App05-TMDB
//
//  Created by David Josue Marcial Quero on 27/09/21.
//

import Foundation

let apikey = "d156b45f6597bba6b7eca1e0f7100b7a"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMTU2YjQ1ZjY1OTdiYmE2YjdlY2ExZTBmNzEwMGI3YSIsInN1YiI6IjYxNTFkNzA0ZThhM2UxMDA0M2ZlNzk4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.W7KoaJlQ1l65Qm6ATDnY_4aZyKBveqDbnrjM-VAX5Rw"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]

let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original/"
