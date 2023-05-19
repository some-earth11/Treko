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
    
    var imageArr = ["mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3","mountain1","mountain2","mountain3",]
    

    
    
    private func populateData() {
        cardData = [
            Card(image: UIImage(named: imageArr.randomElement() ?? ""), title: "Card 1", description: "This is the first card"),
            Card(image: UIImage(named: imageArr.randomElement() ?? ""), title: "Card 2", description: "This is the second card"),
            Card(image: UIImage(named: imageArr.randomElement() ?? ""), title: "Card 3", description: "This is the third card")
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
    }
    
    // MARK: - UI Setup
    
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
            cardCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
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

// MARK: - Custom Cell Classes









// MARK: - Model Classes

struct Card {
    let image: UIImage?
    let title: String
    let description: String
}