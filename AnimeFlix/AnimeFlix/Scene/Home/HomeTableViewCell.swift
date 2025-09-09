//
//  HomeTableViewCell.swift
//  AnimeFlix
//
//  Created by Rodrigo on 05/08/25.
//

import Foundation
import UIKit
import SDWebImage
import SnapKit

final class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    private let animeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(animeImageView)
        
        animeImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.width.equalTo(80)
            make.height.equalTo(100).priority(.high)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(animeImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with anime: Anime) {
        titleLabel.text = anime.title
        if let url = URL(string: anime.images.jpg.image_url) {
            animeImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo"))
        }
    }
}

