//
//  ContentView.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 27/09/21.
//

import SwiftUI

struct TMDBView: View {
    
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        NavigationView {
            TabView {
                MoviesView(mediaModel: MediaModel())
                    .tabItem {
                        Label("Movies", systemImage: "film.fill")
                    }
                SeriesView(mediaModel: mediaModel)
                    .tabItem {
                        Label("Series", systemImage: "tv.fill")
                    }
                WatchListView(mediaModel: mediaModel)
                    .tabItem {
                        Label("Watch List", systemImage: "list.star")
                    }
            }
            .navigationBarTitle("TMDB", displayMode: .inline)
            
        }
    }
}

struct TMDBView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}
