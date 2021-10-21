//
//  RemoveFromWatchList.swift
//  App05-TMDB
//
//  Created by Alumno on 21/10/21.
//

import SwiftUI

struct RemoveFromWatchList: View {
    @Environment(\.managedObjectContext) var viewContext
    
    var media: WatchList
    
    var body: some View {
        VStack {
            Button {
                DeleteMediaFromWatchList()
            } label: {
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    func DeleteMediaFromWatchList() {
        viewContext.delete(media)
        try? viewContext.save()
    }
}

struct RemoveFromWatchList_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFromWatchList(media: WatchList())
    }
}
