//
//  SeeMoreBannerUICollectionViewCell.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/28/21.
//

import UIKit

protocol SeeMoreDelegate: NSObject {
    func didTapShowMore()
}

class SeeMoreBannerUICollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SeeMoreBannerUICollectionViewCell"

    @IBOutlet weak var seeMoreButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    
    weak var delegate: SeeMoreDelegate?
    private var isExpanded: Bool = false {
        didSet {
            containerViewHeightConstraint.constant = isExpanded ? 300 : 125
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.backgroundColor = .clear
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
        
        clipsToBounds = false
        
    }

    @IBAction func didTapSeeMoreButton(_ sender: UIButton) {
        delegate?.didTapShowMore()
    }
    
    func set(image: UIImage, isExpanded: Bool?){
        imageView.image = image
        self.isExpanded = isExpanded ?? false
    }
    
}
