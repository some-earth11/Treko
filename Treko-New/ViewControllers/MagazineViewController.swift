import UIKit

class MagazineViewController: UIViewController {
    
    // MARK: - Properties
    private var cardData: [Card] = []
     private var gridData: [UIImage?] = []
    
    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private let cardCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let gridCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        return searchBar
    }()
    

    
    var imageArr = ["mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9","mountain1","mountain2","mountain3","mountain4","mountain5","mountain6","mountain7","mountain8","mountain9",]

    
    
    var multiLineTextSample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien enim, vestibulum eu congue quis, ultricies non nulla. Aenean iaculis, lorem quis varius pharetra, mi diam fringilla nulla, eu dictum ligula libero ut nulla. Aliquam vitae nibh sit amet turpis ornare blandit. Morbi posuere faucibus ex. Integer commodo tempus pharetra. Sed cursus vel lorem vel sodales. Suspendisse sit amet ligula ante. Sed placerat massa non feugiat sodales. Nunc mattis, massa vitae lacinia scelerisque, purus libero bibendum sapien, id tristique nisl lacus a turpis. In laoreet bibendum libero. Maecenas at elit egestas dolor porta tristique quis vel ligula."
    

    
    
    private func populateData() {
        cardData = [
            Card(image: UIImage(named: imageArr.randomElement() ?? "")!, title: "Card 1", description: "This is the first card", multilineText: multiLineTextSample),
            Card(image: UIImage(named: imageArr.randomElement() ?? "")!, title: "Card 2", description: "This is the second card", multilineText: multiLineTextSample),
            Card(image: UIImage(named: imageArr.randomElement() ?? "")!, title: "Card 3", description: "This is the third card", multilineText: multiLineTextSample)
        ]

        gridData = [
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? ""),
            UIImage(named: imageArr.randomElement() ?? "")
        ]
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        populateData()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gridCollectionViewTapped(_:)))
             gridCollectionView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - UI Setup
    
    @objc private func gridCollectionViewTapped(_ sender: UITapGestureRecognizer) {
          let indexPath = gridCollectionView.indexPathForItem(at: sender.location(in: gridCollectionView))
          
          if let indexPath = indexPath {
              let selectedImage = gridData[indexPath.item]
              
              let cardViewController = CardViewController()
              cardViewController.image = selectedImage
              cardViewController.modalPresentationStyle = .overFullScreen
              
              present(cardViewController, animated: true, completion: nil)
          }
      }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Treko"
        
        collectionViewLayout.scrollDirection = .horizontal
        
        cardCollectionView.setCollectionViewLayout(collectionViewLayout, animated: false)
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.showsHorizontalScrollIndicator = false
        cardCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.showsHorizontalScrollIndicator = false
        gridCollectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: "GridCollectionViewCell")
        
        view.addSubview(searchBar)
        view.addSubview(cardCollectionView)
        view.addSubview(gridCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            cardCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            cardCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2.3) // Change the multiplier to 1/3
        ])
        
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: cardCollectionView.bottomAnchor, constant: 8),
            gridCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(tabBarController?.tabBar.frame.height ?? 0))
        ])
    }

}

// MARK: - UICollectionViewDataSource

extension MagazineViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cardCollectionView {
            return cardData.count
        } else if collectionView == gridCollectionView {
            return gridData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cardCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
            let card = cardData[indexPath.item]
            cell.configure(with: card)
            return cell
        } else if collectionView == gridCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
            let image = gridData[indexPath.item]
            cell.configure(with: image)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MagazineViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cardCollectionView {
            let width = view.frame.width - 16
            let height = cardCollectionView.frame.height - 16
            return CGSize(width: width, height: height)
        } else if collectionView == gridCollectionView {
            let width = (view.frame.width - 24) / 3
            let height = width
            return CGSize(width: width, height: height)
        }
        return CGSize.zero
    }
}
