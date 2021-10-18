//
//  WatchList+CoreDataProperties.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 18/10/21.
//
//

import Foundation
import CoreData


extension WatchList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchList> {
        return NSFetchRequest<WatchList>(entityName: "WatchList")
    }

    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var poster: String?
    @NSManaged public var rate: Double
    @NSManaged public var genres: [String]
    @NSManaged public var releaseDate: String?
    
    var title_wrapped: String {
        title ?? ""
    }
    
    var overview_wrapped: String {
        overview ?? ""
    }
    
    var poster_wrapped: String {
        poster ?? ""
    }
    
    var releaseDate_wrapped: String {
        releaseDate ?? ""
    }

}

extension WatchList : Identifiable {

}
