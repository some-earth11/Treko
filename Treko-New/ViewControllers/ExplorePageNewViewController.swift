//
//  ExplorePageNewViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 18/05/23.
//

import UIKit

class ExplorePageNewViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    var imageArr = ["mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3",]
    
    func shuffleArray<T>(_ array: inout [T]) {
        for i in stride(from: array.count - 1, to: 0, by: -1) {
            let j = Int(arc4random_uniform(UInt32(i + 1)))
            if i != j {
                array.swapAt(i, j)
            }
        }
    }
    

    
    private let cellIdentifier = "CellIdentifier"
    private var collectionView: UICollectionView!
    private var searchBar: UISearchBar!

    override func viewDidLoad() {
        imageArr.shuffle()
        super.viewDidLoad()

        // Create the collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2

        // Create the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(collectionView)

        // Create the search bar
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        view.addSubview(searchBar)

        // Set up constraints
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Collection View Data Source

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count // Change this value to the desired number of items
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "Post_viewViewController") as? Post_viewViewController
//        let datas = data[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let secondViewController = storyboard.instantiateViewController(withIdentifier: "Post_viewViewController") as! Post_viewViewController
        
        secondViewController.profile_image = UIImage(named: "profile")!
        secondViewController.location_label = "Location"
        secondViewController.name_label = "Name"
        secondViewController.post_image = UIImage(named: imageArr[indexPath.row])!
              self.present(secondViewController, animated: true, completion: nil)
//        secondViewController.location_label
//

//        vc?.comments =
//        self.navigationController?.pushViewController(vc, animated: true)
//        break;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
//        print(indexPath)
        // Configure the cell with an image
        let imageView = UIImageView(image: UIImage(named: imageArr[indexPath.row]))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = cell.contentView.bounds
        cell.contentView.addSubview(imageView)

        return cell
    }

    // MARK: - Collection View Delegate Flow Layout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 6) / 3 // Adjust the spacing as per your requirement
        let height = width
        return CGSize(width: width, height: height)
    }

    // MARK: - Search Bar Delegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Perform search or filter operation based on the search text
    }
}

