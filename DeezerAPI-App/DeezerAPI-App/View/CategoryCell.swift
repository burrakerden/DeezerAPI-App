//
//  CategoryCell.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var viewModel: GenreViewModel? {
        didSet { configure() }
    }

    private let genreImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 16
        iv.layer.borderWidth = 0.4
        iv.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        iv.clipsToBounds = true
        return iv
    }()
    
    private let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(genreImageView)
        genreImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(self).inset(24)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configure() {
        guard let viewModel = viewModel else {return}
        backgroundColor = .black
        
        nameLabel.text = viewModel.name
        genreImageView.kf.setImage(with: viewModel.imageUrl)
    }

}
