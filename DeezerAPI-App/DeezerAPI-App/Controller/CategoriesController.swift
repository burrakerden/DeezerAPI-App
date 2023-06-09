//
//  CategoriesController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import UIKit

var cellIdentifier = "cell"

class CategoriesController: UICollectionViewController {
    
    //MARK: - Properties
    
    var result: [GenreResult]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configureUI()
        configureNavigation()
        fetchGenre()
    }
    
    //MARK: - Fetch Data
    
    func fetchGenre() {
        GenreService().getGenre { data in
            guard let data else {return}
            self.result = data.data
        } onError: { err in
            print(err.localizedDescription)
        }
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .black
    }
    
    func configureNavigation()  {
        self.navigationItem.title = "Categories"
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .white
    }
}

//MARK: - UICollectionView DataSource

extension CategoriesController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategoryCell
        guard let result = result?[indexPath.row] else {return cell}
        cell.viewModel = GenreViewModel(result: result)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = result?[indexPath.row].id else {return}
        showLoader(true)
        ArtistsService().getArtists(id: id) { artistsData in
            guard let data = artistsData?.data else {return}
            let vc = ArtistsController(categoryName: self.result?[indexPath.row].name, artists: data)
            self.showLoader(false)
            self.navigationController?.pushViewController(vc, animated: true)
        } onError: { err in
            print(err.localizedDescription)
        }


        
    }
    
}

//MARK: - UICollectionView Delegate FlowLayout  -- where we define size of cell

extension CategoriesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 24
        return CGSize(width: width, height: width + 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
    }

    
}
