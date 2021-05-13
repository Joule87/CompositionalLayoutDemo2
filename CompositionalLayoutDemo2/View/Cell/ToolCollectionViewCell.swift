//
//  ToolCollectionViewCell.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/23/21.
//

import UIKit

class ToolCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ToolCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textAlignment = .center
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8

        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
        clipsToBounds = false
    }
    
    func set(image: UIImage?, title: String?){
        imageView.image = image
        titleLabel.text = title
    }
    
}
