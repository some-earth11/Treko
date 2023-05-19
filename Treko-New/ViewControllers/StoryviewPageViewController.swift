import UIKit

class StoryviewPageViewController: UIViewController {
    
    private var imageView: UIImageView!
    private var textLabel: UILabel!
    
    var image: UIImage?
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // Image view setup
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        
        // Label setup
        textLabel = UILabel(frame: CGRect(x: 0, y: 50, width: view.bounds.width, height: 50))
        textLabel.textAlignment = .center
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel.text = labelText
        view.addSubview(textLabel)
        
        // Add a tap gesture recognizer to dismiss the view controller
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}
