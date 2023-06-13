//
//  AlbumDetailCell.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 9.06.2023.
//

import Foundation
import UIKit
import Kingfisher


protocol FeedCellDelegate: AnyObject {
    func cell(didLike song: AlbumDetailViewModel)
}

class AlbumDetailCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    weak var delegate: FeedCellDelegate?
    
    var viewModel: AlbumDetailViewModel? {
        didSet { configure() }
    }

    private let albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.8
        iv.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        return iv
    }()
    
    private let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let durationLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = true
        button.tintColor = .red
        button.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(albumImageView)
        albumImageView.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.top.bottom.equalTo(self)
            make.width.equalTo(frame.height)
        }
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, durationLabel])
        stack.distribution = .fillEqually
        stack.spacing = 6
        stack.axis = .vertical
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(albumImageView.snp.trailing).offset(16)
            make.trailing.equalTo(self).inset(40)
        }
        
        addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerY.equalTo(self)
            make.trailing.equalTo(self).inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc func didTapLike() {
//        viewModel?.boolTest.toggle()
        guard let viewModel else {return}
        delegate?.cell(didLike: viewModel)
        
    }


    
    //MARK: - Helpers
    
    func configure() {
        guard let viewModel else {return}
        backgroundColor = .white.withAlphaComponent(0.05)
        layer.cornerRadius = 6
        likeButton.setImage(UIImage(systemName: viewModel.buttonImage), for: .normal)
        
        nameLabel.text = viewModel.songName
        albumImageView.kf.setImage(with: URL(string: viewModel.image ?? ""))
        durationLabel.text = viewModel.duration.timeString()
        
    }

}
