//
//  StoriesFeedTableViewCell.swift
//  Treko-New
//
//  Created by Aryan Singh on 24/03/23.
//

import UIKit

class StoriesFeedTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {


    

    @IBOutlet var collectionView: UICollectionView!
    

    var arrDataF:[storiesView] = []
    var encircle = false
    var numOfElements:CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        DispatchQueue.main.async {
            if(indexPath.row == 0){
                cell.imagesView.clipsToBounds = true
                cell.imagesView.contentMode = UIView.ContentMode.scaleAspectFit
            }else{
                cell.imagesView.clipsToBounds = true
                cell.imagesView.contentMode = UIView.ContentMode.scaleToFill
            }
            if(self.encircle){
                cell.imagesView.layer.masksToBounds = false
                cell.imagesView.layer.cornerRadius = cell.imagesView.frame.height/2
                cell.imagesView.layer.borderWidth = 1
                cell.imagesView.layer.borderColor = UIColor.clear.cgColor
                cell.imagesView.clipsToBounds = true
            }else{
                cell.layer.borderColor = UIColor.lightGray.cgColor
                cell.layer.borderWidth = 0.8
                cell.isSelected = true
            }
        }
        
        cell.imagesView.image = UIImage(named: arrDataF[indexPath.row].imageName)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/numOfElements, height: collectionHeight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
