//
//  MoviesView.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MoviesView: View {
    @ObservedObject var mediaModel = MediaModel()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mediaModel.moviesNowPlaying) { movie in
                        NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: movie)) {
                            MediaRowView(media: movie, width: geo.size.width)
                        }
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
