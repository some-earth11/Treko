//
//  TrekViewController.swift
//  Treko-New
//
//  Created by Samarth Kumar on 30/03/23.
//

import UIKit

class TrekViewController: UIViewController {

//    var slides: [Trek] = []
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var nextButton: UIButton!
//    @IBOutlet weak var pageControl: UIPageControl!
//    var currentPage = 0 {
//        didSet{
//            pageControl.currentPage = currentPage
//            if currentPage == slides.count - 1{
//                nextButton.setTitle("Get Started", for: .normal)
//            }else{
//                nextButton.setTitle("Next", for: .normal)
//            }
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
////        collectionView.delegate = self
////        collectionView.dataSource = self
//        let catImage = UIImage(named: "trekking_1.jpeg")
//        slides = [
//            Trek(TrekName: "Delicious Dishes",  image: catImage!),
//            Trek(TrekName: "Delicious Dishes",  image: catImage!),
//            Trek(TrekName: "Delicious Dishes",  image: catImage!)
//                ]
//    }
//    
//    @IBAction func NextButtonClicked(_ sender: Any) {
//        if currentPage == slides.count - 1{
//            print("Go to the next page!")
//            performSegue(withIdentifier: "Login", sender: self)
//        }else{
//            currentPage += 1
//            let indexPath = IndexPath(item: currentPage, section: 0)
//            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        }
//    }
//    
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//extension TrekViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int{
//        return slides.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrekCollectionViewCell.identifier, for: indexPath) as! TrekCollectionViewCell
//        cell.setup(slides[indexPath.row])
//        
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let width = scrollView.frame.width
//        currentPage = Int(scrollView.contentOffset.x / width)
//    }
}
