import UIKit

class CardViewController: UIViewController {
    var image: UIImage?
    var multiLineTextSample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien enim, vestibulum eu congue quis, ultricies non nulla. Aenean iaculis, lorem quis varius pharetra, mi diam fringilla nulla, eu dictum ligula libero ut nulla. Aliquam vitae nibh sit amet turpis ornare blandit. Morbi posuere faucibus ex. Integer commodo tempus pharetra. Sed cursus vel lorem vel sodales. Suspendisse sit amet ligula ante. Sed placerat massa non feugiat sodales. Nunc mattis, massa vitae lacinia scelerisque, purus libero bibendum sapien, id tristique nisl lacus a turpis. In laoreet bibendum libero. Maecenas at elit egestas dolor porta tristique quis vel ligula."

    private let headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Heading"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFill
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()

      private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
//          button.backgroundColor(
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
      }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    updateGradientLayerFrame()
  }

  private func setupUI() {
    view.backgroundColor = .white

      view.addSubview(headingLabel)
    view.addSubview(imageView)
    view.addSubview(backButton)

    let overlayView = UIView()
    overlayView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(overlayView)

    let gradientLayer = CAGradientLayer()
      
    
    
      var elements: [CGColor] = []

      for i in 0...100 {
          let alpha = CGFloat(i) / 100.0
          let color = UIColor.black.withAlphaComponent(alpha).cgColor
          elements.append(color)
      }
      
      let counts = [1, 5, 5, 10, 15, 25, 30, 20, 20, 30, 30, 5, 10, 15, 5, 20, 10, 15, 20, 10, 30, 15, 5, 10, 30, 25, 20, 10, 5, 20, 30, 15, 10, 5, 20, 10, 30, 15, 5, 20, 10, 25, 30, 5, 15, 10, 20, 5, 30, 15, 25, 10, 5, 20, 30, 15, 5, 10, 25, 20, 30, 5, 15, 10, 20, 5, 30, 15, 25, 10, 5, 20, 30, 15, 5, 10, 25, 20, 30, 5, 15, 10, 20, 5, 30, 15, 25, 10, 5, 20, 30, 15, 5, 10, 25, 20, 30, 5, 15, 10, 20, 5, 30, 15, 25]


      let array = Array(zip(elements, counts).flatMap { Array(repeating: $0, count: $1) })
 
      
    gradientLayer.colors = array

      let stepSize = 1.0 / Double(array.count - 1)
      let locations = (0..<array.count).map { NSNumber(value: Double($0) * stepSize) }

      gradientLayer.locations = locations
      
    overlayView.layer.addSublayer(gradientLayer)

    let textView = UITextView()
    textView.text = multiLineTextSample
    textView.textColor = .white
    textView.font = UIFont.systemFont(ofSize: 16)
    textView.backgroundColor = .clear
    textView.isEditable = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    overlayView.addSubview(textView)
      
      NSLayoutConstraint.activate([
             headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
             headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             headingLabel.heightAnchor.constraint(equalToConstant: 50),
         ])

    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])

    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      backButton.widthAnchor.constraint(equalToConstant: 60),
      backButton.heightAnchor.constraint(equalToConstant: 30),
    ])

    NSLayoutConstraint.activate([
      overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      overlayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
    ])

    NSLayoutConstraint.activate([
      textView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16),
      textView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
      textView.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 16),
      textView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -16),
    ])

    imageView.image = image
  }

  private func updateGradientLayerFrame() {
    guard let overlayView = view.subviews.last else { return }
    if let gradientLayer = overlayView.layer.sublayers?.first as? CAGradientLayer {
      gradientLayer.frame = overlayView.bounds
    }
  }

  @objc private func backButtonTapped() {
    dismiss(animated: true, completion: nil)
  }
}
