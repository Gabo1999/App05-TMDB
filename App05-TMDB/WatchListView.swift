//
//  WatchListView.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 18/10/21.
//

import SwiftUI

struct WatchListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: WatchList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WatchList.releaseDate, ascending: true)],
        animation: .default)
    private var lists: FetchedResults<WatchList>
    
    @ObservedObject var mediaModel: MediaModel
    
    @State var offsetY: CGFloat = 0
    
    let detectDirectionalDrags = DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
    .onEnded { value in
        print(value.translation)
        
        if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30 {
            print("left swipe")
        }
        else if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30 {
            print("right swipe")
        }
        else if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
            print("up swipe")
        }
        else if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
            print("down swipe")
        }
        else {
            print("no clue")
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(lists) { media in
                        NavigationLink(destination: WatchListDetailView(mediaModel: mediaModel, media: media)) {
                            WatchListRowView(media: media, width: geo.size.width)
                                .gesture(detectDirectionalDrags)
                        }
                    }
                }
            }
            .navigationBarTitle("Watch List", displayMode: .inline)
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView(mediaModel: MediaModel())
    }
}
