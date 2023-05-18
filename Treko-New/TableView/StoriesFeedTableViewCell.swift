//
//  StoriesFeedTableViewCell.swift
//  Treko-New
//
//  Created by Aryan Singh on 24/03/23.
//

import UIKit

class StoriesFeedTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {



    

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath == [0,0]){
           let imagePicker = UIImagePickerController()
           imagePicker.delegate = self
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
               imagePicker.sourceType = .photoLibrary
               imagePicker.allowsEditing = false
               imagePicker.modalPresentationStyle = .overFullScreen
               // Pass any necessary data to the image picker, if needed

               if let viewController = UIApplication.shared.windows.first?.rootViewController?.topmostViewController {
                   viewController.present(imagePicker, animated: true, completion: nil)
               }
           }}else{
               let storyViewController = StoryviewPageViewController()
               storyViewController.image = UIImage(named: "mountain1") ?? UIImage()
               storyViewController.labelText = "Your text"

               if let topmostViewController = UIApplication.shared.windows.first?.rootViewController?.topmostViewController {
                   topmostViewController.present(storyViewController, animated: true, completion: nil)
               }


           }
       }

     // MARK: - Image Picker Delegate

     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         // Handle the selected image
         if let pickedImage = info[.originalImage] as? UIImage {
             // Do something with the picked image
         }

         picker.dismiss(animated: true, completion: nil)
     }

     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         picker.dismiss(animated: true, completion: nil)
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
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let sender:[String:Any?] = ["image":"image_story"]
//        self.performSegue(withIdentifier: "feedPageStorySegue", sender: sender)
//    }

}

extension UIViewController {
    var topmostViewController: UIViewController {
        if let presentedViewController = presentedViewController {
            return presentedViewController.topmostViewController
        }
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController?.topmostViewController ?? self
        }
        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topmostViewController ?? self
        }
        return self
    }
}
