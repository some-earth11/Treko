//
//  StoriesFeedTableViewCell.swift
//  Treko-New
//
//  Created by Aryan Singh on 24/03/23.
//

import UIKit

class StoriesFeedTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet var collectionView: UICollectionView!
    
    let userInstance = logged_in_user()
    var arrDataF:[storiesView] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let loggedInUser = userInstance.userDetails
        // Initialization code
        arrDataF = loggedInUser!.stories
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDataF.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesFeedCollectionViewCell
        if(indexPath.row == 0){
            cell.imagesView.clipsToBounds = true
            cell.imagesView.contentMode = UIView.ContentMode.scaleAspectFit
        }else{
            cell.imagesView.clipsToBounds = true
            cell.imagesView.contentMode = UIView.ContentMode.scaleToFill
        }

        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.8
        cell.isSelected = true

        cell.imagesView.image = UIImage(named: arrDataF[indexPath.row].imageName)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/5, height: collectionHeight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
