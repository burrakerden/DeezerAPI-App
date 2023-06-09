//
//  ArtistHeader.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 8.06.2023.
//

import Foundation
import UIKit
import SnapKit

class ArtistHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    var viewModel: ArtistHeaderViewModel? {
        didSet { configure() }
    }
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let textBackground: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray.withAlphaComponent(0.4)
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "BradleyHandITCTT-Bold", size: 20)
        return label
    }()
    
    //MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self)
        }
        
        addSubview(textBackground)
        textBackground.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self).inset(14)
            make.height.equalTo(28)
        }

        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(16)
            make.trailing.equalTo(self).inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions


    //MARK: - Helpers
    
    func configure() {
        guard let viewModel = viewModel else {return}
        nameLabel.text = viewModel.name
        profileImageView.kf.setImage(with: URL(string: viewModel.image))


    }
    
}

