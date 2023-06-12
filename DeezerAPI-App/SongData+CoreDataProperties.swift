//
//  SongData+CoreDataProperties.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 12.06.2023.
//
//

import Foundation
import CoreData


extension SongData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SongData> {
        return NSFetchRequest<SongData>(entityName: "SongData")
    }

    @NSManaged public var isLiked: Bool
    @NSManaged public var songDuration: Int64
    @NSManaged public var songImage: String?
    @NSManaged public var songName: String?
    @NSManaged public var songPreview: String?

}

extension SongData : Identifiable {

}
