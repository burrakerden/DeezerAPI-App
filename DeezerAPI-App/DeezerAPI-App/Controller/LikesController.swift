//
//  LikesController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation
import UIKit
import AVFoundation

class LikesController: UICollectionViewController {
    
    //MARK: - Properties
    
    var items = [SongData]()
    
    var player: AVPlayer!
    
    var test = true

    var currentIndexPath: IndexPath?
    var previousIndexPath: IndexPath?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchSongs()
    }
    
    // MARK: - FETCH DATA
    
    func fetchSongs() {
        CoreDataService.fetchCoreData(collectionView: collectionView) { songData in
            guard let songData else {return}
            self.items = songData
        }
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.register(LikesCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .black
    }
    
    func configureNavigation()  {
        self.navigationItem.title = "Likes"
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    
    func playSong(indexPath: IndexPath, items: [SongData]) {
        
        if let currentIndexPath = currentIndexPath {
            previousIndexPath = currentIndexPath
        }
        currentIndexPath = indexPath
        
        guard let url = items[indexPath.row].songPreview else {return}
        player = AVPlayer(playerItem: AVPlayerItem(url: URL(string: url) ?? URL(fileURLWithPath: "")))
        
        let currentCell = collectionView.cellForItem(at: indexPath) as? LikesCell
        
        if test {
            currentCell?.showSpeaker()
            player.play()
        } else {
            if currentIndexPath != previousIndexPath {
                let previousCell = collectionView.cellForItem(at: previousIndexPath!) as? LikesCell
                previousCell?.hideSpeaker()
            }
            currentCell?.hideSpeaker()
            player.pause()
        }
        test.toggle()
    }
}

//MARK: - UICollectionView DataSource

extension LikesController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playSong(indexPath: indexPath, items: items)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! LikesCell
        cell.delegate = self
        cell.index = indexPath
        let item = items[indexPath.row]
        cell.viewModel = LikesViewModel(isLiked: item.isLiked, songDuration: item.songDuration, songImage: item.songImage ?? "", songName: item.songName ?? "", songPreview: item.songPreview ?? "")
        
        return cell
    }
}

//MARK: - UICollectionView Delegate FlowLayout

extension LikesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 12
        return CGSize(width: width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 6, bottom: 0, right: 6)
    }
    
}

//MARK: - LikeCellDelegate

extension LikesController: LikeCellDelegate {
    func cell(indexPath: Int) {
        CoreDataService.deleteCoreData(indexPath: indexPath, items: self.items)
        self.fetchSongs()
    }
}
