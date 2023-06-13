//
//  CoreDataService.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 12.06.2023.
//

import Foundation


import UIKit

final class CoreDataService {
    
    static func fetchCoreData(collectionView: UICollectionView?, onSuccess: @escaping ([SongData]?) -> Void) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let items = try context.fetch(SongData.fetchRequest())
            onSuccess(items)
            DispatchQueue.main.async {
                collectionView?.reloadData()
            }
        } catch {
            print("error-fetchPeople")
        }
        collectionView?.reloadData()
    }
    
    static func deleteCoreData(indexPath: Int, items: [SongData]){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let songToRemove = items[indexPath]
        
        context.delete(songToRemove)
        
        do {
            try context.save()
        } catch {
            print("error-Deleting data")
        }
        
    }
    
    static func addCoreData(songName: String, songImage: String, songDuration: Int, songPreview: String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newSong = SongData(context: context)
        
        newSong.songName = songName
        newSong.songImage = songImage
        newSong.songDuration = Int64(songDuration)
        newSong.songPreview = songPreview
        
        do {
            try context.save()
        } catch {
            print("error-Save data")
        }
        
    }
}
