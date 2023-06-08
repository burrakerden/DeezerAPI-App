//
//  ArtistsCell.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import UIKit
import SnapKit
import Kingfisher

class ArtistsCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var viewModel: ArtistsViewModel? {
        didSet { configure() }
    }

    private let artistsImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 44
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.8
        iv.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        return iv
    }()
    
    private let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(artistsImageView)
        artistsImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(self).inset(24)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).inset(4)
            make.leading.trailing.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions

    
    //MARK: - Helpers
    
    func configure() {
        backgroundColor = .black
        nameLabel.text = viewModel?.name
        artistsImageView.kf.setImage(with: viewModel?.imageUrl)
    }

}
