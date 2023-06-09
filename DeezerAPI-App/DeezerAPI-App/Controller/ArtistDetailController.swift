//
//  ArtistDetailController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation
import UIKit

let headerdentifier = "header"

typealias MutipleValue = (image: String, id: Int)

class ArtistDetailController: UICollectionViewController {
   
    //MARK: - Properties
        
    let name: String?
    let Image: String?
    
    var dic = [String: MutipleValue]()

    var album: [AlbumDetailResult] {
        didSet { collectionView.reloadData() }
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
        organiseData()
    }
    
    init(name: String?, Image: String?, dic: [String : MutipleValue] = [String: MutipleValue](), album: [AlbumDetailResult]) {
        self.name = name
        self.Image = Image
        self.dic = dic
        self.album = album
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    //MARK: - organise
    
    func organiseData() {
        album.forEach { data in
            if !dic.contains(where: { $0.key == data.album?.title }) {
                guard let albumImage = data.album?.coverBig, let id = data.album?.id else {return}
                dic[data.album?.title ?? ""] = MutipleValue(image: albumImage, id: id)
            }
        }
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
        return dic.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ArtistDetailCell
        var dicToCell = [String: MutipleValue]()
        let titles = Array(dic.keys)[indexPath.row]
        let values = dic[titles]
        guard let values else {return UICollectionViewCell()}
        dicToCell[titles] = MutipleValue(image: values.image, id: values.id)
        cell.viewModel = AlbumsDetailViewModel(dic: dicToCell)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let titles = Array(dic.keys)[indexPath.row]
        let id = dic[titles]?.id
    }
    
    //MARK: - Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerdentifier, for: indexPath) as! ArtistHeader
        header.viewModel = ArtistHeaderViewModel(name: name ?? "", image: Image ?? "")
        return header
    }
}

//MARK: - UICollectionView Delegate FlowLayout  -- where we define size of cell

extension ArtistDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 30
        return CGSize(width: width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 12, bottom: 0, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 360)
    }

    
}
