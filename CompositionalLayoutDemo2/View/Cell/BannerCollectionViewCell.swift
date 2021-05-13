//
//  BannerCollectionViewCell.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/23/21.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContentView()
        setShadows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        
    }
    
    func set(image: UIImage) {
        imageView.image = image
    }
    
    private func setShadows() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
    }
    
    private func setContentView() {
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
    }
}
