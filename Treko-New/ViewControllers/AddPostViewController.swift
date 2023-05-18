import UIKit
import MapKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var postDescription: UITextField!
    @IBOutlet var location: UITextField!
    
    let apiCall = API()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectImageTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Add Image", message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { (_) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (_) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func selectLocationTapped(_ sender: Any) {
        let mapViewController = MapViewController()
        mapViewController.completion = { [weak self] address, coordinate in
//            self.location.text = "address"
        }
        
        let navigationController = UINavigationController(rootViewController: mapViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func addPostClicked(_ sender: Any) {
        if let image = imageView.image,
           let description = postDescription.text,
           let location = location.text,
           !description.isEmpty,
           !location.isEmpty {
            let routeLink = "/addPost/\(defaults.string(forKey: "user")!)"
            let parameters = [
                "description": description,
                "location": location
            ]
            apiCall.POST(parameters: parameters, route: routeLink) { result in
                switch result {
                case .success(let responseData):
                    if responseData["msg"] == "Post added" {
                        self.handleError(msg: "Post Added")
                    } else {
                        self.handleError(msg: responseData["msg"] ?? "Unknown error")
                    }
                case .failure(let error):
                    print("Error:", error)
                    self.handleError(msg: "Error in server")
                }
            }
        } else {
            handleError(msg: "Error: Empty field")
        }
    }
    
    func handleError(msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel) { _ in
                print("Tapped dismiss")
            })
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
class MapViewController: UIViewController, MKMapViewDelegate {

    var mapView: MKMapView!
    var completion: ((String?, CLLocationCoordinate2D?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: view.bounds)
        mapView.delegate = self
        mapView.showsUserLocation = true
        view.addSubview(mapView)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneTapped() {
        if let selectedAnnotation = mapView.selectedAnnotations.first {
            let coordinate = selectedAnnotation.coordinate
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let placemark = placemarks?.first {
                    let address = "\(placemark.name ?? ""), \(placemark.locality ?? ""), \(placemark.administrativeArea ?? "")"
                    self.completion?(address, coordinate)
                } else {
                    self.completion?(nil, nil)
                }
            }
        } else {
            completion?(nil, nil)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
    }
}
