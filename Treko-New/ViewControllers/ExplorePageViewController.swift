//
//  ExplorePageViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 22/03/23.
//

import UIKit

class ExplorePageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrData = ["profile","profile","profile","profile","profile","profile","profile","profile","profile","profile","profile","profile","profile","profile","profile","profile"]
    var arrData1 = ["mountain1","mountain1","mountain1","mountain1","mountain1","mountain1","mountain1","mountain1","mountain1","mountain1","mountain1"]

    var data:[Int:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [1:arrData1,2:arrData,3:arrData
                ,4:arrData,5:arrData,6:arrData,
                7:arrData]
        
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
//
    func createLayout()->UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
//            print(sectionIndex)
            switch(sectionIndex){
            case 0:
                return self.createStandardSection()
            default:
                return self.createPromotedSection()
            }
//            return self.createPromotedSection()

        }
        return layout
    }
    
    func createPromotedSection()->NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension:
                       .fractionalWidth(1),
                       heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4,
           bottom: 0, trailing: 4)
        let groupSize =
                       NSCollectionLayoutSize(widthDimension:
                       .absolute(200),
                       heightDimension: .absolute(100))
        let group =
                       NSCollectionLayoutGroup.horizontal(layoutSize:
                       groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func createStandardSection()->NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension:
                       .fractionalWidth(1),
                       heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4,
           bottom: 0, trailing: 4)
        let groupSize =
                       NSCollectionLayoutSize(widthDimension:
                       .absolute(390),
                       heightDimension: .absolute(440))
        let group =
                       NSCollectionLayoutGroup.horizontal(layoutSize:
                       groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Array(data.keys).count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array(data.keys).count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch(Array(data.keys)[indexPath.row]){
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! Cell1CollectionViewCell
            cell.imageView.image = UIImage(named: arrData1[indexPath.row])
            cell.labelView.text = "Treko"
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! Cell2CollectionViewCell
            cell.imageView.image = UIImage(named: arrData[indexPath.row])
            cell.labelView.text = "Treko"
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! Cell1CollectionViewCell
            cell.imageView.image = UIImage(named: arrData[indexPath.row])
            cell.labelView.text = "Post"
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth, height: collectionHeight)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
}
