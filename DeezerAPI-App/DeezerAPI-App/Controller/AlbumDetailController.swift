//
//  AlbumDetailController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 9.06.2023.
//

import Foundation
import UIKit



class AlbumDetailController: UICollectionViewController {

    //MARK: - Properties

    let albumName: String?
    var albumImage: String?


    var album: [TracksResult] {
        didSet { collectionView.reloadData() }
    }


    //MARK: - Life Cycle

    override func viewDidLoad() {
        configureUI()
        configureNavigation()
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
}

//MARK: - UICollectionView DataSource

extension AlbumDetailController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AlbumDetailCell
        cell.viewModel = AlbumDetailViewModel(tracksResult: album[indexPath.row], image: self.albumImage)
        return cell
    }

}

//MARK: - UICollectionView Delegate FlowLayout  -- where we define size of cell

extension AlbumDetailController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 12
        return CGSize(width: width, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 6, bottom: 0, right: 6)
    }
}

extension AlbumDetailController {
//    func cell(_ cell: FeedCell, didLike post: Post) {
//        cell.viewModel?.post.didLike.toggle()
//        guard let tab = self.tabBarController as? MainTabController else {return}
//        guard let user = tab.user else {return}
//
//        if post.didLike {
//            PostService.unlikePost(post: post) { _ in
//                cell.likeButton.setImage(UIImage(named: "like_unselected"), for: .normal)
//                cell.likeButton.tintColor = .black
//                cell.viewModel?.post.likes = post.likes - 1
//            }
//        } else {
//            PostService.likePost(post: post) { _ in
//                cell.likeButton.setImage(UIImage(named: "like_selected"), for: .normal)
//                cell.likeButton.tintColor = .systemRed
//                cell.viewModel?.post.likes = post.likes + 1
//                NotificationService.uploadNotification(toUid: post.ownerUid, type: .like, forUser: user, post: post)
//            }
//        }
    }
