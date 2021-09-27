//
//  ContentView.swift
//  App05-TMDB
//
//  Created by David Josue Marcial Quero on 27/09/21.
//

import SwiftUI

struct TMDBView: View {
    
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mediaModel.genres) {genre in
                    Text(genre.name)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Géneros", displayMode: .inline)
            
        }
    }
}

struct TMDBView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}
