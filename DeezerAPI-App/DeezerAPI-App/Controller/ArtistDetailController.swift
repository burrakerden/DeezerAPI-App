//
//  ArtistDetailController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation
import UIKit

let headerdentifier = "header"

class ArtistDetailController: UICollectionViewController {
    
    //MARK: - Properties
    
    let name: String?
    let Image: String?
    
    var albums: [AlbumsDetailResult] {
        didSet { collectionView.reloadData() }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
    }
    
    init(name: String?, Image: String?, albums: [AlbumsDetailResult]) {
        self.name = name
        self.Image = Image
        self.albums = albums
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.register(ArtistDetailCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(ArtistHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerdentifier)
        collectionView.backgroundColor = .black
    }
    
    func configureNavigation()  {
        self.navigationItem.title = name
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
}

//MARK: - UICollectionView DataSource

extension ArtistDetailController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ArtistDetailCell
        cell.viewModel = AlbumsDetailViewModel(result: albums[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = albums[indexPath.row].id else {return}
        showLoader(true)
        AlbumService().getAlbum(id: id) { albumData in
            guard let data = albumData?.tracks?.data else {return}
            let vc = AlbumDetailController(albumName: self.albums[indexPath.row].title, albumImage: self.albums[indexPath.row].coverBig, album: data)
            self.showLoader(false)
            self.navigationController?.pushViewController(vc, animated: true)
        } onError: { err in
            print(err.localizedDescription)
        }
        
        
    }
    
    //MARK: - Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerdentifier, for: indexPath) as! ArtistHeader
        header.viewModel = ArtistHeaderViewModel(name: name ?? "", image: Image ?? "")
        return header
    }
}

    //MARK: - UICollectionView Delegate FlowLayout
extension ArtistDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 12
        return CGSize(width: width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 6, bottom: 0, right: 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 360)
    }
    
    
}
