//
//  App05_TMDBApp.swift
//  App05-TMDB
//
//  Created by David Josue Marcial Quero on 27/09/21.
//

import SwiftUI

@main
struct App05_TMDBApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TMDBView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
