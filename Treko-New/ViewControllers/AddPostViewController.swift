//
//  AddPostViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 06/04/23.
//

import UIKit

class AddPostViewController: UIViewController {

    @IBOutlet var imageLink: UITextField!
    @IBOutlet var postDescription: UITextField!
    @IBOutlet var location: UITextField!
    
    let apiCall = API()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func addPostClicked(_ sender: Any) {
        if(imageLink.text != "" && postDescription.text != "" && location.text != ""){
            let routeLink = "/addPost/\(defaults.string(forKey: "user")!)"
            let parameters = [
                "images":imageLink.text!,
                "description":postDescription.text!,
                "location":location.text!
                ]
            apiCall.POST(parameters: parameters, route: routeLink) { result in
                switch result {
                case .success(let responseData):
                    if(responseData["msg"]! == "Post added"){
                        self.handleError(msg: "Post Added")
                    }else{
                        self.handleError(msg: responseData["msg"]!)
                    }
                case .failure(let error):
                    print("Err",error)
                    self.handleError(msg: "Error in server")
                }
            }
        }else{
            print("Empty field")
            handleError(msg: "Error empty Field")
        }
    }
    func handleError(msg:String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Msg", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: {action in print("Tapped dismiss")}))
            self.present(alert,animated: true)
        }
    }
    

}
