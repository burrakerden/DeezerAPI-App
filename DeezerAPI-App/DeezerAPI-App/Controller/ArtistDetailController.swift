//
//  ArtistDetailController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation
import UIKit

class ArtistDetailController: UICollectionViewController {
   
    //MARK: - Properties
    
    var artistName: String?
    
    var album: [AlbumDetailResult] {
        didSet { collectionView.reloadData() }
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
    }

    init(artistName: String? = nil, album: [AlbumDetailResult]) {
        self.artistName = artistName
        self.album = album
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Fetch Data
    
    
    
    //MARK: - Actions
    
    
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.register(ArtistDetailCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .black
    }
    
    func configureNavigation()  {
        self.navigationItem.title = artistName
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]

    }
}

//MARK: - UICollectionView DataSource

extension ArtistDetailController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(album.count)
        return album.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ArtistDetailCell
        guard let result = album[indexPath.row].album else {return UICollectionViewCell()}
        print(result)
        cell.viewModel = AlbumDetailViewModel(result: result)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

//MARK: - UICollectionView Delegate FlowLayout  -- where we define size of cell

extension ArtistDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 3) - 30
        return CGSize(width: width, height: width + 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
    }

    
}
