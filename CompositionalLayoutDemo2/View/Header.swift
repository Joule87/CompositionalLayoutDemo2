//
//  Header.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/21/21.
//

import UIKit

class Header: UICollectionReusableView {
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Optima-BoldItalic", size: 24)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    func set(name: String?) {
        label.text = name
    }
}
