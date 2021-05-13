//
//  HotSellCollectionViewCell.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/24/21.
//

import UIKit

struct HotSell {
    let image: UIImage?
    let name: String?
    let price: String?
    let isNew: Bool?
}

class HotSellCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HotSellCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet {
            descriptionLabel.text = "Tool"
        }
    }
    @IBOutlet weak var statusLabel: UILabel! {
        didSet {
            statusLabel.text = "Hot"
        }
    }
    @IBOutlet weak var priceLabel: UILabel!{
        didSet {
            priceLabel.text = "$ XX.xx"
        }
    }
    
    private var sell: HotSell? {
        didSet {
            imageView.image = sell?.image
            priceLabel.text = sell?.price
            descriptionLabel.text = sell?.name
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
    
    func set(sell: HotSell){
        self.sell = sell
    }
    
}
