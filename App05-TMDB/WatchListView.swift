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
    
    var body: some View {
        List {
            ForEach(lists) { media in
                Text(media.title_wrapped)
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
