//
//  AddToWatchList.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 18/10/21.
//

import SwiftUI

struct AddToWatchList: View {
    
    @Environment(\.managedObjectContext) var viewContext
    var fetchRequest: FetchRequest<WatchList>
    var lists: FetchedResults<WatchList> {
        fetchRequest.wrappedValue
    }
    
    var media: Media
    
    var body: some View {
        VStack {
            Button {
                if lists.count > 0 {
                    DeleteMediaFromWatchList()
                } else {
                    AddMediaToWatchList()
                }
            } label: {
                Image(systemName: lists.count > 0 ? "star.fill" : "star")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    init(filter: Media) {
        media = filter
        fetchRequest = FetchRequest<WatchList>(entity: WatchList.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", NSNumber(value: filter.id)))
    }
    
    func AddMediaToWatchList() {
        let m = WatchList(context: viewContext)
        m.id = Int32(media.id)
        m.title = media.title
        m.overview = media.overview
        m.releaseDate = media.releaseDate
        m.rate = media.rating
        m.poster = media.poster
        var arrGenre = [String]()
        for g in media.genres {
            arrGenre.append(g)
        }
        m.genres = arrGenre
        try? viewContext.save()
    }
    
    func DeleteMediaFromWatchList() {
        if let index = lists.firstIndex(where: {$0.id == media.id}) {
            viewContext.delete(lists[index])
            try? viewContext.save()
        }
    }
}

struct AddToWatchList_Previews: PreviewProvider {
    static var previews: some View {
        AddToWatchList(filter: Media.dummy)
    }
}
