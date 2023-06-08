//
//  ArtistsController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import UIKit



class ArtistsController: UICollectionViewController {
   
    //MARK: - Properties
    
    var categoryName: String?
    
    var artists: [ArtistsResult] {
        didSet { collectionView.reloadData() }
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
    }

    init(categoryName: String? = nil, artists: [ArtistsResult]) {
        self.categoryName = categoryName
        self.artists = artists
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Fetch Data
    
    
    
    //MARK: - Actions
    
    
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.register(ArtistsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .black
    }
    
    func configureNavigation()  {
        self.navigationItem.title = categoryName
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]

    }
}

//MARK: - UICollectionView DataSource

extension ArtistsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artists.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ArtistsCell
        let result = artists[indexPath.row]
        cell.viewModel = ArtistsViewModel(result: result)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = artists[indexPath.row].id else {return}
        AlbumService().getAlbum(id: id) { albumDetail in
            guard let data = albumDetail?.data else {return}
            let vc = ArtistDetailController(artistName: self.artists[indexPath.row].name, album: data)
            self.navigationController?.pushViewController(vc, animated: true)
        } onError: { err in
            print(err.localizedDescription)
        }



    }
    
}

//MARK: - UICollectionView Delegate FlowLayout  -- where we define size of cell

extension ArtistsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 3) - 30
        return CGSize(width: width, height: width + 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
    }

    
}
