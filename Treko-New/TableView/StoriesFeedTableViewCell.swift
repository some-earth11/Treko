//
//  StoriesFeedTableViewCell.swift
//  Treko-New
//
//  Created by Aryan Singh on 24/03/23.
//

import UIKit

class StoriesFeedTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet var collectionView: UICollectionView!
    
    var arrData = ["uploadPlus","image_story","image_story","image_story","image_story","image_story","image_story"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesFeedCollectionViewCell
        if(indexPath.row == 0){
            cell.imagesView.clipsToBounds = true
            cell.imagesView.contentMode = UIView.ContentMode.scaleAspectFit
        }
        if(true){
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.8
            cell.isSelected = true
        }
        cell.imagesView.image = UIImage(named: arrData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/5, height: collectionHeight)
    }

}
