//
//  NewBannerSupplementaryView.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 5/3/21.
//

import UIKit

class NewBannerSupplementaryView: UICollectionReusableView {
    static let identifier = "NewBannerSupplementaryView"
    
    @IBOutlet weak var title: UILabel! {
        didSet {
            title.text = "NEW"
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1

        //Animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 0.5
        scaleAnimation.repeatCount = Float.infinity
        scaleAnimation.autoreverses = true
        scaleAnimation.fromValue = 1.00;
        scaleAnimation.toValue = 0.95;
        layer.add(scaleAnimation, forKey: "scale")
    }
    
}
