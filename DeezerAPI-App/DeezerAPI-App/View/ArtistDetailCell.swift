//
//  ArtistDetailCell.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import UIKit
import SnapKit
import Kingfisher

class ArtistDetailCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var viewModel: AlbumsDetailViewModel? {
        didSet { configure() }
    }

    private let albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.8
        iv.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        return iv
    }()
    
    private let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(albumImageView)
        albumImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(self)
            make.trailing.equalTo(self).inset(280)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(albumImageView.snp.trailing).offset(20)
            make.trailing.equalTo(self).inset(4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions

    
    //MARK: - Helpers
    
    func configure() {
        backgroundColor = .black
        nameLabel.text = viewModel?.albumName
        albumImageView.kf.setImage(with: URL(string: viewModel?.imageUrl ?? ""))
    }

}
