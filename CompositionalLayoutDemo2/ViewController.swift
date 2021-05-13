//
//  ViewController.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private enum Section: Int, CaseIterable {
        case first = 0
        case second = 1
        case third = 2
        case fourth = 3
    }
    
    let provider = ViewControllerProvider()
    
    @IBOutlet weak var myCollectionView: UICollectionView! {
        didSet {
            myCollectionView.collectionViewLayout = createCompositionalLayout
            myCollectionView.register(Header.self, forSupplementaryViewOfKind: ViewController.section1HeaderId, withReuseIdentifier: headerSection1Id)
            myCollectionView.register(UINib(nibName: NewBannerSupplementaryView.identifier, bundle: nil), forSupplementaryViewOfKind: Self.newBannerId, withReuseIdentifier: NewBannerSupplementaryView.identifier)

            
            myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
            myCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
            myCollectionView.register(UINib(nibName: ToolCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ToolCollectionViewCell.identifier)
            myCollectionView.register(UINib(nibName: SeeMoreBannerUICollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SeeMoreBannerUICollectionViewCell.identifier)
            myCollectionView.register(UINib(nibName: HotSellCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HotSellCollectionViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        title = "Compositional Layout Demo"
    }
    
    private lazy var createCompositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let section = Section(rawValue: sectionNumber)
            switch section {
            case .first:
                return self.section0
            case .second:
                return self.section1
            case .third:
                return self.section2
            case .fourth:
                return self.section3
            default:
                preconditionFailure("section not found")
            }
        }
        
        return layout
    }()
    
    private lazy var section0: NSCollectionLayoutSection = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 8
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 1
        section.orthogonalScrollingBehavior = .paging
        return section
    }()
    
    private lazy var section1: NSCollectionLayoutSection = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets.leading = 16
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90)), elementKind: ViewController.section1HeaderId, alignment: .topLeading)
        ]
        return section
    }()
    
    private lazy var section2: NSCollectionLayoutSection = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 8
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(125)), subitems: [item])
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets.leading = 16
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }()
    
    private lazy var section3: NSCollectionLayoutSection = {
        
        // Supplementary Item
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.1), heightDimension: .absolute(40))
        let containerAnchor = NSCollectionLayoutAnchor(edges: [.top], absoluteOffset: CGPoint(x: 0, y: -10))
        let supplementaryItem = NSCollectionLayoutSupplementaryItem(layoutSize: layoutSize, elementKind: Self.newBannerId, containerAnchor: containerAnchor)
        
        // Item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(300)), supplementaryItems: [supplementaryItem])
        item.contentInsets.bottom = 16
        item.contentInsets.trailing = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])
        
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
        return section
    }()
    
    // Elements kind id
    private static let section1HeaderId = "section1HeaderId"
    private static let newBannerId = "new-banner"
    
    private let headerSection1Id = "headerSection1Id"
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = Section(rawValue: section)
        switch section {
        case .first:
            return provider.section1.count
        case .second:
            return provider.tools.count
        case .third:
            return provider.set.image.count
        case .fourth:
            return provider.hotSection.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = Section(rawValue: indexPath.section)
        let cellNotFound = "Could not dequeue for given cell identifier"
        switch section {
        case .first:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else {
                preconditionFailure(cellNotFound)
            }
            let image = provider.section1[indexPath.row]
            cell.set(image: image)
            return cell
        case .second:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolCollectionViewCell.identifier, for: indexPath) as? ToolCollectionViewCell else {
                preconditionFailure(cellNotFound)
            }
            let tool = provider.tools[indexPath.row]
            cell.set(image: tool.image, title: tool.name)
            return cell
        case .third:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeeMoreBannerUICollectionViewCell.identifier, for: indexPath) as? SeeMoreBannerUICollectionViewCell else {
                preconditionFailure(cellNotFound)
            }
            let image = provider.set.image[indexPath.row]
            cell.set(image: image,isExpanded: provider.set.isExpanded)
            cell.delegate = self
            return cell
        case .fourth:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSellCollectionViewCell.identifier, for: indexPath) as? HotSellCollectionViewCell else {
                preconditionFailure(cellNotFound)
            }
            let item = provider.hotSection[indexPath.row]
            cell.set(sell: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case  Self.section1HeaderId:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerSection1Id, for: indexPath) as? Header else {
                return UICollectionReusableView()
            }
            header.set(name: "Outlets")
            return header
        case Self.newBannerId :
            guard let newBanner = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewBannerSupplementaryView.identifier, for: indexPath) as? NewBannerSupplementaryView else {
                return UICollectionReusableView()
            }
            newBanner.isHidden = !(provider.hotSection[indexPath.row].isNew ?? false)
            return newBanner
        default:
            preconditionFailure()
        }
    }
    
    
}


extension ViewController: SeeMoreDelegate {
    func didTapShowMore() {
        print("Reload myCollectionView")
        myCollectionView.reloadData()
    }
}
