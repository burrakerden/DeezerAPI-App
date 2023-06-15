//
//  AlbumDetailController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 9.06.2023.
//

import Foundation
import UIKit
import AVFoundation


class AlbumDetailController: UICollectionViewController {
    
    //MARK: - Properties
    
    let albumName: String?
    var albumImage: String?

    var songNamesArr = [String]()
    
    var player: AVPlayer!
    var test = true
    
    var currentIndexPath: IndexPath?
    var previousIndexPath: IndexPath?
    
    var album: [TracksResult] {
        didSet { collectionView.reloadData() }
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchSongs()
    }
    
    init(albumName: String?, albumImage: String?, album: [TracksResult]) {
        self.albumName = albumName
        self.albumImage = albumImage
        self.album = album
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Fetch core data
    
    func fetchSongs() {
        CoreDataService.fetchCoreData(collectionView: collectionView) { songData in
            songData?.forEach { songNames in
                guard let song = songNames.songName else {return}
                self.songNamesArr.append(song)
            }
        }
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.register(AlbumDetailCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .black
    }
    
    func configureNavigation()  {
        self.navigationItem.title = albumName
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    
    func playSong(indexPath: IndexPath, items: [TracksResult]) {
        
        if let currentIndexPath = currentIndexPath {
            previousIndexPath = currentIndexPath
        }
        currentIndexPath = indexPath
        
        guard let url = items[indexPath.row].preview else {return}
        player = AVPlayer(playerItem: AVPlayerItem(url: URL(string: url) ?? URL(fileURLWithPath: "")))
        
        let currentCell = collectionView.cellForItem(at: indexPath) as? AlbumDetailCell
        
        if test {
            currentCell?.showSpeaker()
            player.play()
        } else {
            if currentIndexPath != previousIndexPath {
                let previousCell = collectionView.cellForItem(at: previousIndexPath!) as? AlbumDetailCell
                previousCell?.hideSpeaker()
            }
            currentCell?.hideSpeaker()
            player.pause()
        }
        test.toggle()
    }
}

    //MARK: - UICollectionView DataSource

extension AlbumDetailController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playSong(indexPath: indexPath, items: album)

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AlbumDetailCell
        cell.viewModel = AlbumDetailViewModel(tracksResult: album[indexPath.row], songNames: self.songNamesArr, image: self.albumImage)
        cell.delegate = self
        return cell
    }
    
}

    //MARK: - UICollectionView Delegate FlowLayout

extension AlbumDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 12
        return CGSize(width: width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 6, bottom: 0, right: 6)
    }
}

extension AlbumDetailController: FeedCellDelegate {
    func cell(didLike song: AlbumDetailViewModel) {
        
        if !song.boolTest {
            CoreDataService.addCoreData(songName: song.songName, songImage: song.image ?? "", songDuration: song.duration, songPreview: song.preview)
            fetchSongs()
        } else {
            
        }
    }
}
