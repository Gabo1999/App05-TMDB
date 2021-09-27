//
//  MediaRowView.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MediaRowView: View {
    var media: Media
    
    var body: some View {
        VStack {
            KFImage(URL(string: "\(imageURL)\(media.poster)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
            Text(media.title)
            //HStack {
            //    ForEach(movie.genres, id:\.self) { g in
            //        Text(g)
              //  }
            //}
        }
    }
}

struct MediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRowView(media: Media.dummy)
    }
}
