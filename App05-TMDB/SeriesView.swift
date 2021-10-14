//
//  SeriesView.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 27/09/21.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mediaModel.seriesNowPlaying) { serie in
                        NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: serie)) {
                            MediaRowView(media: serie, width: geo.size.width)
                        }
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView()
    }
}
