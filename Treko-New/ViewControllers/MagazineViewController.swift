import UIKit

class MagazineViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let reuseIdentifier = "MagazineCell"
    private let data = [
        MagazineCellData(imageName: "mountain1", heading: "Heading 1", description: "Description 1"),
        MagazineCellData(imageName: "mountain2", heading: "Heading 2", description: "Description 2"),
        MagazineCellData(imageName: "mountain3", heading: "Heading 3", description: "Description 3"),
        MagazineCellData(imageName: "mountain4", heading: "Heading 4", description: "Description 4")
    ] // Replace with your own data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    
    private func setupViews() {
        let headingLabel = UILabel()
        headingLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headingLabel.textColor = .black
        headingLabel.text = "Treko"
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headingLabel)
        
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MagazineCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 4),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension MagazineViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MagazineCell
        let cellData = data[indexPath.item]
        cell.configure(with: cellData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width * 0.8
        let height = collectionView.bounds.height * 0.8
        return CGSize(width: width, height: height)
    }
    
}

struct MagazineCellData {
    let imageName: String
    let heading: String
    let description: String
}

class MagazineCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let headingLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        let glassBackgroundView = UIView()
        glassBackgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        glassBackgroundView.layer.cornerRadius = 10
        glassBackgroundView.layer.masksToBounds = true
        glassBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(glassBackgroundView)
        
        headingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headingLabel.textColor = .white
        headingLabel.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        headingLabel.layer.cornerRadius = 10
        headingLabel.layer.masksToBounds = true
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headingLabel)
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .white
        descriptionLabel.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            glassBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            glassBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            glassBackgroundView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            
            headingLabel.leadingAnchor.constraint(equalTo: glassBackgroundView.leadingAnchor, constant: 16),
            headingLabel.trailingAnchor.constraint(equalTo: glassBackgroundView.trailingAnchor, constant: -16),
            headingLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }


    
    func configure(with data: MagazineCellData) {
        imageView.image = UIImage(named: data.imageName)
                guard let imageUrl = URL(string: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg") else {
                    return
                }

                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            if let image = UIImage(data: imageData) {
                                self.imageView.image = image
                            }
                        }
                    }
                }


        headingLabel.text = data.heading
        descriptionLabel.text = data.description
    }
    
}
